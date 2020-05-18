class Game
  attr_accessor :difficulty, :player_name, :word, :scaffold, :guess

  def initialize
    @difficulty = 0
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

  def turn_infos
    Dialog.turn_message
    @scaffold.display
    @word.crypted
    @word.length
  end

  def guess_a_letter(letter = gets.chomp)
    @guess = @word.self_word.include?(letter)
  end

  def point_update
    @scaffold.level_up unless @guess
  end

  private

  GRID_LEVEL = {1 => 'easy', 2 => 'medium', 3 => 'hard'}.freeze

end

#Game.new.perform