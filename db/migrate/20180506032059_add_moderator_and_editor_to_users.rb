class AddModeratorAndEditorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :editor, :boolean, default: false
    add_column :users, :banned, :boolean, default: false
  end
end
