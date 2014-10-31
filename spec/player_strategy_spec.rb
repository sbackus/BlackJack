require 'rspec'
require './player_strategy.rb'

describe PlayerStrategy do
	subject(:player_strategy) { PlayerStrategy.new}
	describe '#hit?' do
		it 'responds to hit?' do
			expect(player_strategy).to respond_to(:hit?)
		end
	end
end