module Toy
	Dir[File.join(File.dirname(__FILE__), "*.rb")].each do |file|
	  require_relative file unless file.include? "toy_robot_simulator.rb"
	end
end