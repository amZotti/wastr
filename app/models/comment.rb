class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comments, as: :parent
  has_many :replies,  class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, polymorphic: true


  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true
end
