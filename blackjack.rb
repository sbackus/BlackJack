class BlackJack
	attr_reader :player, :dealer

# TODO: strategy pattern for dealer and player moves?

	def initialize
		@deck = Deck.new
		@player = Player.new
		@dealer = Player.new
		@player.deal(@deck, 2)
		@dealer.deal(@deck, 2)
	end
end