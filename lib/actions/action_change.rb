require_relative '../constants/action_const'

class ActionChange

  include ActionConst

  attr_accessor :fun, :mana, :health, :weariness, :money

  def initialize(params)
    @fun = params[FUN].nil? ? 0 : params[FUN]
    @mana = params[MANA].nil? ? 0 : params[MANA]
    @health = params[HEALTH].nil? ? 0 : params[HEALTH]
    @weariness = params[WEARINESS].nil? ? 0 : params[WEARINESS]
    @money = params[MONEY].nil? ? 0 : params[MONEY]
  end
end
