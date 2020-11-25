require_relative '../constants/action_const'
require_relative 'action_condition_item'

class ActionCondition
  include ActionConst

  attr_accessor :error_message, :fun, :mana, :health, :weariness, :money

  def initialize(params)
    @error_message = params[CONDITION_ERROR] unless params[CONDITION_ERROR].nil?
    @fun = init_item(params, FUN)
    @mana = init_item(params, MANA)
    @health = init_item(params, HEALTH)
    @weariness = init_item(params, WEARINESS)
    @money = init_item(params, MONEY)
  end

  def init_item(params, key)
    ActionConditionItem.new(params[key]) unless params[key].nil?
  end

  def check(goose)
    ![
      check_item(@fun, goose.fun),
      check_item(@health, goose.health),
      check_item(@mana, goose.mana),
      check_item(@money, goose.money),
      check_item(@weariness, goose.weariness)
    ].include?(false)
  end

  def check_item(param, goose_param)
    param.nil? ? true : param.check_min_max(goose_param)
  end
end
