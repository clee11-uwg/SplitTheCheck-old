class Restaurant < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true
  attr_writer :upVoteCount

  def self.search(search)
    if (search)

    else

    end
  end

  def vote_up
    self[:upVoteCount] += 1
  end
end
