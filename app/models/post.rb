class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
end
