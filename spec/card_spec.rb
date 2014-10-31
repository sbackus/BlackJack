require 'rspec'
require './card.rb'

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
  describe '#comparator' do
    let (:king) { Card.new('King','Clubs') }
    let (:queen) { Card.new('Queen','Clubs') }
    let (:jack) { Card.new('Jack','Clubs') }
    let (:ace) { Card.new('Ace','Clubs') }
    let (:c2) { Card.new(2,'Diamonds') }
    let (:c2_heart) { Card.new(2,'Hearts') }
    let (:c4) { Card.new(4,'Spades') }

    it 'should reflect the correct rank when compared' do
      expect(king).to be > queen
      expect(king).to be > jack
      expect(king).to eq king
      expect(king).to be < ace

      expect(jack).not_to be > queen
      expect(jack).not_to be > ace
      expect(jack).to be < queen

      expect(ace).not_to be < queen
      expect(ace).to be > c4

      expect(c2).to be < c4
      expect(c2_heart).to eq c2
    end
  end
end