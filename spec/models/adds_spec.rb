require 'spec_helper'

describe Add do
  
  fixtures :users
  fixtures :artists
  before :each do
    @fake_shakira = artists(:shakira)
    @fake_charlie = users(:charlie)
  end

  it "creates relationship between User-Artist" do
    r = @fake_shakira.adds.build
    @fake_charlie.adds.stub(:<<).with(r)
    @fake_charlie.adds.include?(@fake_shakira) == 'True'
  end
end