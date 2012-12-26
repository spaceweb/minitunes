
require 'spec_helper'

describe Devise::SessionsController do
  
  fixtures :users
  
  it "should opens the login page when is /login" do
      get("/login").should route_to("devise/sessions#new")
  end
  
  it "should opens the logout page when is /logout" do
    get('/logout').should route_to("devise/sessions#destroy")
  end

  it "should opens the sign up page when is /register" do
      get("/register").should route_to("devise/registrations#new")
  end

  it "that profile page works" do
    get("/charlie_profile").should route_to("profile#show")
  end
 
end

