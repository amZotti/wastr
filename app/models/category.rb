class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :message, presence: true, length: { maximum: 500 }
  validates :intro, presence: true, length: { maximum: 1500 }

  belongs_to :user
end
