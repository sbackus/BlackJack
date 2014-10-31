class BlackJack
	attr_reader :players

	def initialize(players = [Player.new,Player.new], deck = Deck.new)
		@deck = deck
		@players = players
		@players.each {|player| player.deal(@deck, 2) }
	end

end