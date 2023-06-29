module Snippets
  class Create < BaseTransaction
    TOKEN_LENGHT = 3
    UNSAFE_WORDS = %w[password token key secret mnemonic пароль]

    step :validate
    step :check_unsafe_words
    step :persist

    def validate(input)
      validation = SnippetSchema.(input.dig(:params, :snippet))

      if validation.success?
        input[:params][:snippet] = validation.to_h

        Success(input)
      else
        Failure(errors: validation.errors.to_h.values.flatten)
      end
    end

    def check_unsafe_words(input)
      return Success(input) if input[:params][:skip_check_unsafe_words].present?

      unsafe_words =
        input[:params][:snippet][:body].downcase.scan(%r{#{UNSAFE_WORDS.join('|')}}).uniq

      if unsafe_words.empty?
        Success(input)
      else
        Failure(unsafe_words: unsafe_words)
      end
    end

    def persist(input)
      token = Snippet.create!(token: generate_token, **input[:params][:snippet]).token

      Success(token: token)
    rescue ActiveRecord::RecordNotUnique
      retry
    end

    private

    def generate_token
      SecureRandom.alphanumeric(TOKEN_LENGHT)
    end
  end
end
