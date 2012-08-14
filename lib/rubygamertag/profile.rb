require 'net/http'
require 'json'

module RubyGamertag
  class Profile

    def initialize(gamertag)
      @profile = fetch(gamertag)
    end
    
    def self.from_json(data)
      data = JSON.parse(data)
      new(data['Data'], data)
    end
    
    def method_missing(method_name, args = nil)
      @profile[method_name.to_s]
    end

    def tier
      tier = @profile['Tier']
      tier[0].to_upcase
      return tier
    end

    def is_cheater
      if @profile['IsCheater'] == 0
        return false
      else
        return true
      end
    end

    def is_online
      if @profile['IsOnline'] == 0
        online = [false, @profile['OnlineStatus']]
        return online
      else
        online = [true, @profile['OnlineStatus']]
        return online
      end
    end

    def avatars
      avatars = {'Tile' => @profile['AvatarTile'], 'Small' => @profile['AvatarSmall'], 'Large' => @profile['AvatarLarge'], 'Body' => @profile['AvatarBody']}
      return avatars
    end

    private
    
    def fetch(gamertag)      
      uri = URI.parse("http://www.xboxleaders.com/api/profile/#{gamertag}.json")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      hash['Data']
    end
  end
end
