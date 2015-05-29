class Beer < ActiveRecord::Base
  has_many :ratings, :dependent => :delete_all #obviously need to delete ratings for non existent beers
  belongs_to :brewery
  validates :name, :uniqueness => true, :allow_nil => false, :presence => true
  validates :description, :presence => true
  validates :image_url, :presence => true
  
end
