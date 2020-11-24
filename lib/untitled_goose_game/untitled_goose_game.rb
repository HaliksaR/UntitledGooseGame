require_relative '../loaders/level_loader'
require_relative '../loaders/actions_loader'
require_relative '../untitled_goose_game/goose'
require_relative '../saves/saves_goose'
require_relative '../render/untitled_goose_game_render'
require_relative '../engine/engine'

class UntitledGooseGame
  def launch
    Engine.new
  end
end
