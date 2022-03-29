class RenameTextTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :texts, :snippets
  end
end
