require 'spec_helper'

describe ArtistsController do

  fixtures :artists
  fixtures :users
  fixtures :albums
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
        @fake_shakira = artists(:shakira)
        Artist.stub(:find_in_lastfm).with('Shakira').and_return(@fake_shakira)
        post :create, {:search => "Shakira"}
      end
      
      it 'should select the Search Results template for rendering' do
        Artist.stub(:create!).and_return(@fake_shakira)
      end
            
      it "should create a relationship between Artist-Albums after of search the albums for this artist" do 
        Artist.stub(:find_top_albums_in_lastfm).with('Shakira').and_return(albums(:loba))
        Album.stub(:create!).and_return(albums(:loba))
        r = albums(:loba).participates.build
        @fake_shakira.participates.send(:<<, r)
        @fake_shakira.participates.include?(albums(:loba)) == true
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
