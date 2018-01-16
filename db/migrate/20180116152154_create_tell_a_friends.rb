class CreateTellAFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :tell_a_friends do |t|
      t.string :your_name
      t.string :friend_name
      t.string :friend_email
      t.string :subject
      t.string :message
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
