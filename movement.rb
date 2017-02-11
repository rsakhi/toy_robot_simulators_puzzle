module Toy
	class Movement
		attr_accessor :direction
		def initialize
			@direction = { 0 => "north", 90 => "east", 180 => "south", 270 => 'west', 360 => "north"}
		end

		def left face
			current = direction.key(face)
			current = 360 if current == 0
			direction[current - 90]
		end

		def right face
			current = direction.key(face)
			current = 0 if current == 360
			direction[current + 90]
		end

		def move x_position,y_position,face
			case face
			when "north"
				[x_position,y_position.to_i+1, face]
			when "south"
				[x_position,y_position.to_i - 1, face]
			when "west"
				[x_position.to_i - 1,y_position,face]
			when "east"
				[x_position.to_i + 1,y_position,face]
			end
		end
	end
end