require_relative '../constants/action_const'
require_relative 'action_condition'

class ActionGiftsItem
  include ActionConst

  attr_accessor :condition, :added

  def initialize(params)
    @condition = ActionCondition.new(params[CONDITION]) unless params[CONDITION].nil?
    @added = params[ADDED].nil? ? 0 : params[ADDED]
  end
end