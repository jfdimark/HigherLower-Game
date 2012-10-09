
# require code for Deck, User, and Dealer classes
require "lib/deck"
require "lib/user"
require "lib/dealer"

class Game
	
	# assign default user name if no name passed from command line
	def initialize(name)		
		# create new Deck object, and assign to instance variable
		@deck = Deck.new

		# create user and dealer objects, setting their name, passing them a reference
		# to the shared deck, and setting their hand size
		@user = User.new(name)
		@dealer = Dealer.new("Dealer", @deck, 1)

		# set game state flag and reason string
		@game_over = false
		@game_over_reason = ""

		# initiate game play
		play_game
	end
	
	def play_game
		# display game startup message, including user and dealer names
		puts "Playing Higher or Lower with #{@user.name} (you) and #{@dealer.name} (dealer)."
		puts "The deck has been shuffled and first card drawn."

		# display initial hands
		@dealer.show_hand

		# continue playing rounds until game_over is true
		while @game_over == false
			play_round
		end

		# display who won or lost
		puts @game_over_reason
	end
	
	def play_round
			# get user input to hit or stand, regardless of case
		puts "(H)igher or (L)ower? Type H or L, then press Enter/Return"
		user_choice = $stdin.gets.chomp.upcase

		# user draws a card
		if (user_choice == "H")
			@dealer.draw
		# any choice but (S)tand repeats the round
		elsif (user_choice == "L")
			@dealer.draw
		else (user_choice	!= ["H", "L"])
			puts "\nPlease make a choice."
			play_round
		end

		# show the draw results
		@dealer.show_hand
		check_hand(user_choice)

		# return to play_game method
	end
	
	def check_hand(user_choice)
		# player totals and bust status are managed by user and dealer (player) objects
		# user busted, set game over and reason
		if @user.wrong == true
			@game_over = true
			@game_over_reason = "#{@user.name} got it wrong, drink!"

		elsif @user.right == true
			@game_over = false
			play_round
				 if play_round == @dealer.draw(*5)
				 @game_over = true
				 @game_over_reason = "#{user.name} wins!"
				 end 
		end			
		
		# return to play_hand method
	end

	def wrong
		if @user_choice == "H" && (@dealer.draw.value < @dealer.show_hand.value)
		elsif @user_choice == "L"  && (@dealer.draw.value > @dealder.show_hand.value)
		end
	end

	def right
		if @user_choice == "H" && (@dealer.draw.value > @dealer.show_hand.value)
		elsif @user_choice == "L" && (@dealer.draw.value < @dealder.show_hand.value)
		end
	end 


end






