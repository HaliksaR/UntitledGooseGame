require_relative '../constants/goose_parameters'

class Goose
  include GooseParameters
  attr_accessor :name, :fun, :mana, :health, :weariness, :money, :alive

  def initialize(name, params, alive)
    @name = name
    @fun = params[FUN]
    @mana = params[MANA]
    @health = params[HEALTH]
    @weariness = params[WEARINESS]
    @money = params[MONEY]
    @alive = alive
  end

  def setup_actions(changes)
    @fun += changes.fun
    @mana += changes.mana
    @health += changes.health
    @weariness += changes.weariness
    @money += changes.money
  end

  def validate_a_lot_of
    @alive = check_health && check_mana && check_fun && check_weariness && check_money
  end

  def check_health
    result = @health.positive?
    puts "Ваш гусь #{@name}, сдох" unless result
    result
  end

  def check_mana
    result = @mana < 100
    puts "Ваш гусь #{@name}, попал в хогвардс" unless result
    result
  end

  def check_fun
    result = @fun > -10
    puts "У вашего гуся #{@name}, появились суецидальные мысли..." unless result
    result
  end

  def check_weariness
    result = @weariness < 100
    puts "Ваш гусь #{@name}, добегался..." unless result
    result
  end

  def check_money
    result = @money > -50
    puts "За вашим гусем #{@name}, выехали коллекторы..." unless result
    result
  end
end
