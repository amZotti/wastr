class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories

  def allowed_to_modify?(object)
    is_owner?(object)
  end

  private

  def is_owner?(object)
    object.user_id == id
  end
end
