
# The Shuffleable module contains methods that enable randomly shuffling an array
module Shuffleable
  def shuffle_deck(deck)
	# shuffle! is a built in array method
	# could substitute an arbitrary shuffling algorithm here
    return deck.shuffle!
  end
end