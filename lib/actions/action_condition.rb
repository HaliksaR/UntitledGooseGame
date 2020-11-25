require_relative '../constants/action_const'
require_relative 'action_condition_item'

class ActionCondition

  include ActionConst

  attr_accessor :error_message, :fun, :mana, :health, :weariness, :money

  def initialize(params)
    @error_message = params[CONDITION_ERROR] unless params[CONDITION_ERROR].nil?
    @fun = ActionConditionItem.new(params[FUN]) unless params[FUN].nil?
    @mana = ActionConditionItem.new(params[MANA]) unless params[MANA].nil?
    @health = ActionConditionItem.new(params[HEALTH]) unless params[HEALTH].nil?
    @weariness = ActionConditionItem.new(params[WEARINESS]) unless params[WEARINESS].nil?
    @money = ActionConditionItem.new(params[MONEY]) unless params[MONEY].nil?
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
    (param != nil) ? param.check_min_max(goose_param) : true
  end
end
