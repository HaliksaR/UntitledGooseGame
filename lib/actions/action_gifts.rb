require_relative 'action_gifts_item'
require_relative '../constants/action_const'

class ActionGifts
  include ActionConst

  attr_accessor :fun, :mana, :health, :weariness, :money

  def initialize(params)
    @fun = ActionGiftsItem.new(params[FUN]) unless params[FUN].nil?
    @mana = ActionGiftsItem.new(params[MANA]) unless params[MANA].nil?
    @health = ActionGiftsItem.new(params[HEALTH]) unless params[HEALTH].nil?
    @weariness = ActionGiftsItem.new(params[WEARINESS]) unless params[WEARINESS].nil?
    @money = ActionGiftsItem.new(params[MONEY]) unless params[MONEY].nil?
  end
end