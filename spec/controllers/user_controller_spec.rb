
require 'spec_helper'

describe ApplicationController do
  
  include Devise::TestHelpers
  
  fixtures :users
  
  it "should opens the login page when is /login" do
    get '/login'
    assert_response :success
  end

  it "should opens the logout page when is /logout" do
    get '/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end

  it "should opens the sign up page when is /register" do
    get '/register'
    assert_response :success
  end

  it "that profile page works" do
    get '/charlie_profile'
    assert_response :success
  end
 
end

