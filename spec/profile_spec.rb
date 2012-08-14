describe RubyGamertag::Profile do
  use_vcr_cassette('Profile_Major+Nelson')
  
  it "Getting profile info" do  
    profile = RubyGamertag::Profile.new('Major+Nelson')

    profile.Gamertag.should =~ /Major Nelson/i
    profile.is_online.should == [false, "Last seen 8/11/2012 playing My Xbox LIVE"]
    profile.is_cheater.should == false
    profile.GamerScore.should == 59017
    profile.avatars.should == {'Tile' => 'http://avatar.xboxlive.com/avatar/Major%20Nelson/avatarpic-s.png', 'Small' => 'http://avatar.xboxlive.com/avatar/Major Nelson/avatarpic-s.png', 'Large' => 'http://avatar.xboxlive.com/avatar/Major Nelson/avatarpic-l.png', 'Body' => 'http://avatar.xboxlive.com/avatar/Major Nelson/avatar-body.png'}
    profile.Bio.should == ""
  end
end
