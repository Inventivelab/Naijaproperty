class AddSuperadminToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :superadmin, :boolean, :null => false, :default => false

    User.create! do |r|
      r.email      = 'admin@naijapro.com'
      r.password   = 'password'
      r.first_name = 'Said'
      r.last_name = 'Fola'
      r.username = 'said_admin'
      r.superadmin = true
    end
  end

  def down
    remove_column :users, :superadmin
    User.find_by_email('admin@naijapro.com').try(:delete)
  end
end
