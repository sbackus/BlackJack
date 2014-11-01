require './player.rb'
require './deck.rb'

class BlackJack
	attr_reader :players

	def initialize(players = [Player.new,Player.new], deck = Deck.new)
		@deck = deck.shuffle!
		@players = players
		@players.each {|player| player.deal(@deck, 2) }
	end

	def play
		@players.each do |player|
			while(player.hit?)
				player.deal(@deck,1)
				if player.bust?
					puts 'Bust!'
					return
				end
			end
		end
	end

end

# game = BlackJack.new
# game.play