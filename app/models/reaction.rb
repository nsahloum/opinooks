class Reaction < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	belongs_to :debat
end
