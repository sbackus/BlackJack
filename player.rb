class Player

	attr_reader :cards

  def initialize(cards = [])
    @cards = []
    cards.each do |card|
      @cards << card
    end
  end

  def deal(deck, n = 1)
    n.times do
      @cards << deck.deal unless deck.empty?
    end
    self
  end

  # def get_move()
end