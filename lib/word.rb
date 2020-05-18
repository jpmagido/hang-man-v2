require 'ffaker'

class Word
  attr_accessor :length, :self_word, :crypted, :guessed_letter, :all_guesses

  def initialize(level = 1)
    @self_word = word_difficulty(level).downcase
    @length = @self_word.length
    @crypted = to_crypt(@self_word)
    @all_guesses = []
  end

  def guess_letter(letter = gets.chomp)
    @guessed_letter = letter
    @all_guesses << letter
    update_crypted_attribute
    @self_word.include?(letter)
  end


  def update_crypted_attribute
    @crypted
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