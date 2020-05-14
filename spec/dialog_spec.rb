require './lib/dialog.rb'

RSpec.describe Dialog do

  it 'should return hello' do
    expect(Dialog.start_game_message).to eq('Hello, welcome in our Hang-man Game')
  end

  it 'should ask the player his name' do
    expect(Dialog.player_name_message).to eq('What is your name, young fella ? :) ')
  end
end