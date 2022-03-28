class AddUniqIndexTokenToTexts < ActiveRecord::Migration[7.0]
  def change
    remove_index :texts, :token
    add_index :texts, :token, unique: true
  end
end
