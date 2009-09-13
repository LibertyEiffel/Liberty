class TEST_PARSER

create {}
	make

feature {}
	make is
		local
			code: STRING
			buffer: MINI_PARSER_BUFFER
			parser: DESCENDING_PARSER
		do
			create code.make(0)
			create parser.make
			create buffer
			from
				std_input.read_line
			until
				std_input.end_of_input
			loop
				code.append(std_input.last_string)
				code.extend('%N')
				std_input.read_line
			end
			code.append(std_input.last_string)
			buffer.initialize_with(code)
			parser.eval(buffer, eiffel.table, once "Class")
			if parser.error_message /= Void then
				std_error.put_line(once "Expected:")
				std_error.put_line(parser.error_message)
				die_with_code(1)
			end
			eiffel.generate(std_output)
		end

	eiffel: EIFFEL_GRAMMAR is
		once
			create Result.make(create {LIBERTY_NODE_FACTORY}.make)
		end

end
