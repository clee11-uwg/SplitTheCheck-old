class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :votes
  has_many :favorites


  # def add_up_vote(user_id)
  #   #vote 1 = upvote, vote 2 = downvote
  #   self.votes.create(vote: 1, user_id: user_id)
  # end
  #
  # def willSplitCount
  #   self.votes.count{ |x| x == 1}
  # end
end
