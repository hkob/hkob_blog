class AddUserIdToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :user_id, :integer, null: false
    add_index :articles, :user_id
  end
end
