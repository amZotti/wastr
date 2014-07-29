class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :replies, as: :parent, class_name: "Comment"

  validates :title, presence: true
  validates :body, presence: true

  def score
    votes.sum("value") 
  end
>>>>>>> Make comments on posts polymorphic
end
