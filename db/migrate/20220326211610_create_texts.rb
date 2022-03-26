class CreateTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :texts do |t|
      t.string :body
      t.string :token

      t.timestamps
    end
    add_index :texts, :token
  end
end
