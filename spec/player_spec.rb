require './lib/player.rb'

RSpec.describe Player do

  context 'Player creation' do
    let(:player) { Player.new('Lucas') }

    it 'should create a valid User' do
      expect(player).to be_an_instance_of(Player)
    end

    it 'should display the player name' do
      expect(player.name).to eq('Lucas')
    end
  end
end