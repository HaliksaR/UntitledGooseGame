require 'rspec'
require_relative '../../lib/untitled_goose_game/goose'
require_relative '../../lib/loaders/level_loader'
require_relative '../../lib/actions/action_change'


RSpec.describe Goose do
  describe 'goose test' do
    let(:params_new) { { 'health' => 100, 'mana' => 0, 'fun' => 0, 'money' => 0, 'weariness' => 0 } }
    let(:params_action) { { 'health' => -20, 'mana' => 50, 'fun' => 20, 'money' => 30, 'weariness' => 40 } }
    let(:params_bad_action) { { 'health' => -200, 'mana' => 200, 'fun' => -200, 'money' => -200, 'weariness' => 200 } }
    let(:name) { 'testGoose' }
    let(:action) { ActionChange.new(params_action) }
    let(:bad_action) { ActionChange.new(params_bad_action) }

    it 'init goose' do
      expect(Goose.new(name, params_new, true).alive).to eq(true)
    end

    it 'action goose' do
      goose = Goose.new(name, params_new, true)
      goose.setup_actions(action)
      expect(goose.mana).to eq(50)
    end

    it 'live goose' do
      goose = Goose.new(name, params_new, true)
      expect(goose.validate_a_lot_of).to eq(true)
      goose.setup_actions(bad_action)
      expect(goose.check_health).to eq(false)
      expect(goose.check_mana).to eq(false)
      expect(goose.check_fun).to eq(false)
      expect(goose.check_weariness).to eq(false)
      expect(goose.check_money).to eq(false)
      expect(goose.validate_a_lot_of).to eq(false)
    end
  end
end
