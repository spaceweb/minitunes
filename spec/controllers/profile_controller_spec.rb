
require 'spec_helper'

describe ProfilesController do
  
  describe "#show" do
    include Devise::TestHelpers
    fixtures :users

    before(:each) do
      sign_in users(:charlie)
    end
  
    it "should get show" do
      get :show, id: users(:charlie).profile_name
      assert_response :success
      assert_template 'profiles/show'
    end

    it "should render a not found on profile view" do
      get :show, id: "does't exist"
      assert_response :not_found
    end

    it "only shows the correct user's collection of favorites artists" do
      get :show, id: users(:dean).profile_name
      assigns[:artists].each do |artist|
        assert_equal Artist.where(id: Add.where(user_id: users(:dean))).include?(artist)
      end
    end

    it "only shows the correct user's following" do
      get :show, id: users(:dean).profile_name
      assigns[:following].each do |follow|
        assert users(:dean).friends.include?(follow)
      end
    end
  end


end

