class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]
end
