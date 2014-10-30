class Card

	attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

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

  def draw
  	return @cards.shift
  end

  def empty?
  	return @cards.empty?
  end

end

class Hand

	attr_reader :cards

  def initialize(cards = [])
    @cards = []
    cards.each do |card|
      @cards << card
    end
  end

  def draw(deck, n = 1)
    n.times do
      @cards << deck.draw unless deck.empty?
    end
    self
  end

end