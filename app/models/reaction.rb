class Reaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :debat
end
