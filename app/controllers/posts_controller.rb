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
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @reply = Comment.new
    @comment = Comment.new
    @category = Category.find(@post.category_id)
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.allowed_to_modify?(post)
      post.destroy
      redirect_to root_path
    else
      render :post 
    end
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
