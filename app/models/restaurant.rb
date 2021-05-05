class Restaurant < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true
  has_many :votes

  # def self.search(search)
  #   if search
  #     restaurant = Restaurant.find_by(name: search)
  #     if restaurant
  #       self.where(name: restaurant)
  #     else
  #       @restaurants = Restaurant.all
  #     end
  #   else
  #     @restaurants = Restaurant.all
  #   end
  # end

  def add_up_vote
    if self[:upVoteCount] == nil
      self[:upVoteCount] = 1
    else
      self[:upVoteCount] += 1
    end
  end

  def add_down_vote
    if self[:downVoteCount] == nil
      self[:downVoteCount] = 1
    else
      self[:downVoteCount] += 1
    end
  end
end
