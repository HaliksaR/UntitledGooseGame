require_relative '../loaders/actions_loader'
require_relative '../loaders/level_loader'
require_relative '../render/untitled_goose_game_render'

class Engine

  include UntitledGooseGameRender

  def initialize
    @saves_manager = SavesGoose.new
    start_menu_action
    @actions = ActionsLoader.load_actions
    start_game
  end

  def start_game
    loop do
      show_actions(@actions)
      show_item_game_menu
      show_enter
      input = gets.chomp
      if input == MENU
        start_game_menu_action
      else
        start_action(input.to_i - 1)
      end
    end
  end

  def start_action(item)
    show_error_menu_item unless (0..@actions.length).include?(item)
    show_action(@actions[item])
  end

  def start_menu_action
    loop do
      show_start_menu
      case START_MENU_LIST[gets.chomp.to_i - 1]
      when NEW_GAME
        show_enter_name
        name = gets.chomp
        show_enter_level
        goose_params = LevelLoader.load_level(gets.chomp)
        @goose = Goose.new(name, goose_params)
        break
      when LOAD_PROFILE
        name, params, alive = @saves_manager.load
        @goose = Goose.new(name, params, alive)
        show_goose_info(@goose)
        break
      when REMOVE_PROFILE
        @saves_manager.delete
      when REMOVE_ALL_PROFILE
        @saves_manager.delete_all
      when EXIT
        exit
      else
        show_error_menu_item
      end
    end
  end

  def start_game_menu_action
    loop do
      show_menu
      case MENU_LIST[gets.chomp.to_i - 1]
      when PROFILE_INFO
        show_goose_info(@goose)
      when RESUME
        break
      when SAVE_PROFILE
        @saves_manager.save(@goose)
      when LOAD_PROFILE
        name, params = @saves_manager.load
        @goose = Goose.new(name, params)
      when REMOVE_PROFILE
        @saves_manager.delete
      when REMOVE_ALL_PROFILE
        @saves_manager.delete_all
      when EXIT
        exit
      else
        show_error_menu_item
      end
    end
  end
end
