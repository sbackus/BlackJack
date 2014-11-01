require 'rspec'
require './dealer_strategy.rb'

describe DealerStrategy do
	subject(:dealer_strategy) { DealerStrategy.new}
	describe '#hit?' do
		it 'responds to hit?' do
			expect(dealer_strategy).to respond_to(:hit?)
		end
		it 'returns true if the players score is less than 17' do
			player = double('player')
			allow(player).to receive(:get_score).and_return(16)
			expect(dealer_strategy.hit?(player)).to be true
		end
		it 'returns false if the players score is greater than or equal to 17' do
			player = double('player')
			allow(player).to receive(:get_score).and_return(17)
			expect(dealer_strategy.hit?(player)).to be false
		end
	end
end