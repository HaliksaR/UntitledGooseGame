require 'rspec'
require_relative '../../lib/actions/action_condition'

describe 'ActionCondition' do
  let(:action_condition) do
    ActionCondition.new({
                          'condition' => {
                            'error_message' => 'test',
                            'weariness' => {
                              'max' => 60
                            }
                          }
                        })
  end
  describe 'initialize' do
    it 'action condition' do
      expect(action_condition.error_message).to eq(nil)
    end
  end
end
