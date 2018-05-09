class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit destroy update]
  def index
    @categories = Category.all
  end

  def edit
    respond_with(@category)
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Your category was successful created!'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      respond_with(@category, location: -> { @category }, notice: 'Your category was successful updated!')
    else
      render :edit
    end
  end

  def destroy
    if @category.delete
      respond_with(:ok, location: -> { categories_path }, notice: 'Your category was successful deleted!')
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
