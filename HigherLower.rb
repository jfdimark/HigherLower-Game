# GA PFR: Programming Fundamentals for Ruby on Rails
# Intro to Ruby - Final Project
#
# HigherLower a simple game of Higher or Lower...
# and a perfect drinking game!
#
# - 52 card deck is built and shuffled
# - The dealder is dealt a random card from the pack
# - Player decides if the next card will be higher or lower
# - If the player is correct, they advance to the next card
# - And repeat.  If they get it correct 5 times in a row
# - They are declared the winner.  
# - If they get it wrong, they have to drink the number of fingers
# - Equivalent to how far away they were from winning.
#
# USAGE: ruby HigherLower.rb "User Name"
# 
# Project demonstrates
# - local and instance variables
# - arrays, hashes, and custom object type(s)
# - logical conditions
# - branching via both if/elsif/else and case/when
# - classes and object instantiation
# - attr_accessor
# - instance methods
# - module mixin to class
# - array
# - hash
# - command line input 
# - command line display 
# - string interpolation
# - comments
#

# add current directory to Ruby LOAD_PATH
$LOAD_PATH.unshift(File.dirname(__FILE__))

# require game class from /lib relative to current directory per modified LOAD_PATH
require "lib/game"

# pass first command line argument - User's name - to new Game object
name = ARGV[0]
begin
	# raise error unless user enters a string value name as a command line argument
	raise ArgumentError, "Please enter a player name as a command line parameter." unless name.is_a? String
	loop do
		# bootstrap game launch by creating new game object
		game = Game.new(name)
		# when Game::play_game ends, ask if user wants to quit or continue
		puts "\n(Q)uit or (C)ontinue?"
		choice = $stdin.gets.chomp
		# unless user says quit, next loop to launch new game
		next unless choice.upcase == "Q"
		puts "Bye!"
		break
	end
	# handle and display error raised above
	rescue ArgumentError => error
		puts error.message
end


