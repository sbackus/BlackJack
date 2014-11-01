require './player.rb'
require './deck.rb'

class BlackJack
	attr_reader :players

	def initialize(players = [Player.new,Player.new], deck = Deck.new)
		@deck = deck.shuffle!
		@players = players
	end

	def play
		puts "Welcome to Black Jack!\n"
		@players.each do |player|
			player.deal(@deck, 2)
			while(player.hit?)
				card = player.deal(@deck,1)
				if player.bust?
					puts 'Busts!'
					puts "#{player} looses..."
					return
				end
			end
		end
		puts "#{winner} is the winner!"
	end

	def winner
		scores = @players.map {|player| player.get_score}
		high_score = scores.max
		if scores.count(high_score) >= 2
			'No one'
		else
			winner = @players[scores.index(scores.max)]
			winner.to_s
		end
	end

end

game = BlackJack.new([Player.new, Player.new(DealerStrategy.new, "Dealer")])
game.play