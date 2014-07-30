class UpvotesController < ApplicationController
  def create
    vote = current_user.votes.find_or_initialize_by(post_id: params[:post_id])
    vote.remove_or_modify(1)
    post = Post.find(params[:post_id])
    render json: { score: post.score, post_id: post.id }
  end
end
