require './player_strategy.rb'

class Player

	attr_reader :cards

  def initialize(strategy = PlayerStrategy.new , cards = [])
    @strategy = strategy
    @cards = cards
  end

  def deal(deck, n = 1)
    n.times do
      card = deck.deal unless deck.empty?
      @cards << card
    end
    self
  end

  def hit?
    puts "Players score: #{get_score}"
    @strategy.hit?
  end

  def get_score
    score = 0
    @cards.sort!
    @cards.each do |card|
      if ['Jack', 'Queen', 'King'].include?(card.rank)
        score += 10
      elsif card.rank == 'Ace' && score < 11
        score += 11
      elsif card.rank == 'Ace'
        score += 1
      else
        score += card.rank.to_i
      end
    end
    score
  end

  def bust?
    get_score > 21
  end

end