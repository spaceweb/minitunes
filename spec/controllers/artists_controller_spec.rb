require 'spec_helper'

describe ArtistsController do

  fixtures :artists
  fixtures :users
  include Devise::TestHelpers
  describe 'create' do


    it "with no search_id redirect to the site root when the user is not registered" do
      post :create
      assert_redirected_to root_path
      assert_equal flash[:notice], "You search '' did not match anything on MiniTunes"
    end

    it "with no search_id redirect to the site root when the user is registered" do
      sign_in users(:charlie)
      post :create
      assert_redirected_to profile_path(users(:charlie).profile_name)
      assert_equal flash[:notice], "You search '' did not match anything on MiniTunes"
    end

    context "with a valid search_id (on DataBase)" do
      before(:each) do
        post :create, search: artists(:shakira).name
      end

      it "assign a variable @artist" do
        assert_equal artists(:shakira), assigns(:artist)
      end

      it "redirect to the profile artist" do
        assert_response :redirect
        assert_redirected_to artist_path(artists(:shakira).name)
      end
    end

    describe 'After valid search in lastfm' do
      before :each do
        @Melendi_lastfm = mock("artist_search",{"name"=>"Melendi","bio" =>{"summary"=>"summary"}})
        @Melendi = mock('Artist',:name=>'Melendi',:description=>'summary')
        Artist.stub(:find_by_name).with('Melendi').and_return(nil)
        Artist.stub(:find_by_name).with('MELENDI').and_return(nil)
        Artist.stub(:find_in_lastfm).with('Melendi').and_return(@Melendi_lastfm)
        post :create, {:search => "Melendi"}
      end
      it "assign a variable artist" do
        assert_not_empty assigns(:artist)
      end
      it 'should select the Search Results template for rendering' do
        Artist.should_receive(:create).with(@Melendi)
      end
    end


    describe 'After a invalid search in lastfm' do
      before :each do
        Artist.stub(:find_in_lastfm).and_raise(Lastfm::ApiError.new("The artist you supplied could not be found"))
        post :create, search: "NotFound"
      end
      it 'should see a message for search results' do
        flash[:notice].should == "You search 'NotFound' did not match anything on MiniTunes"
      end
    end

    describe 'When API key is invalid' do
      before :each do
        Artist.stub(:find_in_lastfm).and_raise(Lastfm::ApiError.new("Invalid API key - You must be granted a valid key by last.fm"))
        post :create,  search: "NotFound"
      end
      it 'should see a message for search results' do
        flash[:warning].should == "Search not available."
      end
    end
  end

end
