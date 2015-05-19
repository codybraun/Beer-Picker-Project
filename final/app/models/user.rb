class User < ActiveRecord::Base
  has_many :users, :through => :follow
  
  validates :email, :uniqueness => true, :allow_nil => false, :presence => true
  validates :password, :presence => true
  
end
