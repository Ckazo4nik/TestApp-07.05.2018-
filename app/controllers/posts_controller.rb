class PostsController < ApplicationController
  before_action :find_category, only: [:new, :create, :destroy, :update, :edit]
  before_action :find_post, only: [:show,:edit, :destroy, :update]

  def index
    respond_with(@posts = Post.all)
  end

  def show
    respond_with(@post)
  end

  def new
    respond_with(@post = Post.new)
  end
  
  def edit
    respond_with(@post)
  end

  def create
    @post = @category.posts.create(post_params.merge(user_id: current_user.id))
    if @post.save
      respond_with @category, location: -> { @category }, notice: "Your post was successful created!"
    else
      render :new
    end
  end
  
  def update
    if @post.update(post_params)
      respond_with @category, location: -> { @category }, notice: "Your post was successful updated!"
    else
      render :new
    end
  end
  
  def destroy
    if @post.delete
      respond_with :ok, location: -> { @category }, notice: "Your post was successful deleted!"
    else
      render :new
    end
  end
  private
  def find_category
    @category = Category.find(params[:category_id])
  end
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:name, :content, :image, :user_id, :category_id)
  end
end
