require_relative '../constants/action_const'

class Action

  include ActionConst
  attr_accessor :fun, :mana, :health, :weariness, :money, :display_name

  def initialize(params)
    @display_name = params[DISPLAY_NAME]
    @fun = params[FUN].nil? ? 0 : params[FUN]
    @mana = params[MANA].nil? ? 0 : params[MANA]
    @health = params[HEALTH].nil? ? 0 : params[HEALTH]
    @weariness = params[WEARINESS].nil? ? 0 : params[WEARINESS]
    @money = params[MONEY].nil? ? 0 : params[MONEY]
  end
end
