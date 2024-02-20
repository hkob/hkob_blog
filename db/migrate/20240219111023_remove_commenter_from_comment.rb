class RemoveCommenterFromComment < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :commenter, :string
  end
end
