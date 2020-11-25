require_relative 'action_gifts_item'
require_relative '../constants/action_const'

class ActionGifts
  include ActionConst

  attr_accessor :fun, :mana, :health, :weariness, :money

  def initialize(params)
    @fun = init_item(params, FUN)
    @mana = init_item(params, MANA)
    @health = init_item(params, HEALTH)
    @weariness = init_item(params, WEARINESS)
    @money = init_item(params, MONEY)
  end

  def init_item(params, key)
    ActionGiftsItem.new(params[key]) unless params[key].nil?
  end
end
