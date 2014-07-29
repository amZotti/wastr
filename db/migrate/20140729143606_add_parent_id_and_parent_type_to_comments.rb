class AddParentIdAndParentTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :integer, null: false
    add_column :comments, :parent_type, :string, null: false
    add_index :comments, :parent_id
    add_index :comments, :parent_type
  end
end
