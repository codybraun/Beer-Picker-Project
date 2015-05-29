class User < ActiveRecord::Base
  has_many :ratings, :dependent => :delete_all #assume people who leave the site want their reviews taken down
  has_many :badges, :dependent => :delete_all #can definitely delete these without users 
  has_many :followers, :through => :follows
  has_many :followeds, :through => :follows
  validates :email, :uniqueness => true, :allow_nil => false, :presence => true
  validates :password, :presence => true
  validates :username, :uniqueness => true, :allow_nil => false, :presence => true
  has_secure_password
end
