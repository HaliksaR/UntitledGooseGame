require 'rspec'
require_relative '../../lib/untitled_goose_game/goose'
require_relative '../../lib/actions/action'

RSpec.describe Action do
  let(:params_goose) { {'health' => 100, 'mana' => 0, 'fun' => 0, 'money' => 0, 'weariness' => 0} }
  let(:params_action) {
    {
        'display_name' => 'test',
        'condition' => {
            'error_message' => 'test',
            'weariness' => {
                'max' => 60
            }
        },
        'change' => {
            'fun' => 5,
            'weariness' => 40,
            'mana' => 60
        },
        'gifts' => {
            'health' => {
                'condition' => {
                    'mana' => {
                        'min' => 40
                    }
                },
                'added' => -20
            }
        }
    }
  }

  it 'test action' do
    action = Action.new(params_action)
    goose = Goose.new('test', params_goose, true)
    action.start(goose)
    expect(goose.fun).to eq(5)
    expect(goose.mana).to eq(60)
    goose.mana = 45
    action.start(goose)
    expect(goose.health).to eq(80)
  end
end
