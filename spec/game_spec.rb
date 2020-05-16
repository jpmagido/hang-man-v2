require './game.rb'
require './lib/dialog.rb'

RSpec.describe Game do
  context "New game" do
    subject { Game.new }
    let(:number) { [1, 2, 3].sample }
    let(:name) { %w(luc adrien lucas jp).sample }

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
  end
end
