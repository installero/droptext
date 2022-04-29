module Snippets
  class Create < BaseTransaction
    TOKEN_LENGHT = 3
    MINIMUM_RECAPTCHA_SCORE = 0.75
    BASE_REACAPTCHA_URL = 'https://www.google.com/recaptcha/api/siteverify'.freeze

    step :check_recaptcha
    step :validate
    step :persist

    def check_recaptcha(input)
      secret_key = ENV['RECAPTCHA_SECRET_KEY']
      token = CGI.escape(input.dig(:params, :snippet)&.delete(:recaptcha_token).to_s)

      recaptcha_url = URI.parse(BASE_REACAPTCHA_URL)
      recaptcha_url.query = { secret: secret_key, response: token}.to_query

      response = HTTParty.get(recaptcha_url)
      json = JSON.parse(response.body, symbolize_names: true)

      return Success(input) if json[:success] && json[:score] >= MINIMUM_RECAPTCHA_SCORE && json[:action] == 'callback'

      Failure(errors: [I18n.t('recaptcha.error')])
    end

    def validate(input)
      validation = SnippetSchema.(input.dig(:params, :snippet))

      if validation.success?
        input[:params][:snippet] = validation.to_h

        Success(input)
      else
        Failure(errors: validation.errors.to_h.values.flatten)
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
