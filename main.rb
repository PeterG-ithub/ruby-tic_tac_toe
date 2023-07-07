# frozen_string_literal: true

# This class will make the boards
class Board
  def initialize
    @input = Array.new(3) { Array.new(3, ' ') }
  end

  def top_layer
    puts '┏━━━┳━━━┳━━━┓'
  end

  def mid_layer
    puts '┣━━━╋━━━╋━━━┫'
  end

  def input_layer(input = Array.new(3))
    puts "┃ #{input[0]} ┃ #{input[1]} ┃ #{input[2]} ┃"
  end

  def bottom_layer
    puts '┗━━━┻━━━┻━━━┛'
  end

  def draw_board(input = @input)
    top_layer
    input_layer(input[0])
    mid_layer
    input_layer(input[1])
    mid_layer
    input_layer(input[2])
    bottom_layer
  end

  def input_logic(player_input)
    input_mapping = {
      'a1' => [0, 0], 'a2' => [0, 1], 'a3' => [0, 2],
      'b1' => [1, 0], 'b2' => [1, 1], 'b3' => [1, 2],
      'c1' => [2, 0], 'c2' => [2, 1], 'c3' => [2, 2]
    }
    input_arr = input_mapping[player_input]
    row, col = input_arr
    @input[row][col] = '✖'
    draw_board(@input)
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
    system('clear')
    puts '~~~~~~~~~~~~~~~Welcome to Tic Tac Toe!~~~~~~~~~~~~~~~'
  end

  def play_menu
    system('clear')
    puts 'You picked play!'
    puts 'Enter your choice:'
    puts ' 1. Player v Player'
    puts ' 2. Player v Computer (WIP)'
    puts ' 3. Main menu'
    player_input = input(3)
    play_input(player_input)
  end

  def options_menu
    system('clear')
    puts 'You picked options'
    puts 'Computer Difficulty:'
    puts ' 1. Easy'
    puts ' 2. Hard'
    puts ' 3. Unbeatable'
    puts ' 4. Main menu'
    puts 'Note: Player vs Computer not supported yet.'
    player_input = input(4)
    option_input(player_input)
  end

  def quit
    puts 'I hope you enjoyed the game!'
    exit
  end

  def main_menu
    puts 'To start, enter your choice:'
    puts ' 1. Play'
    puts ' 2. Options'
    puts ' 3. Quit'
    player_input = input(3)
    menu_input(player_input)
  end

  def input(num_of_choice)
    loop do
      player_input = gets.chomp
      return player_input.to_i if player_input.to_i.between?(1, num_of_choice)

      puts 'Invalid choice. Please try again'
    end
  end

  # Need to find a generalize code for player inputs and case statements
  def menu_input(player_input)
    case player_input.to_i
    when 1
      play_menu
    when 2
      options_menu
    when 3
      quit
    end
  end

  def play_input(player_input)
    case player_input.to_i
    when 1
      pvp
    when 2
      pvc
    when 3
      system('clear')
      puts 'You picked Main menu'
      main_menu
    end
  end

  def option_input(player_input)
    case player_input.to_i
    when 1..3
      difficulty(player_input.to_i)
      main_menu
    when 4
      system('clear')
      puts 'You picked Main menu'
      main_menu
    end
  end

  def difficulty(difficulty)
    system('clear')
    case difficulty.to_i
    when 1
      puts 'Difficulty set to Easy'
    when 2
      puts 'Difficulty set to Hard'
    when 3
      puts 'Difficulty set to UNBEATABLE!'
    end
    main_menu
  end

  def pvp
    print 'Player 1 name: '
    player_one = Player.new(gets.chomp)
    print 'Player 2 name: '
    player_two = Player.new(gets.chomp)
    puts "Player 1: #{player_one.name}"
    puts "Player 2: #{player_two.name}"
  end

  def play_game

  end
end

game = Game.new
game.start_game
