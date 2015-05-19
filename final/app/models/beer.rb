class Beer < ActiveRecord::Base
  has_many :ratings
  belongs_to :brewery
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :image_url
  validates_presence_of :brewery
end
