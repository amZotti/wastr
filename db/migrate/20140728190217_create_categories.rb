class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.text :message, null: false
      t.text :intro, null: false
      t.integer :user_id, null: false

      t.timestamps 
    end
    add_index :categories, :name, unique: true
    add_index :categories, :user_id
  end
end
