require './lib/dialog.rb'
require './lib/player.rb'

class Game
  attr_accessor :player

  def perform
    start
    create_player
  end

  def start
    puts Dialog.start_game_message
  end

  def create_player
    puts Dialog.player_name_message
    print '> '
    @player = Player.new(gets.chomp)
    puts "Welcome #{@player.name} "
  end
end

Game.new.perform