require 'rspec'
require './player.rb'

describe Player do
	describe '#initialize' do
		context 'no params' do
			it 'creates an player with a default strategy and no cards' do
				player = Player.new
				expect(player.cards).to eq []
				expect(player).to respond_to(:hit?)
			end
		end
		context 'with params' do
			it 'creates a player with the given strategy' do
				strategy =  double("strategy")
				allow(strategy).to receive_messages(:hit? => :return_value)
    		player = Player.new(strategy)
    		expect(player.hit?).to be(:return_value)
			end
		end
	end
	describe '#deal' do
		subject(:player) {Player.new}
		let (:deck) {Deck.new}
		context 'n is 0' do
			it 'does not change the player or the deck' do
				expect(player.deal(deck, 0)).to eq player
				expect(deck.cards.size).to eq 52
			end
		end
		context 'n is 1' do
			it 'puts one card from the deck into the player' do
				expect(player.deal(deck, 1).cards.size).to eq 1
				expect(deck.cards.size).to eq 51
			end
		end
	end
end