require 'spec_helper'

describe Friend do
  
  fixtures :users

  it "creates a friendship" do
    Friend.create user_id: users(:charlie).id, friend_id: users(:dean).id
    users(:charlie).friends.include?(users(:dean).id)
  end
end