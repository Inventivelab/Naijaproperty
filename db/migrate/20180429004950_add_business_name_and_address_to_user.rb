class AddBusinessNameAndAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_address, :text
    add_column :users, :gender, :string
    add_column :users, :dateofbirth, :datetime
  end
end
