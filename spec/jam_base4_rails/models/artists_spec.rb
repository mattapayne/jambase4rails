require File.dirname(__FILE__) + '/../../spec_helper'

describe JamBase4Rails::Artists do
  
  def multiple_artists_hash
    {"artist" => 
        [
        {"artist_id" => "1", "artist_name" => "Something"},
        {"artist_id" => "2", "artist_name" => "Something Else"}
      ]}
  end
  
  def single_artist_hash
    {"artist" => {"artist_id" => "1", "artist_name" => "Something"}}
  end
  
  it "should be empty if the attributes passed to its constructor are nil" do
    artists = JamBase4Rails::Artists.new(nil)
    artists.should have(0).items
  end
  
  it "should be empty if the attributes passed to its constructor are empty" do
    artists = JamBase4Rails::Artists.new({})
    artists.should have(0).items
  end
  
  it "should be empty if the attributes passed to its do not contain the artist key" do
    artists = JamBase4Rails::Artists.new({"artist_id" => "1", "artist_name" => "something"})
    artists.should have(0).items
  end
  
  it "should not have 0 items if the attributes passed to its contructor are not nil or empty" do
    artists = JamBase4Rails::Artists.new(multiple_artists_hash)
    artists.should_not be_empty
  end
  
  it "should properly create multiple model objects" do
    artist = JamBase4Rails::Model.new("Artist", {"artist_id" => "1", "artist_name" => "Something"})
    JamBase4Rails::Model.should_receive(:new).exactly(2).times.and_return(artist)
    JamBase4Rails::Artists.new(multiple_artists_hash)
  end
  
  it "should properly create a single artist" do
    artist = JamBase4Rails::Model.new("Artist", {"artist_id" => "1", "artist_name" => "Something"})
    JamBase4Rails::Model.should_receive(:new).exactly(1).times.and_return(artist)
    JamBase4Rails::Artists.new(single_artist_hash)
  end
  
end