require './lib/word.rb'

RSpec.describe Word do

  subject { Word.new }

  context 'initialization' do
    it 'should create a word' do
      subject
      expect(subject.instance_variable_get(:@word)).not_to be_nil
      expect(subject.instance_variable_get(:@word)).not_to be_empty
      expect(subject.instance_variable_get(:@length)).to eq(subject.word.length)
    end
  end
end
