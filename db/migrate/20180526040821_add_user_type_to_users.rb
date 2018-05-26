class AddUserTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_type, :integer, default: 1
  end
end
