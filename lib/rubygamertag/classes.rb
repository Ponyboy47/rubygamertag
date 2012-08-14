class Game
  include RubyGamertag
  attr_accessor :id, :title, :url, :art, :earned_gamerscore, :possible_gamerscore, :earned_achievements, :possible_achievements, :percentage_completed, :last_played

  def id=(value)
    @id = value
  end
  def title=(value)
    @title = value
  end
  def url=(value)
    @url = value
  end
  def art=(value)
    @art = value
  end
  def earned_gamerscore=(value)
    @earned_gamerscore = value
  end
  def possible_gamerscore=(value)
    @possible_gamerscore = value
  end
  def earned_achievements=(value)
    @earned_achievements = value
  end
  def possible_achievements=(value)
    @possible_achievements = value
  end
  def percentage_completed=(value)
    @percentage_completed = value
  end
  def last_played=(value)
    @last_played = value
  end
end

class Achievement
  include RubyGamertag
  attr_accessor :id, :title, :img, :description, :gamerscore, :is_secret, :unlocked, :date_earned, :earned_offline
  
  def id=(value)
    @id = value
  end
  def title=(value)
    @title = value
  end
  def img=(value)
    @img = value
  end
  def description=(value)
    @description = value
  end
  def gamerscore=(value)
    @gamerscore = value
  end
  def is_secret=(value)
    @is_secret = value
  end
  def unlocked=(value)
    @unlocked = value
  end
  def date_earned=(value)
    @date_earned = value
  end
  def earned_offline=(value)
    @earned_offline = value
  end
end

class Friend
  include RubyGamertag
  attr_accessor :gamertag, :avatars, :gamerscore, :is_online, :last_online, :online_status, :game_title, :game_id, :game_url

  def gamertag=(value)
    @gamertag = value
  end
  def avatars=(value)
    @avatars = value
  end
  def gamerscore=(value)
    @gamerscore = value
  end
  def is_online=(value)
    @is_online = value
  end
  def presence_info=(value)
    @presence_info = value
  end
  def last_online=(value)
    @last_online = value
  end
  def online_status=(value)
    @online_status = value
  end
  def game_title=(value)
    @game_title = value
  end
  def game_id=(value)
    @game_id = value
  end
  def game_url=(value)
    @game_url = value
  end
end
