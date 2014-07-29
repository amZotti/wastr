class UpvotesController < ApplicationController
  def create
    vote = current_user.votes.find_or_initialize_by(post_id: params[:post_id])
    vote.update_attributes(polarity: 1)
    redirect_to :posts
  end
end
