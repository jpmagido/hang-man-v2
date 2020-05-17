#require './lib/dialog.rb'

class Game
  attr_accessor :difficulty, :player_name, :word, :scaffold

  def initialize
    @difficulty = 0
    @player_name = ''
    @scaffold = Scaffold.new
  end

  def perform
    start
    create_player
    chose_difficulty
  end

  def start
    puts Dialog.start_game_message
  end

  def create_player(input_player = gets.chomp)
    puts Dialog.player_name_message
    print '> '
    @player_name = input_player
    puts "Welcome dear #{@player_name}, game is starting soon"
  end

  def chose_difficulty(input_player = gets.chomp.to_i)
    puts Dialog.chose_difficulty
    print '> '
    @difficulty = input_player until @difficulty.between?(1, 3)
    puts "Difficulty will be #{GRID_LEVEL[@difficulty]}"
    @word = Word.new(@difficulty)
  end

  def turn
    Dialog.turn_message
    @scaffold.display
    @word.crypted
    @word.length
  end

  private

  GRID_LEVEL = {1 => 'easy', 2 => 'medium', 3 => 'hard'}.freeze

end

#Game.new.perform