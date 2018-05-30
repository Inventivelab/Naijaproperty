class AddBlogFeatureToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blog_feature, :integer, default: 0
  end
end
