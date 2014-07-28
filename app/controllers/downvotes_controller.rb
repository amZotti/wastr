class DownvotesController < ApplicationController
  def update
    post = Post.find(params[:post_id])
    post.subtract_vote
    @posts = Post.all
    render "posts/index"
  end
end
