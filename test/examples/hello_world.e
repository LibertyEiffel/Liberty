class HELLO_WORLD

create {}
	make

feature {}
	make is
		do
			std_output.put_line("Hello, world!")
			debug
				std_output.put_line("Welcome to Liberty!")
			end
		end

end
