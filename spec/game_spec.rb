require './game.rb'
require './lib/dialog.rb'

RSpec.describe Game do
  context 'Game starts' do
    let(:player) { Player.new('Lucas') }
    let(:game) { Game.new }

    subject { Game.new}

    it 'should delegate the writings to Dialog' do
      allow(Dialog).to receive(:start_game_message)
      subject.start
      expect(Dialog).to have_received(:start_game_message)
    end

    it 'should delagate name choosing to Player' do
      allow(Dialog).to receive(:player_name_message)
      allow(Player).to receive(:new).and_return(player)
      subject.create_player
      expect(Dialog).to have_received(:player_name_message)
      expect(Player).to have_received(:new)
    end

    it 'should initialize a level of difficulty' do
      subject
      expect(subject.difficulty).to eq(0)
    end

    it 'should change the level of difficulty' do
      hard_game = Game.new
      hard_game.difficulty = 5
      expect(hard_game.difficulty = 5).to eq(5)
    end
  end
end
