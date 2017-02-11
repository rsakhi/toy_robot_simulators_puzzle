module Toy
	require_relative 'base'
	class Application < Toy::Base
		def initialize
			@action = ToyAction.new
		end

		def run
		  loop do
		    raw_input = gets
		    break unless raw_input
		    command = raw_input.gsub(","," ").split
		    command_name = command[0]
		    command_args = command[1..-1]
		    Toy::ToyContoller.new(@action).send(command_name.downcase, command_args) if command_name
		  end
		end
	end
end