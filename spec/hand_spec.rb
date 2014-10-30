require 'rspec'
require './hand.rb'

describe Hand do
	describe '#initialize' do
		context 'no params' do
			it 'creates an empty hand' do
				hand = Hand.new
				expect(hand.cards).to eq []
			end
		end
		context 'with params' do
			it 'creates a hand with the cards specified' do
				Ace_of_Clubs = Card.new('A','Clubs')
				King_of_Spades = Card.new('King','Spades')
				hand = Hand.new([Ace_of_Clubs, King_of_Spades])
				expect(hand.cards).to eq [Ace_of_Clubs,King_of_Spades]
			end
		end
	end
	describe '#draw' do
		subject(:hand) {Hand.new}
		let (:deck) {Deck.new}
		context 'n is 0' do
			it 'does not change the hand or the deck' do
				expect(hand.draw(deck, 0)).to eq hand
				expect(deck.cards.size).to eq 52
			end
		end
		context 'n is 1' do
			it 'puts one card from the deck into the hand' do
				expect(hand.draw(deck, 1).cards.size).to eq 1
				expect(deck.cards.size).to eq 51
			end
		end
	end
end