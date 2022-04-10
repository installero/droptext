class AddMarkdownToSnippets < ActiveRecord::Migration[7.0]
  def change
    change_table :snippets do |t|
      t.string :markdown, null: false, default: 'auto'
    end
  end
end
