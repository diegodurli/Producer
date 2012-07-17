class Admin::CategoriesController < Admin::AdminController

  before_filter :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    respond_with @categories
  end

  def new
    @category = Category.new
    respond_with @category
  end

  def edit
  end

  def create
    @category = Category.new(params[:category])
    flash[:notice] = 'Category was successfully created.' if @category.save
    respond_with @category, :location => admin_categories_path
  end

  def update
    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params[:category])
    respond_with @category, :location => admin_categories_path
  end

  def destroy
    @category.destroy
    respond_with @category, :location => admin_categories_path
  end
  
  protected
  
  def load_category
    @category = Category.find(params[:id])
  end
end