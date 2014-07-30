class Vote < ActiveRecord::Base
  validates :value, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  def remove_or_modify(new_value)
    if persisted? && value == new_value
      destroy
    else
      update(value: new_value)
    end
  end
end
