class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :business_name, :string
    add_column :users, :address, :string
    add_column :users, :website, :string
    add_column :users, :bio, :text
  end
end
