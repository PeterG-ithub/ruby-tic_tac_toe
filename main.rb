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

board = Board.new
board.create_board
greg = Player.new('Greg')
p greg.name
