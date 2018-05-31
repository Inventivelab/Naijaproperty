class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :is_authorized, only: [:edit, :update, :destroy]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.recent
    @blogs_featured = Blog.where(feature: 1).recent_updated.limit(3)
    @blogs_pro = Blog.where(blog_pro: 1).recent_updated.limit(3)
  end

  def new
    @blog = Blog.new
  end

  def create

    @blog = current_user.blogs.build(blog_params)
    @blog.user = current_user
    if @blog.save
      redirect_to blogs_path, notice: "Your post has been created successfully..."
      #redirect_to listing_listing_path(@listing), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong, your post could not be created!"
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    if @blog.update(blog_params)
      flash[:success] = "Blog has been updated"
      redirect_to @blog
    else
      flash.now[:alert] = "Blog has not been updated"
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      flash[:success] = "Blog has been deleted"
      redirect_to @blog
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :user_id, :blog_pro, :blog_feature, :feature)
  end

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def is_authorized
    redirect_to blogs_path, alert: "You don't have permission" unless current_user_admin? || current_user.id == @blog.user_id
  end
end
