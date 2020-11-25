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

  def start(goose)
    change_params(goose) if check_condition(goose)
  end

  def change_params(goose)
    add_gifts(goose)
    add_changes(goose)
  end

  def check_condition(goose)
    return true if @condition.nil?

    @condition.check(goose)
  end

  def add_changes(goose)
    goose.setup_actions(@change)
  end

  def add_gifts(goose)
    return if @gifts.nil?

    add_gift_fun(goose)
    add_gift_health(goose)
    add_gift_mana(goose)
    add_gift_money(goose)
    add_gift_weariness(goose)
  end

  def add_gift_fun(goose)
    goose.fun = add_gift(@gifts.fun, goose, goose.fun)
  end

  def add_gift_health(goose)
    goose.health = add_gift(@gifts.health, goose, goose.health)
  end

  def add_gift_mana(goose)
    goose.mana = add_gift(@gifts.mana, goose, goose.mana)
  end

  def add_gift_money(goose)
    goose.money = add_gift(@gifts.money, goose, goose.money)
  end

  def add_gift_weariness(goose)
    goose.weariness = add_gift(@gifts.weariness, goose, goose.weariness)
  end

  def add_gift(param, goose, goose_param)
    return goose_param if param.nil?

    if param.condition.check(goose)
      goose_param + param.added
    else
      puts param.condition.error_message
      goose_param
    end
  end
end
