
# require Player class to be derived
require "lib/player"

# derive Player class to implement a more descriptive type
class Dealer < Player

	attr_accessor :hand
	attr_accessor :total
	
	def initialize(name, deck, hand_size)
		# initialize accessors
		# assign player a reference to the global deck
		@name = name
		@deck = deck
		@hand = Array.new
		@total = false
				
		# put one card in hand
		hand_size.times do draw end
	end

	def draw
		# add card to hand and re-total
		@hand << @deck.draw_card
		
	end
	
	def show_hand
		# display hand 
		puts "\n#{@name} holds:"
		@hand.each do |card|
			puts card.display
		end
	end

	def count_hand
		# initialize local variable to accrue new total
		total = 0

		# sort ranks high (King, 13) to low (Ace, 1) so the Ace value is determined (11 or 1)
		# after the total of the rest of the hand is known
		@hand.sort! {|a, b| b.rank <=> a.rank}

		# loop and total the hand
		@hand.each do |card|
			total = total + card.value
		end
		# assign local value to player instance
		@total = total
	end
	
	
end