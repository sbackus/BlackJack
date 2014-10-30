require 'rspec'
require './deck.rb'

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
  describe '#deal' do
    it 'deals a single card from the deck' do
      first_card = deck.cards.first
      cards_expected_after_deal = deck.cards[1..-1]
      expect(deck.deal).to eq first_card
      expect(deck.cards).to eq cards_expected_after_deal
    end
  end
  describe '#empty?' do
    context 'empty deck' do
      it 'returns true' do
        deck.cards.count.times { deck.deal }
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