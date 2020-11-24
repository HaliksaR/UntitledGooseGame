require 'yaml'
require_relative '../constants/levels'

class LevelLoader
  include Levels

  PATH = 'configs/level_config.yml'.freeze
  ERROR_MESSAGE = 'not find level'.freeze

  def self.load_level(level, path_to_config = PATH)
    raise ERROR_MESSAGE unless [EASY, MEDIUM, HARD].include?(level)

    file = File.read(path_to_config)
    parameters = YAML.safe_load(file)
    parameters[level]
  end

  private_constant :PATH, :ERROR_MESSAGE
end
