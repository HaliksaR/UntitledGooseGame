require_relative '../constants/goose_parameters'

class Goose
  include GooseParameters
  attr_accessor :name, :fun, :mana, :health, :weariness, :money, :alive

  def initialize(name, params, alive = true)
    @name = name
    @fun = params[FUN]
    @mana = params[MANA]
    @health = params[HEALTH]
    @weariness = params[WEARINESS]
    @money = params[MONEY]
    @alive = alive
  end

  def set_up_actions(changes)
    @fun += changes.fun
    @mana += changes.mana
    @health += changes.health
    @weariness += changes.weariness
    @money += changes.money
  end

  def validate_a_lot_of
    check_health
    check_mana
    check_fun
    check_weariness
    check_money
  end

  def check_health
    if @health.zero?
      @alive = false
      puts "Ваш гусь #{@name}, сдох"
    end
  end

  def check_mana
    if @mana == 100
      @alive = false
      puts "Ваш гусь #{@name}, попал в хогвардс"
    end
  end

  def check_fun
    if @fun == -10
      @alive = false
      puts "У вашего гуся #{@name}, появились суецидальные мысли..."
    end
  end

  def check_weariness
    if @weariness == 100
      @alive = false
      puts "Ваш гусь #{@name}, добегался..."
    end
  end

  def check_money
    if @money == -50
      @alive = false
      puts "За вашим гусем #{@name}, выехали коллекторы..."
    end
  end
end
