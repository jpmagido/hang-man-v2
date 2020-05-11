class Player
  attr_accessor :name

  def initialize
    @name = ''
  end

  def choose_name
    @name = gets.chomp
  end

end