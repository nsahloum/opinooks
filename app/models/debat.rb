class Debat < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
    has_many :reactions
    def to_param
        "#{id} #{title}".parameterize
    end
end
