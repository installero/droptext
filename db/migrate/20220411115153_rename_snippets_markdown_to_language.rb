class RenameSnippetsMarkdownToLanguage < ActiveRecord::Migration[7.0]
  def change
    rename_column :snippets, :markdown, :language
  end
end
