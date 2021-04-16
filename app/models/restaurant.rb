class Restaurant < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true

  def self.search(search)
    if search
      restaurant = Restaurant.find_by(name: search)
      if restaurant
        self.where(name: restaurant)
      else
        @restaurants = Restaurant.all
      end
    else
      @restaurants = Restaurant.all
    end
  end

  def vote_up
    if self[:upVoteCount] == nil
      self[:upVoteCount] = 1
    else
      self[:upVoteCount] += 1
    end
  end

  def vote_down
    if self[:downVoteCount] == nil
      self[:downVoteCount] = 1
    else
      self[:downVoteCount] += 1
    end
  end
end
