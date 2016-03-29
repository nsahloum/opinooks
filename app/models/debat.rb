class Debat < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
    def to_param
        "#{id} #{title}".parameterize
    end
end
