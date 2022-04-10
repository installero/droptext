module SnippetHelper
  def markdown_class(snippet)
    "language-#{snippet.markdown}" unless snippet.auto_markdown?
  end
end
