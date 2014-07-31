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
    @category = Category.find(params[:id])
    if ! current_user.allowed_to_modify?(@category)
      redirect_to :posts
    end
  end

  def update
    @category = Category.find(params[:id])
    if current_user.allowed_to_modify?(@category)
      update_category(@category)
    else
      redirect_to :posts
    end
  end

  def destroy
    category = Category.find(params[:id])
    if current_user.allowed_to_delete?(category)
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

  def update_category(category)
    if category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end
end
