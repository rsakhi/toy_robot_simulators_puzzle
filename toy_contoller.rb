module Toy
	
	class ToyContoller < Application
		def initialize(action)
			@action = action
		end
		def place(*args)
			if valid_argument?(args)
				attri = Hash[[:x_position, :y_position, :face].zip(args.flatten)]
				if @action.valid?(attri)
					@action.place_robot(
				        x_position: attri[:x_position],
				        y_position: attri[:y_position], 
				        face: attri[:face]
				    )
				else 
					puts "invalid step"
				end
			else
				puts "Formate error, plase insert valid formate. for more details type help."
			end
		end

		def move(*args)
			@action.new_robot_pose(:move)
		end

		def stop(*args)
			exit
		end

		def left(*args)
			@action.new_robot_pose(:left)
		end

		def right(*args)
			@action.new_robot_pose(:right)
		end

		def report(*args)
			puts @action.current_robot_position.values.join(",")
		end

		def help(*agrs)
			puts "------------actions--------------- \n 1. PLACE int,int,direction \n 2. LEFT \n 3. RIGHT \n 4. MOVE \n 5. REPORT \n 6. STOP"
		end
	end
end