module Toy
	class ToyAction < Toy::Application
		attr_reader :board
		attr_reader :robot
		attr_reader :movement

		def initialize(robot: Robot.new, board: Board.new, movement: Movement.new)
			@robot = robot
			@board = board
			@movement = movement
		end

		def place_robot(x_position:, y_position:, face:)
		    robot.x_position = x_position
		    robot.y_position = y_position
		    robot.face = face
		end

		def new_robot_pose(action)
			unless robot.face.nil?
				case action
				when :left
					robot.face = movement.left(robot.face)
				when :right
					robot.face = movement.right(robot.face)
				when :move
					attri = Hash[[:x_position,:y_position,:face].zip(movement.move(robot.x_position, robot.y_position, robot.face.downcase))]
					if valid?(attri)
						place_robot(
			        x_position: attri[:x_position],
			        y_position: attri[:y_position], 
			        face: attri[:face]
				    )
					end
				end
			else
				puts "plaese place the robot first"
			end
		end

		def current_robot_position
			{
	      x_position: robot.x_position,
	      y_position: robot.y_position,
	      face: robot.face,
	    }
		end

		def valid?(new_pose = {})
			valid_direction?(new_pose[:face]) && valid_move?(new_pose) 
		end

		def valid_move?(new_pose = {})
			return true if (0..board.max_x).include?(new_pose[:x_position].to_i) && (0..board.max_y).include?(new_pose[:y_position].to_i)
			puts "Can't move, plaese change the direction or move"
			return false
		end

		def valid_direction?(face)
			return true if Robot::ORIENTATIONS.include?(face.upcase)
			puts "Can't recognise Direction! did you mean North/SOUTH/EAST/WEST"
			return false 
		end
	end
end