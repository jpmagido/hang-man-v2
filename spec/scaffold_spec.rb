require './lib/scaffold'

RSpec.describe Scaffold do

  let(:scaffold_methods) { %i[bottom pillar top rope head arms body legs death] }

  subject { Scaffold.new }

  before { expect(subject.display).to eq(scaffold_methods[subject.level]) }
  after do
    expect(subject.display).to eq(scaffold_methods[subject.level])
    expect(subject.display).not_to be_nil
  end

  context 'Scaffold construct' do
    it 'should initialize' do
      subject
      expect(subject.level).to eq(0)
    end
  end

  context 'during the game' do
    let(:game_over) { Scaffold.new.level = 8 }
    it 'should level up' do
      expect { subject.level_up }.to change { subject.level }.by(1)
    end

    it 'any level should work' do
      subject.level = (0..8).to_a.sample
    end
  end
end