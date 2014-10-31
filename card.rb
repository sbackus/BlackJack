class Card

	attr_reader :rank, :suit

	include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    self.to_i <=> other.to_i
  end

  def to_i
  	if @rank == 'Ace'
  		return 14
    elsif @rank == 'King'
    	return 13
    elsif @rank == 'Queen'
    	return 12
    elsif @rank == 'Jack'
    	return 11
    else
    	return @rank.to_i
    end
  end
end