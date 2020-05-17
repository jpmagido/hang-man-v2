require './lib/scaffold'

RSpec.describe Scaffold do

  subject { Scaffold.new }

  context 'Scaffold construct' do
    let(:scaffold_methods) { %i[bottom pillar top rope head arms body legs death] }
    let(:level_one_bis) { Scaffold.new.level = (0..8).to_a.sample }

    it 'should initialize' do
      subject
      expect(subject.level).to eq(0)
    end

    it 'should display the right scaffold level' do
      expect(subject.display).to eq(scaffold_methods[subject.level])
    end
  end

  context
end