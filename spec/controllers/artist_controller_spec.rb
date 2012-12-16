
require 'spec_helper'

describe ArtistController do
  describe 'Add a Artist' do
    @result = mock('artist', :name => 'Shakira')
      
    Artist.should_receive(:add).and_return(@result)
    post :add, {:artist => @result}
    response.should redirect_to(profile_path)
    flash[:notice].should == "Shakira was successfully added."	
  end
  
  
  
  
  
  
end
