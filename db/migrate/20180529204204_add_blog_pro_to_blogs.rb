class AddBlogProToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blog_pro, :integer, default: 0
  end
end
