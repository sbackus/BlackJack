require './player_strategy.rb'
require './dealer_strategy.rb'

class Player

	attr_reader :cards, :name

  def initialize(strategy = PlayerStrategy.new, name = 'Player', cards = [])
    @name = name
    @strategy = strategy
    @cards = cards
  end

  def deal(deck, n = 1)
    card = nil
    n.times do
      card = deck.deal unless deck.empty?
      @cards << card
      puts "#{name} was delt the #{card}"
    end
    card
  end

  def hit?
    puts "#{@name}'s score: #{get_score}\n\n"
    @strategy.hit?(self)
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

  def to_s
    name
  end

end