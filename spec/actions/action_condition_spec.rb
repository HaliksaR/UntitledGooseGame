require 'rspec'
require_relative '../../lib/actions/action_condition'

RSpec.describe ActionCondition do
  let(:params_condition) {
    {
        'condition' => {
            'error_message' => 'test',
            'weariness' => {
                'max' => 60
            }
        }
    }
  }

  it 'test init condition' do
    action_condition = ActionCondition.new(params_condition)
    expect(action_condition.error_message).to eq(nil)
  end
end
