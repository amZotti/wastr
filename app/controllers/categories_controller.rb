class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create(category_params)
    redirect_to @category
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.categories.find(params[:id])
    if ! current_user.allowed_to_modify_category?(@category)
      redirect_to :posts
    end
  end

  def update
    @category = Category.find(params[:id])
    if current_user.allowed_to_modify_category?(@category)
      if @category.update(category_params)
        redirect_to @category
      else
        render :edit
      end
    else
      redirect_to :posts
    end
  end

  def destroy
    category = Category.find(params[:id])
    if current_user.allowed_to_modify_category?(category)
      category.destroy
      redirect_to :posts
    else
      redirect_to :posts
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :title,
      :description,
      :message,
      :intro,
    )
  end
end
