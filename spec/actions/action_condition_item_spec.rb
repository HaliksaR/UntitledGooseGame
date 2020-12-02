require 'rspec'
require_relative '../../lib/actions/action_condition_item'

describe 'ActionConditionItem' do
  let(:params) do
    {
      'min' => 20,
      'max' => 70
    }
  end
  describe 'action item tests' do
    context 'rule value' do
      it 'init tests' do
        action_item = ActionConditionItem.new(params)
        expect(action_item.max).to eq(70)
      end
      it 'check min max true' do
        action_item = ActionConditionItem.new(params)
        expect(action_item.check_min_max(30)).to eq(true)
      end
      it 'test check min max false' do
        action_item = ActionConditionItem.new(params)
        expect(action_item.check_min_max(10)).to eq(false)
      end
    end
  end
end
