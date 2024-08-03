require './base_player.rb'

class YourPlayer < BasePlayer
  def initialize(game:, name:)
    super(game: game, name: name)
    @current_position = { row: 0, col: 0 } 
    @visited_positions = []
  end

  def next_point(time:)
    next_position = calculate_next_position

    until valid_position?(next_position)
      @current_position[:row] += 1
      @current_position[:col] = @current_position[:row]
      next_position = calculate_next_position
    end

    @current_position = next_position
    @visited_positions << next_position
    puts "Player #{@name} at time #{time} moves to #{@current_position}"

    @current_position
  end

  private

  def calculate_next_position
    { row: @current_position[:row] + 1, col: @current_position[:col] + 1 }
  end

  def valid_position?(position)
    position[:row].between?(0, game.grid.max_row) &&
      position[:col].between?(0, game.grid.max_col) &&
      !@visited_positions.include?(position)
  end

  def grid
    game.grid
  end
end
