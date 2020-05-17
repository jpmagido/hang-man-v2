require 'ffaker'

class Word
  attr_accessor :length, :word, :crypted

  def initialize(level = 1)
    @word = word_difficulty(level)
    @length = @word.length
    @crypted = to_crypt(@word)
  end

  def guess_letter(letter = gets.chomp)
    @word.include?(letter)
  end

  private

  def word_difficulty(input)
    case
    when input == 1
      FFaker::LoremFR.words(50).detect { |word| word.length == 5 }
    when input == 2
      FFaker::LoremFR.words(50).detect { |word| word.length == 7 }
    else
      FFaker::LoremFR.words(50).detect { |word| word.length >= 9 }
    end
  end

  def to_crypt(input)
    encrypted_word = {}
    input.chars.map.with_index { |l, i| encrypted_word[i] = [l, '_'] }
    encrypted_word
  end
end