class Restaurant < ApplicationRecord
  validates :name, :address, :city, :state, :zip, presence: true

  def self.search(search)
    if (search)

    else

    end
  end
end
