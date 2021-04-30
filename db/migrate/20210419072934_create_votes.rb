class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :vote
      t.integer :user_id
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
