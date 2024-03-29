require 'rspec'
require './black_jack.rb'

describe BlackJack do
	subject(:blackjack) { BlackJack.new }
	describe '#initialize' do
		it 'starts with some players' do
			expect(blackjack.players).to_not be nil
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
    		expect(player).to have_received(:deal).exactly(4).times
		end
		it 'deals a card to a player when they hit' do
				player =  Player.new
				allow(player).to receive(:hit?).and_return(true, false)
    		blackjack = BlackJack.new([player])
    		number_of_cards = player.cards.length
    		blackjack.play
    		expect(player.cards.length).to eq 3
		end

	end

end