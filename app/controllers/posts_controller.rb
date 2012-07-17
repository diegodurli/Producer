class PostsController < ApplicationController
  
  before_filter :categories

  def index
    @posts = Post.scoped
    @posts = @posts.search(params[:search]) if params[:search]
    @posts = @category.posts if @category.present?
    @posts = @posts.published

    respond_with @posts
  end

  def show
    @post = Post.published.find(params[:id])
    respond_with @post
  end

  protected

  def categories
    @categories = Category.all
    @category   = Category.find(params[:category_id]) if params[:category_id]
  end
end