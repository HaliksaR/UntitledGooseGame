require_relative '../constants/action_const'

class ActionConditionItem
  include ActionConst

  attr_accessor :min, :max

  def initialize(params)
    @min = params[MIN]
    @max = params[MAX]
  end

  def check_min_max(param)
    check_max(param) && check_min(param)
  end

  def check_max(param_value)
    @max.nil? ? true : param_value < @max
  end

  def check_min(param_value)
    @min.nil? ? true : param_value > @min
  end
end
