class AddParentIdAndParentTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :integer
    add_column :comments, :parent_type, :string
    add_index :comments, :parent_id
    add_index :comments, :parent_type

    comments = Comment.all
    comments.each { |comment| comment.parent = comment.post }

    change_column :comments, :parent_id, :integer, null: false
    change_column :comments, :parent_type, :string, null: false
  end
end
