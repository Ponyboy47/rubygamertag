require 'net/http'
require 'json'

module RubyGamertag
  class Games

    def initialize(gamertag)
      @games = fetch(gamertag)
    end
    
    def self.from_json(data)
      data = JSON.parse(data)
      new(data['Data'], data)
    end
    
    def method_missing(method_name, args = nil)
      @games[method_name.to_s]
    end

    def played_games
      @played_games = []
      x = 0
      @games['PlayedGames'].each do |game|
        @played_games[x] = Game.new
        @played_games[x].id = game['Id']
        @played_games[x].title = game['Title']
        @played_games[x].url = game['Url']
        @played_games[x].art = {'BoxArt' => game['BoxArt'], 'LargeBoxArt' => game['LargeBoxArt']}
        @played_games[x].earned_gamerscore = game['EarnedGamerScore']
        @played_games[x].possible_gamerscore = game['PossibleGamerScore']
        @played_games[x].earned_achievements = game['EarnedAchievements']
        @played_games[x].possible_achievements = game['PossibleAchievements']
        @played_games[x].percentage_completed = game['PercentageCompleted']
        @played_games[x].last_played = game['LastPlayed']
        x = x+1
      end
      return @played_games
    end

    private
    
    def fetch(gamertag)      
      uri = URI.parse("http://www.xboxleaders.com/api/games/#{gamertag}.json")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      hash['Data']
    end
  end
end
