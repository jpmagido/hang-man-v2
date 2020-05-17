require 'ffaker'

class Word
  attr_accessor :length, :word

  def initialize
    @word = FFaker::LoremFR.words(10)
    @length = @word.length
  end
end