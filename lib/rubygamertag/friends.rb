require 'net/http'
require 'json'

module RubyGamertag
  class Friends

    def initialize(gamertag)
      @friends = fetch(gamertag)
    end
    
    def self.from_json(data)
      data = JSON.parse(data)
      new(data['Data'], data)
    end
    
    def method_missing(method_name, args = nil)
      @friends[method_name.to_s]
    end

    def friends
      @all_friends = []
      x = 0
      @friends['Friends'].each do |friend|
        @all_friends[x] = Friend.new
        @all_friends[x].gamertag = friend['Gamertag']
        @all_friends[x].avatars = {'Small' => friend['AvatarSmall'], 'Large' => friend['AvatarLarge']}
        @all_friends[x].gamerscore = friend['Gamerscore']
        @all_friends[x].is_online = friend['IsOnline']
        @all_friends[x].last_online = friend['PresenceInfo']['LastOnline']
        @all_friends[x].online_status = friend['PresenceInfo']['OnlineStatus']
        @all_friends[x].game_title = friend['PresenceInfo']['Game']['Title']
        @all_friends[x].game_id = friend['PresenceInfo']['Game']['Id']
        @all_friends[x].game_url = friend['PresenceInfo']['Game']['Url']
      x = x+1
      end
      return @all_friends
    end

    private
    
    def fetch(gamertag)      
      uri = URI.parse("http://www.xboxleaders.com/api/friends/#{gamertag}.json")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      hash['Data']
    end
  end
end
