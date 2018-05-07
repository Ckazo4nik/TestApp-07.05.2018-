class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to @post, notice: "Your post was successful created!"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
