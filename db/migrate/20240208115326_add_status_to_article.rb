class AddStatusToArticle < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :string, null: false
  end
end
