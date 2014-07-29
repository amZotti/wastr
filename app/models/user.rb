class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
=======
  has_many :posts
  has_many :categories

  def allowed_to_modify_category?(category)
    category_owner?(category)
  end

  private

  def category_owner?(category)
    category.user_id == id
  end
>>>>>>> User can create categories
end
