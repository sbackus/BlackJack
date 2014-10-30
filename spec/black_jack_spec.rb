require 'rspec'
require './black_jack.rb'

describe Card do
  describe '#initialize' do
    it 'creates a card with the given rank and suit' do
      new_card = Card.new('King', 'Diamonds')
      expect(new_card.rank).to eq 'King'
      expect(new_card.suit).to eq 'Diamonds'

      new_card = Card.new('4', 'Clubs')
      expect(new_card.rank).to eq '4'
      expect(new_card.suit).to eq 'Clubs'
    end
  end
end

describe Deck do
	subject(:deck) { Deck.new }
  describe '#initialize' do
    it 'initializes 52 cards' do
      expect(deck.cards.count).to eq 52
      expect(deck.cards[1]).to be_a Card
    end
  end
  describe '#shuffle!' do
    it 'shuffles the cards' do
      cards_before_shuffling = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq cards_before_shuffling
    end
  end
  describe '#draw' do
    it 'draws a single card from the deck' do
      first_card = deck.cards.first
      cards_expected_after_draw = deck.cards[1..-1]
      expect(deck.draw).to eq first_card
      expect(deck.cards).to eq cards_expected_after_draw
    end
  end
  describe '#empty?' do
    context 'empty deck' do
      it 'returns true' do
        deck.cards.count.times { deck.draw }
        expect(deck).to be_empty
      end
    end

    context 'full deck' do
      it 'returns false' do
        expect(deck).not_to be_empty
      end
    end
  end
end

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