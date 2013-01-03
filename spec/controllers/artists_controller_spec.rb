require 'spec_helper'

describe ArtistsController do

  fixtures :artists
  describe 'create' do
    before :each do
      @fake_results = artists(:shakira)
    end

    it 'should call the model method that performs search artist' do
      Artist.should_receive(:find_by_name).and_return(@fake_results)
      post :create, name: 'Shakira'
    end

    describe 'After valid search' do
      before :each do
        Artist.stub(:find_by_name).and_return(@fake_results)
        post :create, name: artists(:shakira).name
      end
      it 'should select the Search Results template for rendering' do
        response.should redirect_to "/artists/#{@fake_results.name}"
      end
      it 'should make the search results available to that template' do
        assigns(:artist).should == @fake_results
      end
    end

    describe 'After a invalid search' do
      it 'should call the model method that performs search artist in last.fm' do
        Artist.stub(:find_by_name).and_return([])
        Artist.should_receive(:find_by_name).and_return(@fake_results)
        post :create, name: artists(:shakira).name
      end

      describe 'After valid search in last.fm' do
        before :each do
          Artist.stub(:find_in_lastfm).and_return(@fake_results)
          post :create, name: artists(:shakira).name
        end
        it 'should select the Search Results template for rendering' do
          response.should redirect_to "/artists/#{@fake_results.name}"
        end
        it 'should make the search results available to that template' do
          assigns(:artist).should == @fake_results
        end
      end

      describe 'After a invalid search in last.fm' do
        before :each do
          Artist.stub(:find_in_lastfm).and_return([])
          post :create
        end
        it 'should redirect to index' do
          response.should redirect_to root_path
        end
        it 'should see a message for search results' do
          flash[:notice].should == "Shakira was not found"
        end
      end
    end
  end

end
