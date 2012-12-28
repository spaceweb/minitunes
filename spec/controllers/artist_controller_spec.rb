
require 'spec_helper'

describe ArtistController do
  fixtures :artists
  before :each do
    @fake_shakira = artists(:shakira)
  end
  
  describe 'Add a Artist' do
    Artist.should_receive(:add).and_return(@fake_shakira)
    post :create, {:artist => @fake_shakira}
    assert_response render_template('artists#show')
    flash[:notice].should == "Shakira was successfully added to your collection!"	
  end
  
  
  
  
  
  
end
