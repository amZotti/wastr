class CommentsController < ApplicationController
  def create
    parent = find_parent
    comment = current_user.comments.create(comment_params.merge(parent: parent, post: parent.post))
    redirect_to parent.post
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def find_parent
    find_post || find_comment
  end

  def find_post
    Post.find_by(id: params[:post_id])
  end

  def find_comment
    Comment.find_by(id: params[:comment_id])
  end

  def comment_params
    params.require(:comment).permit(
      :body,
    )
  end
end
