require 'spec_helper'

describe UserArtistController do
  include Devise::TestHelpers
  fixtures :artists
  fixtures :users
  fixtures :adds
  before :each do
  @fake_shakira = artists(:shakira)
  @fake_charlie = users(:charlie)
  @fake_relation = adds(:relation)
  end
  describe "#create" do
      
    it "when not logged in redirect to the login page" do
      post :create
      assert_response :redirect
      assert_redirected_to login_path
    end

    context "when logged in" do
      before(:each) do
        sign_in @fake_charlie
        post :create, id: @fake_shakira.id
      end
      
      it "assign a variable @artist" do
          assert_equal @fake_shakira, assigns(:artist)
      end
      
      it "creates relationship between User-Artist" do
        r = @fake_shakira.adds.build
        @fake_charlie.adds.send(:<<, r)
        @fake_charlie.adds.include?(@fake_shakira) == true
        
      end
  
      it "redirect to the artist page" do
        assert_response :redirect
        assert_redirected_to "/artists/#{@fake_shakira.name}"
      end

      it "set the flash success message" do
        flash[:notice].should == "#{@fake_shakira.name} was successfully added in your collection!"
      end
    end
  end

  describe "#destroy" do
    context "when logged in" do
      before(:each) do
        sign_in @fake_charlie
        post :destroy, id: @fake_shakira.id
      end
  
      it "assign a variable @artist" do
        assert_equal @fake_shakira, assigns(:artist)
      end
 
      it "seek the relationship we are interested and assign a variable -> relation" do
        assert_equal @fake_relation1, assigns(Add.find_all_by_user_id(@fake_charlie.id) & Add.find_all_by_artist_id(@fake_shakira.id))
      end
  
      it "call but this relation to method destroy" do
        @fake_relation.stub(:destroy).and_return(true)
      end
    
      it "redirect to the artist page" do
        assert_response :redirect
        assert_redirected_to "/artists/#{@fake_shakira.name}"
      end

      it "set the flash success message" do
        flash[:notice].should == "#{@fake_shakira.name} was successfully deleted"
      end	
      
    end   
  end
  
end
