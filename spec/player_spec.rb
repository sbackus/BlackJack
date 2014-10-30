require 'rspec'
require './player.rb'

describe Player do
	describe '#initialize' do
		context 'no params' do
			it 'creates an player with no cards' do
				player = Player.new
				expect(player.cards).to eq []
			end
		end
		context 'with params' do
			it 'creates a player with the cards specified' do
				Ace_of_Clubs = Card.new('A','Clubs')
				King_of_Spades = Card.new('King','Spades')
				player = Player.new([Ace_of_Clubs, King_of_Spades])
				expect(player.cards).to eq [Ace_of_Clubs,King_of_Spades]
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