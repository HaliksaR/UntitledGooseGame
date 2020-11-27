=begin
require 'rspec'
require_relative '../../lib/saves/saves_goose'
require_relative '../../lib/untitled_goose_game/goose'

RSpec.describe SavesGoose do

  describe 'saves tests' do
    let(:params_new) { { 'health' => 100, 'mana' => 34, 'fun' => 25, 'money' => 36, 'weariness' => 77 } }

    it 'save-load goose' do
      saves_manager = SavesGoose.new
      goose = Goose.new('saveGoose', params_new, true)
      saves_manager.save(goose)
      name, params, alive = saves_manager.load
      expect(name).to eq(goose.name)
      expect(params).to eq(params_new)
      expect(alive).to eq(goose.alive)
    end
  end
end
=end
