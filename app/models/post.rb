class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true

  def score
    votes.sum("value") 
  end
end
