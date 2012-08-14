require 'net/http'
require 'json'

module RubyGamertag
  class Achievements

    def initialize(gamertag)
      @ids = get_ids(fetch_game_ids(@gamertag))
      @achievements = fetch(@gamertag, @ids)
    end
    
    def self.from_json(data)
      if data.kind_of?(Array)
        for x in (0..data.count) do
          data[x] = JSON.parse(data[x])
          new(data[x]['Data'], data[x])
        end
      else
        data = JSON.parse(data)
        new(data['Data'], data)
      end
      return data
    end

    def method_missing(method_name, args = nil)
      missing_method = []
      for x in (0..@achievements.count) do
        missing_method << @achievements[x][method_name.to_s]
      end
      return missing_method
    end

    def get_ids(id)
      game_ids = []
      id['PlayedGames'].each do |game|
        game_ids << achievement['Id']
      end
      return game_ids
    end

    def achievements
      @game_achievements = []
      x = 0
      @achievements['Achievements'].each do |achievement|
        @game_achievements[x] = Achievement.new
        @game_achievements[x].id = achievement['Id']
        @game_achievements[x].title = achievement['Title']
        @game_achievements[x].img = achievement['TileUrl']
        @game_achievements[x].description = achievement['Description']
        @game_achievements[x].gamerscore = achievement['GamerScore']
        @game_achievements[x].is_secret = achievement['IsSecret']
        @game_achievements[x].unlocked = achievement['Unlocked']
        @game_achievements[x].date_earned = achievement['DateEarned']
        @game_achievements[x].earned_offline = achievement['EarnedOffline']
        x = x+1
      end
      return @game_achievements
    end

    private
    
    def fetch(gamertag,ids)
      for x in (0..ids.count) do 
        uri = URI.parse("http://www.xboxleaders.com/api/achievements/#{gamertag}/#{ids[x]}.json")
        response = Net::HTTP.get_response(uri)
        hash[x] = JSON.parse(response.body)
        hash[x]['Data']
      end
      return hash
    end

    def fetch_game_ids(gamertag)
      uri = URI.parse("http://www.xboxleaders.com/api/games/#{gamertag}.json")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      hash['Data']
    end
  end
end
