require 'faker'

class Word
  attr_accessor :length, :word

  def initialize
    @word = Faker::Movies::HarryPotter.spell
    @length = @word.length
  end
end