class AddSocialFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :pinterest, :string
    add_column :users, :instagram, :string
    add_column :users, :googleplus, :string
    add_column :users, :youtube, :string
    add_column :users, :whatsapp, :string
    add_column :users, :blackberry, :string
  end
end
