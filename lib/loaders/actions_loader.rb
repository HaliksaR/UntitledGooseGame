require 'yaml'
require_relative '../actions/action'

class ActionsLoader
  PATH = 'configs/actions.yml'.freeze

  def self.load_actions(path_to_config = PATH)
    file = File.read(path_to_config)
    YAML.safe_load(file).map { |params| Action.new(params) }
  end

  private_constant :PATH
end
