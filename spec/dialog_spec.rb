require './lib/dialog.rb'

RSpec.describe Dialog do
  it 'should return hello' do
    expect(Dialog.start_game_message).to eq('Hello, welcome in our Hang-man Game')
  end
end