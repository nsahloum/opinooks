class Debat < ActiveRecord::Base
     
    acts_as_votable
    belongs_to :user
    has_many :reactions, :dependent => :destroy
    def to_param
        "#{id} #{title}".parameterize
    end
    def self.highest_voted
        self.order("cached_votes_score DESC")
    end
end
