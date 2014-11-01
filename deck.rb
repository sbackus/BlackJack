require './card.rb'

class Deck

	attr_reader :cards

	SUITS = %w{ Clubs Diamonds Hearts Spades }
  RANKS = [*2..10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(options={})
  	@cards = []
	  (RANKS).product(SUITS).each do |rank, suit|
	    @cards << Card.new(rank, suit)
	  end
  end

  def shuffle!
    @cards.shuffle!
    self
  end

  def deal
  	return @cards.shift
  end

  def empty?
  	return @cards.empty?
  end

end