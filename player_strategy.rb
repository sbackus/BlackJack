class PlayerStrategy
	def hit?
		puts "Hit or stand (H/S):"
		move = gets.strip
		if  %w{H h HIT Hit hit}.include?(move)
			return true
		elsif %{S s STAND Stand stand}.include?(move)
			return false
		else
			puts "That is not valid move."
			puts "Try again."
			return hit?
		end
	end
end