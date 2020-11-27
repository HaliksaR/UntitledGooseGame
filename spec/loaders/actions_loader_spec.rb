require 'rspec'
require_relative '../../lib/loaders/actions_loader'

RSpec.describe ActionsLoader do
  let(:yml) { 'spec/loaders/test_action.yml' }
  it 'action loader test' do
    actions = ActionsLoader.load_actions(yml)
    expect(actions[0].display_name).to eq('Посмотреть сумерки')
  end
end
