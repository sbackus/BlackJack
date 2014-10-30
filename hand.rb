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