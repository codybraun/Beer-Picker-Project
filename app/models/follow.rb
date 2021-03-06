class Follow < ActiveRecord::Base
  belongs_to :user
  validates :follower_id, :presence => true
  validates :followed_id, :presence => true
end
