class CategoriesController < ApplicationController
	before_action :find_category, only: [:show, :edit, :delete, :update]
	def index
		@categories = Category.all
	end
	def edit
	end
	def show
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to @category, notice: "Your category was successful created!"
		else
			render :new
		end
	end
	def update
	end
	def destroy
	end
	private
	def category_params
		params.require(:category).permit(:name, :description)
	end
	def find_category
		@category = Category.find(params[:id])
	end
end
