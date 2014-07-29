class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.replies.create(comment_params)
    redirect_to post
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
    ).merge(
        user_id: current_user.id,
        post_id: params[:post_id],
      )
  end
end
