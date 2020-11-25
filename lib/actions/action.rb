require_relative '../constants/action_const'
require_relative '../untitled_goose_game/goose'
require_relative 'action_condition'
require_relative 'action_change'
require_relative 'action_gifts'

class Action

  include ActionConst
  attr_accessor :display_name, :condition, :change, :gifts

  def initialize(params)
    @display_name = params[DISPLAY_NAME]
    @condition = ActionCondition.new(params[CONDITION]) unless params[CONDITION].nil?
    @change = ActionChange.new(params[CHANGE]) unless params[CHANGE].nil?
    @gifts = ActionGifts.new(params[GIFTS]) unless params[GIFTS].nil?
  end

  def check_condition(goose)
    if @condition != nil
      return unless @condition.check(goose)
    end
    add_gifts(goose)
    add_changes(goose)
  end

  def add_changes(goose)
    goose.set_up_actions(@change)
  end

  def add_gifts(goose)
    return unless nil != @gifts
    goose.fun = add_gift(@gifts.fun, goose, goose.fun)
    goose.health = add_gift(@gifts.health, goose, goose.health)
    goose.mana = add_gift(@gifts.mana, goose, goose.mana)
    goose.money = add_gift(@gifts.money, goose, goose.money)
    goose.weariness = add_gift(@gifts.weariness, goose, goose.weariness)
  end

  def add_gift(param, goose, goose_param)
    return goose_param unless nil != param
    if param.condition.check(goose)
      goose_param + param.added
    else
      puts param.condition.error_message
      goose_param
    end
  end
end
