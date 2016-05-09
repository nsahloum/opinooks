class Debat < ActiveRecord::Base

    acts_as_votable
    belongs_to :user
    has_many :reactions, :dependent => :destroy
    def to_param
        "#{id} #{title}".parameterize
    end
    def self.search(search)
        where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    end
end
