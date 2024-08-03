require './base_player.rb'

class RandomPlayer < BasePlayer
  def next_point(time:)
    move = {
      row: rand(0..grid.max_row),
      col: rand(0..grid.max_col)
    }

    puts "Player #{name} at #{time} to #{move}"

    move
  end

  def grid
    game.grid
  end
end
