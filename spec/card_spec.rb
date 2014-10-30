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
end