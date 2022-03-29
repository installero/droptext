class RenameTextTokenToUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :texts, :token, :url
  end
end
