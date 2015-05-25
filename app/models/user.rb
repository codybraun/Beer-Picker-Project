class User < ActiveRecord::Base
  has_many :ratings
  has_many :badges
  has_many :followers, :through => :follows
  has_many :followeds, :through => :follows
  validates :email, :uniqueness => true, :allow_nil => false, :presence => true
  validates :password, :presence => true
  validates :username, :uniqueness => true, :allow_nil => false, :presence => true
  has_secure_password
end
