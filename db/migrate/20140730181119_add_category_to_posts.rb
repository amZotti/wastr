class AddCategoryToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :category, index: true, null: false
  end
end
