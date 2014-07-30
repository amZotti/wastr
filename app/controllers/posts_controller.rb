class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    post = current_user.posts.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @reply = Comment.new
    @comment = Comment.new
    @category = Category.find(@post.category_id)
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :category_id,
    )
  end
end
