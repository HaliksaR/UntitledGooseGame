require_relative '../constants/goose_parameters'

class Goose
  include GooseParameters
  attr_accessor :name, :fun, :mana, :health, :weariness, :money, :alive

  def initialize(name, params, alive = true)
    @name = name
    @fun = params[FUN]
    @mana = params[MANA]
    @health = params[HEALTH]
    @weariness = params[WEARINESS]
    @money = params[MONEY]
    @alive = alive
  end
end
