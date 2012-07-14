class PostsController < ApplicationController

  before_filter :load_post     , only: [:show, :edit, :update, :destroy]
  before_filter :load_resources, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    respond_with @post
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def edit
  end

  def create
    @post = Post.new(params[:post])

    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with @post
  end

  def update
    flash[:notice] = 'Post was successfully updated.' if @post.update_attributes(params[:post])
    respond_with @post
  end

  def destroy
    @post.destroy
    respond_with @post
  end
  
  protected

  def load_post
    @post = Post.find(params[:id])
  end

  def load_resources
    @categories = Category.all
    @authors    = User.all
  end
end