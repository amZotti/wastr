class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :replies, as: :parent, class_name: "Comment"

  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true

  def score
    votes.sum("value")
  end

  def post
    self
  end
end
