require 'spec_helper'

describe ReviewsController do
  include Devise::TestHelpers
  fixtures :artists
  fixtures :users

  it "when not logged in redirect to the login page" do
    post :create, name: artists(:shakira).name
    assert_response :redirect
    assert_redirected_to login_path
  end

  context "when logged in" do
    before(:each) do
      @fake_shakira = artists(:shakira)
      @fake_charlie = users(:charlie)
      sign_in users(:charlie)
      post :create, name: artists(:shakira).name
    end

    it "assign a variable @artist" do
      assert_equal @fake_shakira, assigns(:artist)
    end

    it "creates relationship between User-Artist" do
      r = @fake_shakira.reviews.build
      @fake_charlie.reviews.send(:<<, r)
      @fake_charlie.reviews.include?(@fake_shakira) == true
    end

    it "redirect to the artist page" do
      assert_response :redirect
      assert_redirected_to "/artists/#{@fake_shakira.name}"
    end

    it "set the flash success message" do
      flash[:notice].should == "Review successfully created."
    end
  end
end