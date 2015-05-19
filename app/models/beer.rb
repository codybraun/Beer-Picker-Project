class Beer < ActiveRecord::Base
  has_many :ratings
  belongs_to :brewery
  
  validates :name, :uniqueness => true, :allow_nil => false, :presence => true
  validates :description, :presence => true
  validates :image_url, :presence => true
  validates :brewery, :allow_nil => false, :presence => true
  
end
