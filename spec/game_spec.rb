require './game.rb'
require './lib/dialog.rb'
require './lib/scaffold.rb'
require './lib/word.rb'

RSpec.describe Game do
  context 'Start game' do

    subject { Game.new }

    it 'should initialize the game' do
      subject
      expect(subject.difficulty).to eq(0)
      expect(subject.player_name).to eq('')
    end

    it 'should display start Dialog' do
      allow(Dialog).to receive(:start_game_message)
      subject.start
      expect(Dialog).to have_received(:start_game_message)
    end
  end

  context 'define parameters of the game' do
    let(:number) { [1, 2, 3].sample }
    let(:name) { %w(luc adrien lucas jp).sample }

    it 'user input should define the player_name' do
      allow(Dialog).to receive(:player_name_message)
      subject.create_player(name)
      expect(subject.instance_variable_get(:@player_name)).to eq(name)
      expect(Dialog).to have_received(:player_name_message)
    end

    it 'user input should define valid game difficulty ' do
      allow(Dialog).to receive(:chose_difficulty)
      subject.chose_difficulty(number)
      expect(subject.instance_variable_get(:@difficulty)).to eq(number)
      expect(Dialog).to have_received(:chose_difficulty)
    end

    it 'should have a word parameter' do
      subject.chose_difficulty(2)
      expect(subject.word).to be_an_instance_of(Word)
    end

    it 'should have a scaffold parameter' do
      subject
      expect(subject.instance_variable_get(:@scaffold)).to be_an_instance_of(Scaffold)
    end

  end

  context 'Run a turn' do

    it '#turn' do
      allow(Dialog).to receive(:turn_message)
      allow(subject.scaffold).to receive(:display)
      allow(subject.word).to receive(:crypted)
      allow(subject.word).to receive(:length)
      subject.turn
      expect(Dialog).to have_received(:turn_message)
      expect(subject.scaffold).to have_received(:display)
      expect(subject.word).to have_received(:crypted)
      expect(subject.word).to have_received(:length)
    end
  end

  context 'Run turns until game is over' do
    it '#run_game' do
      new_game = Game.new
      new_game.word = Word.new
      new_game.run_game
      expect(new_game.scaffold.level).to eq(8)
    end
  end
end
