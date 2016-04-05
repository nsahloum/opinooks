class Reaction < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	belongs_to :debat
	 def self.highest_voted
        self.order("cached_votes_score DESC")
    end
end
