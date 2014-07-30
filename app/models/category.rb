class Category < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :message, presence: true, length: { maximum: 500 }
  validates :intro, presence: true, length: { maximum: 1500 }
end
