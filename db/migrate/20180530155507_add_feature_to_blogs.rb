class AddFeatureToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :feature, :integer, default: 0
  end
end
