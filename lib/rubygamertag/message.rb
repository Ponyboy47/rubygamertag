require 'net/http'
require 'json'

module RubyGamertag
  class Message # This hasn't been implemented yet and does not work. DO NOT USE
    def initialize(gamertag,message)
      send(gamertag,message)
    end

    private

    def send(gamertag,message)      
      uri = URI.parse("http://www.xboxleaders.com/api/message/")
      Net::HTTP.post_form(uri,{"to_gamertag" => "#{gamertag}", "message" => "#{message}"})
    end
  end
end
