require './lib/dialog.rb'
require './lib/player.rb'

class Game
  attr_accessor :player, :difficulty

  def initialize
    @difficulty = 0
  end

  def perform
    start
    create_player
    chose_difficulty
  end

  def start
    puts Dialog.start_game_message
  end

  def create_player
    puts Dialog.player_name_message
    print '> '
    @player = Player.new($stdin.gets.chomp)
    puts "Welcome dear #{@player.name}, game is starting soon"
  end

  def chose_difficulty
    puts Dialog.chose_difficulty
    print '> '
    @difficulty = $stdin.gets.chomp.to_i until @difficulty.between?(1, 3)
    puts "Difficulty will be #{@difficulty}"
  end
end

Game.new.perform