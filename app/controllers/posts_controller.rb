class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @category = Category.find(post_params[:category_id])
    post = current_user.posts.create(post_params).merge(category_id: @gategory.id)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @reply = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :id,
    )
  end
end
