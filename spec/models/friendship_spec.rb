require 'spec_helper'

describe Friend do
  
  fixtures :users

  it "creates a friendship" do
    Friendship.create user_id: users(:charlie).id, friend_id: users(:dean).id
    users(:charlie).friends.include?(users(:dean))
  end
end