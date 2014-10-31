require './player_strategy.rb'

class Player

	attr_reader :cards

  def initialize(strategy = PlayerStrategy.new)
    @strategy = strategy
    @cards = []
  end

  def deal(deck, n = 1)
    n.times do
      @cards << deck.deal unless deck.empty?
    end
    self
  end

  def hit?
    @strategy.hit?
  end
end