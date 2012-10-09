
# require Card class and Shuffleable module to be created or included in Deck
require 'lib/card'
require 'lib/shuffleable'

class Deck
	# declare accessor to expose deck
	attr_accessor :deck

	# include shuffleable module as mixin
	include Shuffleable
	
	# define suits as hash constant
	SUITS = {
		"C"=>"Clubs",
		"D"=>"Diamonds",
		"H"=>"Hearts",
		"S"=>"Spades"
	}
	
	def initialize
		# declare the deck array
		@deck = Array.new

		# iterate through the suits
		SUITS.each do |code, suit|
			# iterate through the ranks
			13.times do |i|
				rank = i + 1
				# create new card for rank and suit, and add to deck
				@deck << Card.new(rank, suit)
			end
		end

		# shuffle the deck using mixin method
		@deck = shuffle_deck(@deck)
	end
	
	def draw_card
		# return top card from shuffled deck
		return @deck.pop
	end
end