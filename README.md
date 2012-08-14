# RubyGamertag

An interface for accessing your XBOX Live profile and game data.

## Install 

```ruby
gem install rubygamertag
```

Gemfile:

```ruby
require 'rubygamertag'
```

## Usage

#Get Profile Info:
<pre><code>
profile = RubyGamertag::Profile.new("GAMERTAG")
  profile.tier
  profile.is_cheater
  profile.is_online
  profile.avatars
  profile.GamerScore
  profile.Reputation
  profile.Name
  profile.Motto
  profile.Bio
  profile.Location
</code></pre>

#Retrieve User Game Stats:
<pre><code>
games = RubyGamertag::Games.new("GAMERTAG")
  games.Gamerpic
  games.GameCount
  games.TotalEarnedGamerScore
  games.TotalPossibleGamerScore
  games.TotalEarnedAchievements
  games.TotalPossibleAchievements
  games.TotalPercentCompleted
  games.played_games.each do |game|
    game.id
    game.title
    game.url
    game.art
    game.earned_gamerscore
    game.possible_gamerscore
    game.earned_achievements
    game.possible_achievements
    game.percentage_completed
    game.last_played
  end
</code></pre>

#Get Friend Lists/Info:
<pre><code>
friends = RubyGamertag::Friends.new("GAMERTAG")
  friends.TotalFriends
  friends.TotalOnlineFriends
  friends.TotalOfflineFriends
  friends.friends.each do |friend|
    friend.gamertag
    friend.avatars
    friend.gamerscore
    friend.is_online
    friend.last_online
    friend.online_status
    friend.game_title # <--These are for their most recently played game
    friend.game_id
    friend.game_url
  end
</code></pre>

## Documentation
    
## Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
 * Send me a pull request.
 

## Copyright

Copyright (c) 2012 Jacob Williams