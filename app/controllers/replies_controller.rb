class RepliesController < ApplicationController
  def create
    parent = Comment.find(params[:comment_id])
    post = parent.post
    post.comments.create(reply_params.merge(parent: parent))
    redirect_to post
  end

  private

  def reply_params
    params.require(:comment).permit(
      :body,
    ).merge(user_id: current_user.id)
  end
end
