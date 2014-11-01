require 'rspec'
require './player.rb'

describe Player do
	subject(:player) {Player.new}
  before do
  	# make some cards for testing
    @Ace_of_Clubs = Card.new('Ace','Clubs')
		@King_of_Spades = Card.new('King','Spades')
		@Queen_of_Diamonds = Card.new('Queen','Diamonds')
		@Two_of_Hearts = Card.new('2', 'Hearts')
  end

	describe '#initialize' do
		context 'no params' do
			it 'creates an player with a default strategy and no cards' do
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
			it 'creates a player with the cards specified' do
				player = Player.new(nil, [@Ace_of_Clubs, @King_of_Spades])
				expect(player.cards).to eq [@Ace_of_Clubs,@King_of_Spades]
			end
		end
	end
	describe '#deal' do
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
	describe '#score' do
		it 'is zero if the player has no cards' do
			expect(player.get_score).to eq 0
		end
		it 'is 10 if the player has one face card' do
			player = Player.new(nil, [@King_of_Spades])
			expect(player.get_score).to eq 10
		end
		it 'is 21 if the player has a face card and an Ace' do
			player = Player.new(nil, [@King_of_Spades, @Ace_of_Clubs])
			expect(player.get_score).to eq 21
		end
		it 'is 21 if the player has two face card and an Ace' do
			player = Player.new(nil, [@King_of_Spades, @Ace_of_Clubs, @Queen_of_Diamonds])
			expect(player.get_score).to eq 21
		end
		it 'is 12 if the player has a face card and a Two' do
			player = Player.new(nil, [@King_of_Spades, @Two_of_Hearts])
			expect(player.get_score).to eq 12
		end
	end
	describe '#bust?' do
		it 'returns false if the score is less than or equal to 21' do
			player = Player.new
			allow(player).to receive(:get_score).and_return(21)
			expect(player.bust?).to be false
		end
		it 'returns true if the score is greater than 21' do
			player = Player.new
			allow(player).to receive(:get_score).and_return(22)
			expect(player.bust?).to be true
		end
	end
end