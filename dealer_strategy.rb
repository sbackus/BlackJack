class DealerStrategy
	def hit?(player)
		player.get_score < 17
	end
end