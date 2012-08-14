describe RubyGamertag::Games do
  use_vcr_cassette('Games_RealJBlaze')
  
  it "Get Games info" do
    games = RubyGamertag::Games.new('RealJBlaze')

    games.Gamertag.should =~ /RealJBlaze/i
    games.PlayedGames.count.should == 121
    games.played_games[0].title.should == "Call Of Duty 3"
    games.played_games[1].last_played.should == 1203471596
  end
end
