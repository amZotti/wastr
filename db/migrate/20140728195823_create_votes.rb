class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :polarity, null: false, default: 0
      t.integer :post_id, null: false

      t.timestamps null: false
    end
    add_index :votes, [:post_id, :user_id], unique: true
  end
end
