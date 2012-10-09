

class Card
	# declare accessors to expose card properties
	attr_accessor :rank
	attr_accessor :suit
	attr_accessor :value
	attr_accessor :display
	
	def initialize(rank, suit)
		# assign the rank and suit
		@rank = rank
		@suit = suit
		
		# determine value with A through 10 as their rank and face cards as 10
		# variable Ace value of 1 or 10 is handled in Player not Card
		@value = case rank
			when 1 then 11
			when 2..13 then rank
		end
		
		# assign display string based on rank and suit
		@display = case rank
			when 1 then "Ace of #{suit}"
			when 2..10 then "#{rank} of #{suit}"
			when 11 then "Jack of #{suit}"
			when 12 then "Queen of #{suit}"
			when 13 then "King of #{suit}"
		end
	end
end