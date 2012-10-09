
# require Player class to be derived
require "lib/player"

# derive Player class to implement a more descriptive type
class Dealer < Player

	attr_accessor :hand
	
	def initialize(name, deck, hand_size)
		# initialize accessors
		# assign player a reference to the global deck
		@name = name
		@deck = deck
		@hand = Array.new
				
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
		
	
	
	
end