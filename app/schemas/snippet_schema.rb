SnippetSchema = Dry::Schema.Params do
  config.messages.backend = :i18n
  config.messages.namespace = :snippet

  required(:body).filled
  required(:language).filled
end
