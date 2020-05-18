require './game.rb'
require './lib/dialog.rb'
require './lib/scaffold.rb'
require './lib/word.rb'

RSpec.describe Game do
  subject { Game.new }

  context 'Start game' do
    it 'should display start Dialog' do
      allow(Dialog).to receive(:start_game_message)
      subject.start
      expect(Dialog).to have_received(:start_game_message)
    end
  end

  context 'should define parameters of the game' do
    let(:number) { [1, 2, 3].sample }
    let(:name) { %w(luc adrien lucas jp).sample }

    it 'should initialize the game' do
      expect(subject.difficulty).to eq(0)
    end

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
    it '#turn_infos' do
      allow(Dialog).to receive(:turn_message)
      allow(subject.scaffold).to receive(:display)
      allow(subject.word).to receive(:crypted)
      allow(subject.word).to receive(:length)
      subject.turn_infos
      expect(Dialog).to have_received(:turn_message)
      expect(subject.scaffold).to have_received(:display)
      expect(subject.word).to have_received(:crypted)
      expect(subject.word).to have_received(:length)
    end

    it 'should #guess' do
      subject.word = Word.new(1)
      expect(subject.guess_a_letter(subject.word.self_word[0])).to eq(true)
      expect(subject.instance_variable_get(:@guess)).to be true
    end

    it '#point_update should add a level if necessary' do
      subject.guess = true
      expect { subject.point_update }
        .to change { subject.scaffold.level }.by(0)

      subject.guess = false
      expect { subject.point_update }
        .to change { subject.scaffold.level }.from(0).to(1)
    end

    it 'should check if game is still on' do
      subject.scaffold.level = 1
      expect(subject.game_over?).to be false
      subject.scaffold.level = 8
      expect(subject.game_over?).to be true
    end
  end
end
