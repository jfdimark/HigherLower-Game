class Player
	# declare accessors to expose name and hand
	attr_accessor :name
	attr_accessor :right
	attr_accessor :wrong

	def initialize(name)
		# initialize accessors
		@name = name
	end

end