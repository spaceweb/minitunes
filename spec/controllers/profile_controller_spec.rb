
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
      assert_response :not_found #It whould fails always
    end

    it "only shows the correct user's collection of favorites artists" do
      get :show, id: users(:dean).profile_name
      assigns[:artists].each do |artist| # Bug: have to fail ;)
        assert_equal users(:dean), artist.user
      end
    end
  end


end

