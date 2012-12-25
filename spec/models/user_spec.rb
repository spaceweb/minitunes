require 'spec_helper'

describe User do
  
  fixtures :users

  describe "UserModel" do
    it "a user should enter a name" do
      user = User.new
      assert !user.save
      assert !user.errors[:name].empty?
    end

    it "a user should enter a profile name" do
      user = User.new
      assert !user.save
      assert !user.errors[:profile_name].empty?
    end

    it "a user should a unique profile name" do
      user = User.new
      user.profile_name = users(:charlie).profile_name
      assert !user.save
      assert !user.errors[:profile_name].empty?
    end

    it "a user should have a profile name without spaces" do
      user = User.new
      user.profile_name = "My+profile"
      assert !user.save
      assert !user.errors[:profile_name].empty?
      assert user.errors[:profile_name].include?("Must be formatted correctly.")
    end
  end
end