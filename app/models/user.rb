class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :debats, :dependent => :destroy
  has_many :reactions, :dependent => :destroy
  acts_as_voter
  validates_uniqueness_of :name
  def to_param
      "#{id} #{name}".parameterize
  end
end
