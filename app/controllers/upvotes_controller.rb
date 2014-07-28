class UpvotesController < ApplicationController
  def update
    post = Post.find(params[:post_id])
    post.add_vote
    @posts = Post.all
    render "posts/index"
  end
end
