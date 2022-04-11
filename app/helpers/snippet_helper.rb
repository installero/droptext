module SnippetHelper
  def language_class(snippet)
    "language-#{snippet.language}" unless snippet.auto_language?
  end
end
