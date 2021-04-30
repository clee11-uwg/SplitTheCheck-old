class Vote < ApplicationRecord
  belongs_to :user, :restaurant
end
