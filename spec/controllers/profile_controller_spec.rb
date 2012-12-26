
require 'spec_helper'

describe ProfileController do
  
  fixtures :users
  
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
    get :show, id: users(:charlie).profile_name
    assigns[:artists].each do |artist|
      assert_equal users(:charlie), artist.user
    end
  end


end

