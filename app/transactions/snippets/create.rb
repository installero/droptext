module Snippets
  class Create < BaseTransaction
    TOKEN_LENGHT = 3

    step :validate
    step :persist

    def validate(input)
      validation = SnippetSchema.(input[:params])

      if validation.success?
        Success(input)
      else
        Failure(validation.errors)
      end
    end

    def persist(input)
      snippet = Snippet.create!(token: generate_token, **input[:params])

      Success(snippet: snippet)
    rescue ActiveRecord::RecordNotUnique
      retry
    end

    private

    def generate_token
      SecureRandom.alphanumeric(TOKEN_LENGHT)
    end
  end
end
