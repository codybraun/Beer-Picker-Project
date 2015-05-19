class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  
  validates :stars, :allow_nil => false, :presence => true
  validates :beer_id, :presence => true
  
end
