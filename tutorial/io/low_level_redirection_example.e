class LOW_LEVEL_REDIRECTION_EXAMPLE

insert
	STREAM_HANDLER

creation
	make

feature
	make is
		do
			std_input.redirect_from("low_level_redirection_example.e")
			check
				std_input.redirection_succeeded
			end
			std_output.redirect_to("low_level_redirection_example.log")
			check
				std_output.redirection_succeeded
			end
			std_input.read_line
			std_output.put_string(std_input.last_string)
			std_output.put_new_line
		end

end -- class LOW_LEVEL_REDIRECTION_EXAMPLE
