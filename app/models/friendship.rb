class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name:'User', foreign_key: 'friend_id'
  validates :user_id, presence: true
  validates :friend_id, presence: true
  attr_accessible :user, :friend, :friend_id, :user_id
  validates_uniqueness_of :user_id, :scope => :friend_id
end

