#!/usr/bin/env ruby

require './black_jack.rb'

game = BlackJack.new([Player.new, Player.new(DealerStrategy.new, "Dealer")])
game.play