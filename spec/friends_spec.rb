describe RubyGamertag::Friends do
  use_vcr_cassette('Friends_Major+Nelson')
  
  it "Retrieve data about friends" do
    friends = RubyGamertag::Friends.new('Major+Nelson')

    friends.TotalFriends.should == 100
    friends.friends[0].gamertag.should == "Zeus"
    friends.friends[1].is_online.should == false
  end
end
