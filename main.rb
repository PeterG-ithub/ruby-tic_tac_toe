# frozen_string_literal: true

# This class will make the boards
class Board
  attr_reader :input

  def initialize
    @input = Array.new(3) { Array.new(3, ' ') }
  end

  def top_layer
    puts '    1   2   3'
    puts '  ┏━━━┳━━━┳━━━┓'
  end

  def mid_layer
    puts '  ┣━━━╋━━━╋━━━┫'
  end

  def input_layer(layer_number, input = Array.new(3))
    puts "#{layer_number} ┃ #{input[0]} ┃ #{input[1]} ┃ #{input[2]} ┃"
  end

  def bottom_layer
    puts '  ┗━━━┻━━━┻━━━┛'
  end

  def draw_board(input = @input)
    top_layer
    input_layer('a', input[0])
    mid_layer
    input_layer('b', input[1])
    mid_layer
    input_layer('c', input[2])
    bottom_layer
  end

  def input_logic(player_input, player_number)
    input_mapping = {
      'a1' => [0, 0], 'a2' => [0, 1], 'a3' => [0, 2],
      'b1' => [1, 0], 'b2' => [1, 1], 'b3' => [1, 2],
      'c1' => [2, 0], 'c2' => [2, 1], 'c3' => [2, 2]
    }
    input_arr = input_mapping[player_input]
    row, col = input_arr
    @input[row][col] = '✖' if player_number == 1
    @input[row][col] = '●' if player_number == 2
    draw_board(@input)
  end

  def isWinner?
  end
end

# This class is for player creation
class Player
  attr_accessor :name
  attr_reader :player_number

  @player_count = 0

  def initialize(name)
    @name = name
    self.class.increment_player_count
    @player_number = self.class.player_count
  end

  def self.increment_player_count
    @player_count += 1
  end

  class << self
    attr_reader :player_count
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
      puts 'Doesn\'t exist'
      main_menu
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
    play_round(player_one, player_two)
  end

  def play_round(player_one, player_two)
    board = Board.new
    puts 'Please use the following inputs: a1, a2, a3, b1, b2, b3, c1, c2, c3'
    5.times do
      print "#{player_one.name}'s turn: "
      player1_input = validate_input(gets.chomp, board)
      board.input_logic(player1_input.to_s, player_one.player_number)
      if(board.isWinner?)
        puts "#{player_one.name} Wins!"
        quit
      end
      print "#{player_two.name}'s turn: "
      player2_input = validate_input(gets.chomp, board)
      board.input_logic(player2_input.to_s, player_two.player_number)
      board.isWinner?
      if(board.isWinner?)
        puts "#{player_two.name} Wins!"
        quit
      end
    end
  end

  def validate_input(string, board)
    arr = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]
    input_mapping = {
      'a1' => [0, 0], 'a2' => [0, 1], 'a3' => [0, 2],
      'b1' => [1, 0], 'b2' => [1, 1], 'b3' => [1, 2],
      'c1' => [2, 0], 'c2' => [2, 1], 'c3' => [2, 2]
    }
    loop do
      if arr.include?(string)
        input_arr = input_mapping[string]
        row, col = input_arr
        if board.input[row][col] == '✖' || board.input[row][col] == '●'
          puts 'There is something already there :)'
        else
          return string
        end
      end
      puts 'Please use the following inputs: a1, a2, a3, b1, b2, b3, c1, c2, c3'
      string = gets.chomp
    end
  end
end

game = Game.new
game.start_game
