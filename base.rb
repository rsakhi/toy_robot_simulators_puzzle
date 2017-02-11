module Toy	
	class Base 
		def method_missing(method, *args, &block)
			puts "Invalid action"
		end

		def valid_argument?(args)
			args && args.flatten.size == 3 && is_num?(args.flatten[0]) && is_num?(args.flatten[1]) && !is_num?(args.flatten[2])
		end

		def is_num?(str)
		  !!Integer(str)
		rescue ArgumentError, TypeError
		  false
		end
	end
end