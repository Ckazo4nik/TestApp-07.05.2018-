class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_parent, only: :create
  respond_to :js
  # authorize_resource

  def create
    @comment = @parent.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with(@comment)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    parent = @comment.commentable
    @comment.destroy
    redirect_to category_post_path(parent.category, parent) if parent.is_a?(Post)
    redirect_to parent if parent.is_a?(Category)
  end

  private

  def load_parent
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent ||= Category.find(params[:category_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
