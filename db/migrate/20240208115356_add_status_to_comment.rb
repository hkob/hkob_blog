class AddStatusToComment < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :status, :string, null: false
  end
end
