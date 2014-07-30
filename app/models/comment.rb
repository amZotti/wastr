class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comments, as: :parent, dependent: :destroy
  has_many :replies,  class_name: "Comment", foreign_key: "parent_id", as: :parent
  belongs_to :parent, polymorphic: true

  delegate :email, to: :user

  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true
  validates :parent, presence: true
end
