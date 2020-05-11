require './game.rb'
require './lib/dialog.rb'

RSpec.describe Game do
  let(:player_lucas) { Player.new('lucas')}

  subject { Game.new }

  before do
    allow(Dialog).to receive(:start_game_message).and_return('Hello, welcome in our Hang-man Game')
    allow(Player.new).to receive(:choose_name)
  end

  xit 'should delagate name choosing to Player' do
    subject.create_player
    expect(Player.new).to have_received(:new)
  end

  it 'should delegate the writings to Dialog' do
    subject.start
    expect(Dialog).to have_received(:start_game_message)
  end

end