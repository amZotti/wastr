class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :parent, polymorphic: true
  has_many :comments, as: :parent, dependent: :destroy
  has_many :replies, class_name: "Comment", foreign_key: "parent_id", as: :parent

  delegate :email, to: :user

  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true
  validates :parent, presence: true

  def self.chronological
    order(created_at: :desc)
  end
end
