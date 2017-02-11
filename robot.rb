module Toy
	class Robot
		attr_accessor :x_position
		attr_accessor :y_position
		attr_accessor :face

		ORIENTATIONS = [
			NORTH = 'NORTH',
			EAST = 'EAST',
			SOUTH = 'SOUTH',
			WEST = 'WEST',
		]
	end
end