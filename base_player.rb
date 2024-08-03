class BasePlayer
  attr_accessor :game, :name

  def initialize(game:, name:)
    @game = game
    @name = name
  end

  def next_point(time:)
    raise 'Not implemented'
  end
end
