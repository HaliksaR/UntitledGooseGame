require 'rspec'

require_relative '../../lib/loaders/level_loader'

RSpec.describe LevelLoader do
  let(:yml) { 'spec/loaders/test_level.yml' }
  let(:params) { { 'health' => 100, 'mana' => 0, 'fun' => 0, 'money' => 0, 'weariness' => 0 } }

  it 'test level loader' do
    level = LevelLoader.load_level('easy', yml)
    expect(level).to eq(params)
  end
end
