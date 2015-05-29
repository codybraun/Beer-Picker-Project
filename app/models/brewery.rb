class Brewery < ActiveRecord::Base
  has_many :beers, :dependent => :delete_all #probably makes sense to delete all beers belonging to a brewery that closes
  validates_presence_of :name
  validates :name, :uniqueness => true
end
