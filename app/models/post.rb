class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
 
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  def subtract_vote
    self.downvote += 1
    save
  end  

  def add_vote
    self.upvote += 1
    save
  end

  def votes
    self.upvote - self.downvote
  end
end
