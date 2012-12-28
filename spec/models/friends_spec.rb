require 'spec_helper'

describe Friend do
  
  fixtures :users

  should belong_to(:user)
  should belong_to(:friend)

  it "creates a friendship" do
    Friend.create user: users(:charlie), friend: users(:dean)
    assert users(:charlie).friends.include?(users(:dean))
  end
end