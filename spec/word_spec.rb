require './lib/word.rb'

RSpec.describe Word do
  let(:word_level_1) { Word.new(1) }
  let(:word_level_2) { Word.new(2) }
  let(:word_level_3) { Word.new(3) }

  subject { Word.new }

  context 'initialization' do
    it 'should create a word with proper attributes' do
      subject
      expect(subject.instance_variable_get(:@self_word)).not_to be_nil
      expect(subject.self_word.class).to eq(String)
      expect(subject.instance_variable_get(:@self_word).class).to eq(String)
      expect(subject.instance_variable_get(:@self_word)).not_to be_empty
      expect(subject.instance_variable_get(:@length)).to eq(subject.self_word.length)
    end

    it 'should create a word based on difficulty' do
      expect(word_level_1.length).to be <= 5
      expect(word_level_2.length).to eq 7
      expect(word_level_3.length).to be >= 9
    end

    it 'should have a crypted format' do
      expect(subject.instance_variable_get(:@crypted)).not_to be_nil
      expect(subject.instance_variable_get(:@crypted).class).to eq(Hash)
    end

    it 'should encrypt the word' do
      expect(subject.crypted.values.map(&:first).join).to eq(subject.self_word)
      expect(subject.crypted.values.map(&:last).join).to eq('_' * subject.self_word.length)
      expect(subject.crypted.length).to eq(subject.self_word.length)
    end
  end

  context 'During the game' do

    it 'should return boolean when letter is guessed' do
      subject.self_word = 'balancer'
      expect(subject.guess_letter('a')).to be(true)
      expect(subject.guess_letter('y')).to be(false)
    end
  end
end
