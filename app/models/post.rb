class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :replies, as: :parent, class_name: "Comment"

  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true

  delegate :email, to: :user

  def score
    votes.sum("value")
  end

  def post
    self
  end

  def self.chronological
    order(created_at: :desc)
  end

  def self.date_sort
    chronological
  end

  def self.vote_sort
    order(votes: :desc)
  end
end
