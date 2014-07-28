class CommentsController < ApplicationController
  def create
    comment = current_user.comments.create(comment_params)
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
    ).merge(post_id: params[:post_id])
  end
end
