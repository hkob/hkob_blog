class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :commenter, null: false
      t.text :body, null: false
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
