class User < ActiveRecord::Base
  has_many :users, :through => :follow
end
