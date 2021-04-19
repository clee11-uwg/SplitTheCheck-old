class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :upVoteUserCount
      t.integer :downVoteUserCount
      t.timestamps
    end
  end
end
