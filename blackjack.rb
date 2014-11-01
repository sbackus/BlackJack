require './player.rb'
require './deck.rb'

class BlackJack
	attr_reader :players

	def initialize(players = [Player.new,Player.new], deck = Deck.new)
		@deck = deck
		@players = players
		@players.each {|player| player.deal(@deck, 2) }
	end

	def play
		@players.each do |player|
			while((not player.bust?) && player.hit?)

			end
		end
	end

end

# game = BlackJack.new
# game.play