require 'rspec'
require './blackjack.rb'

describe BlackJack do
	subject(:blackjack) { BlackJack.new }
	describe '#initialize' do
		it 'starts with a player and a dealer' do
			expect(blackjack.player).to_not be nil
			expect(blackjack.dealer).to_not be nil
		end
		it 'deals them each two cards' do
			expect(blackjack.player.cards.size).to eq 2
			expect(blackjack.dealer.cards.size).to eq 2
		end
	end
end