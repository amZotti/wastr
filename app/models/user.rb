class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories

  def allowed_to_modify?(object)
    is_owner?(object)
  end

  def allowed_to_delete?(object)
    is_owner?(object)
  end

  def allowed_to_modify_category?(category)
    category_owner?(category)
  end

  private

  def is_owner?(object)
    object.user_id == id
  end
end
