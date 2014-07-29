class Vote < ActiveRecord::Base
  validates :value, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end
