class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.int :upVoteCount
      t.int :downVoteCount

      t.timestamps
    end
  end
end
