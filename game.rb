require './lib/dialog.rb'
require './lib/player.rb'

class Game
  attr_accessor :player_name

  def start
    puts Dialog.start_game_message
  end

  def create_player
    puts Dialog.player_name_message
    print '> '
    @player_name = Player.new.choose_name
  end
end