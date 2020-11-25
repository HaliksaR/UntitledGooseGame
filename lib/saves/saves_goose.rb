require_relative '../constants/goose_parameters'
require_relative '../untitled_goose_game/goose'
require 'json'
require 'fileutils'

class SavesGoose
  include GooseParameters

  TIME_PATTERN = '%Y-%m-%d_%H_%M_%S'.freeze
  PATH = '../saves'.freeze
  ERROR_MESSAGE = 'Invalid Index'.freeze
  CHOOSE_FILE = 'Enter index file'.freeze

  def save(goose)
    goose_params = {
      NAME => goose.name,
      FUN => goose.fun,
      MANA => goose.mana,
      HEALTH => goose.health,
      WEARINESS => goose.weariness,
      MONEY => goose.money,
      ALIVE => goose.alive
    }

    time = Time.new.strftime(TIME_PATTERN)
    file_name = "#{goose.name}_#{time}.json"
    FileUtils.mkdir_p(PATH) unless File.exist?(PATH)
    File.open(File.join(PATH, file_name), 'w') do |file|
      file.write(goose_params.to_json)
    end
  end

  def load
    file = File.read(File.join(PATH, choose_file))
    data_hash = JSON.parse(file)
    name = data_hash.delete(NAME)
    alive = data_hash.delete(ALIVE)
    [name, data_hash, alive]
  end

  def delete
    return unless Dir.exist?(PATH)

    path = File.join(PATH, choose_file)
    File.delete(path) if File.exist?(path)
  end

  def delete_all
    FileUtils.rm_rf(PATH)
  end

  def choose_file
    files = Dir.children(PATH)
    list_names = files.each_with_index.map { |file, index| "#{index + 1}) #{File.basename(file)}" }
    puts list_names
    puts CHOOSE_FILE
    choose_file = gets.chomp.to_i
    raise ERROR_MESSAGE unless choose_file.between?(1, files.length)

    files[choose_file - 1]
  end

  private_constant :PATH, :ERROR_MESSAGE, :CHOOSE_FILE, :TIME_PATTERN, :PATH
  private :choose_file
end
