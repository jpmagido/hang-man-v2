require './lib/dialog.rb'

RSpec.describe Dialog do

  it 'should return hello' do
    expect(Dialog.start_game_message).to eq('Hello, welcome in our Hang-man Game')
  end

  it 'should ask the player his name' do
    expect(Dialog.player_name_message).to eq('What is your name, young fella ? :) ')
  end

  it 'should ask the player how difficult he wants the game to be' do
    expect(Dialog.chose_difficulty).to eq("Please chose a difficulty level: \n 1. Easy \n 2. Medium \n 3. Hard ")
  end

  it 'should return the turn msg' do
    expect(Dialog.turn_message).to eq("It's your turn, try and guess a letter")
  end
end