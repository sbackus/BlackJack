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
		it 'stops asking the player if they want to hit when they stand' do
				player =  spy("player")
				allow(player).to receive(:hit?).and_return(true, false)
				allow(player).to receive(:bust?).and_return(false)
    		blackjack = BlackJack.new([player])
    		blackjack.play
    		expect(player).to have_received(:hit?).twice
		end
		it 'stops asking the player if they want to hit when they bust' do
				player =  spy("player")
				allow(player).to receive(:hit?).and_return(true)
				allow(player).to receive(:bust?).and_return(false, false, true)
    		blackjack = BlackJack.new([player])
    		blackjack.play
    		expect(player).to have_received(:hit?).twice
		end

	end

end