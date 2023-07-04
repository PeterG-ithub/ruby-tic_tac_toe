# frozen_string_literal: true

require 'pry-byebug'
# frozen_string_literal: true

# puts '┏━━━┳━━━┳━━━┓'
# puts '┃ ✖ ┃   ┃   ┃'
# puts '┣━━━╋━━━╋━━━┫'
# puts '┃   ┃ ● ┃   ┃'
# puts '┣━━━╋━━━╋━━━┫'
# puts '┃   ┃   ┃   ┃'
# puts '┗━━━┻━━━┻━━━┛'

# This class will make the boards
class Board
  def top_layer
    puts '┏━━━┳━━━┳━━━┓'
  end

  def mid_layer
    puts '┣━━━╋━━━╋━━━┫'
  end

  def input_layer
    puts '┃   ┃   ┃   ┃'
  end

  def bottom_layer
    puts '┗━━━┻━━━┻━━━┛'
  end

  def create_board
    top_layer
    input_layer
    mid_layer
    input_layer
    mid_layer
    input_layer
    bottom_layer
  end
end

# This class is for player creation
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# This class is for game controls
class Game
  def start_game
    intro
    main_menu
  end

  def intro
    puts '~~~~~~~~~~~~~~~Welcome to Tic Tac Toe!~~~~~~~~~~~~~~~'
    puts 'To start, enter your choice:'
  end

  def play
    puts 'You picked play'
  end

  def options
    puts 'You picked options'
  end

  def quit
    puts 'I hope you enjoyed the game!'
  end

  def main_menu
    puts ' 1. Play'
    puts ' 2. Options'
    puts ' 3. Quit'
    player_input = input
    menu_input(player_input)
  end

  def input
    loop do
      player_input = gets.chomp
      return player_input.to_i if player_input.to_i.between?(1, 3)

      puts 'Invalid choice. Please try again'
    end
  end

  def menu_input(player_input)
    case player_input.to_i
    when 1
      play
    when 2
      options
    when 3
      quit
    end
  end
end

game = Game.new
game.start_game
