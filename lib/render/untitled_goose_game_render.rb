module UntitledGooseGameRender
  NEW_GAME = 'New game'.freeze
  PROFILE_INFO = 'Goose info'.freeze
  SAVE_PROFILE = 'Save your goose'.freeze
  LOAD_PROFILE = 'Load your goose'.freeze
  REMOVE_PROFILE = 'Remove goose'.freeze
  REMOVE_ALL_PROFILE = 'Remove all geese'.freeze
  RESUME = 'Resume'.freeze
  EXIT = 'Exit'.freeze
  ERROR_MESSAGE_MENU_ITEM = 'Invalid Index'.freeze

  ENTER_VALUE = 'Enter: '.freeze
  ENTER_NAME = 'Goose name'.freeze
  ENTER_LEVEL = 'Level (easy, medium, hard)'.freeze

  MENU = 'menu'.freeze
  GAME_MENU = "Enter '#{MENU}' for open menu".freeze

  MENU_LIST = [
    PROFILE_INFO,
    SAVE_PROFILE,
    LOAD_PROFILE,
    REMOVE_PROFILE,
    REMOVE_ALL_PROFILE,
    RESUME,
    EXIT
  ].freeze

  START_MENU_LIST = [
    NEW_GAME,
    LOAD_PROFILE,
    REMOVE_PROFILE,
    REMOVE_ALL_PROFILE,
    EXIT
  ].freeze

  def show_menu
    MENU_LIST.each_with_index { |item, index| puts("#{index + 1}) #{item}") }
    show_enter
  end

  def show_start_menu
    START_MENU_LIST.each_with_index { |item, index| puts("#{index + 1}) #{item}") }
    show_enter
  end

  def show_actions(actions)
    actions.each_with_index do |item, index|
      puts("#{index + 1}) #{item.display_name}")
    end
  end

  def show_item_game_menu
    puts GAME_MENU
  end

  def show_enter
    puts ENTER_VALUE
  end

  def show_error_menu_item
    puts ERROR_MESSAGE_MENU_ITEM
  end

  def show_error_condition(condition)
    return if condition.nil?

    puts condition.error_message
  end

  def show_enter_name
    puts ENTER_NAME
    show_enter
  end

  def show_enter_level
    puts ENTER_LEVEL
    show_enter
  end

  def show_goose_info(goose)
    puts "name: #{goose.name}"
    puts "fun: #{goose.fun}"
    puts "mana: #{goose.mana}"
    puts "health: #{goose.health}"
    puts "weariness: #{goose.weariness}"
    puts "money: #{goose.money}"
  end

  def show_action(action)
    puts "name: #{action.display_name}"
    puts "fun: #{action.fun}"
    puts "mana: #{action.mana}"
    puts "health: #{action.health}"
    puts "weariness: #{action.weariness}"
    puts "money: #{action.money}"
  end
end
