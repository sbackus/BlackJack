require 'rspec'
require './blackjack.rb'

describe BlackJack do
	subject(:blackjack) { BlackJack.new }
	describe '#initialize' do
		it 'starts with some players' do
			expect(blackjack.players).to_not be nil
		end
		it 'deals them each two cards' do
			expect(blackjack.players[0].cards.size).to eq 2
			expect(blackjack.players[1].cards.size).to eq 2
		end
	end

	describe '#play' do
		it 'asks a player if they want to hit until they stand or bust' do
				# strategy =  double("strategy")
				# allow(strategy).to receive_messages(:hit? => false)
    # 		blackjack.player = Player.new(strategy)
    # 		expect(player.hit?).to be(:return_value)
		end
	end

end