class TEST_PARSER

insert
	EIFFELTEST_TOOLS

create {}
	make

feature {}
	make is
		do
			--parse_code(create {REGULAR_FILE}.make("../../src/lib/kernel/tuple.e"))
			--die_with_code(0)
			parse_all(create {DIRECTORY}.scan("../../src"))
			parse_all(create {DIRECTORY}.scan("."))
		end

	parse_all (a_directory: DIRECTORY) is
		require
			a_directory /= Void
		local
			dir: DIRECTORY; file: FILE; regular: REGULAR_FILE
			i: INTEGER
		do
			label_assert(a_directory.path.out, a_directory.exists)
			from
				i := a_directory.lower
			until
				i > a_directory.upper
			loop
				file := a_directory.file_at(i)
				if file.is_regular and then file.name.has_suffix(once ".e") then
					regular ::= file
					parse_code(regular)
				else
					inspect
						file.name.out
					when "eiffeltest", ".svn", "CVS", ".git", ".", ".." then
						-- ignored
					when "broken", "wrappers" then
						-- ignored
					else
						if file.is_directory then
							dir ::= file
							parse_all(dir)
						else
							-- ignored
						end
					end
				end
				i := i + 1
			end
		end

	read_code (file: REGULAR_FILE) is
		local
			in: INPUT_STREAM
		do
			code.clear_count
			in := file.read
			from
				in.read_line
			until
				in.end_of_input
			loop
				code.append(in.last_string)
				code.extend('%N')
				in.read_line
			end
			code.append(in.last_string)
			in.disconnect
		end

	generate_not_connected (filename: STRING): STRING is
		do
			Result := "Could not connect to " + filename
		end

	parse_code (file: REGULAR_FILE) is
		do
			std_output.put_line(once "Parsing " + file.path)
			read_code(file)
			buffer.initialize_with(code)
			eiffel.reset
			if file.name.out.is_equal(once "tuple.e") then
				parser.eval(buffer, eiffel.table, once "Classes")
			else
				parser.eval(buffer, eiffel.table, once "Class")
			end
			message_assert(agent generate_syntax_error(file), parser.error = Void)
			generated.clear
			eiffel.generate(generated)
			message_assert(agent generate_generated_error(file), code.is_equal(generated.to_string))
		end

	generate_generated_error (file: REGULAR_FILE): STRING is
		local
			tfw: TEXT_FILE_WRITE
		do
			create tfw.connect_to(file.name.out)
			tfw.put_string(code)
			tfw.disconnect
			tfw.connect_to(file.name.out + ".gen")
			tfw.put_string(generated.to_string)
			tfw.disconnect
			Result := "Bad generation from " + file.path.out + "%N> diff " + file.name.out + " " + file.name.out + ".gen%N"
		end

	generate_syntax_error (file: REGULAR_FILE): STRING is
		local
			line, column, index: INTEGER
		do
			from
				index := 1
				line := 1
				column := 1
			until
				index = parser.error.index
			loop
				if code.item(index) = '%N' then
					line := line + 1
					column := 1
				else
					column := column + 1
				end
				index := index + 1
			end
			Result := "Syntax error in " + file.path + ", line " + line.out + ", column " + column.out + ":%N" + parser.error.message
		end

	code: STRING is
		once
			create Result.make(0)
		end

	generated: STRING_OUTPUT_STREAM is
		once
			create Result.make
		end

	buffer: MINI_PARSER_BUFFER is
		once
			create Result
		end

	parser: DESCENDING_PARSER is
		once
			create Result.make
		end

	eiffel: EIFFEL_GRAMMAR is
		once
			create Result.make(create {LIBERTY_NODE_FACTORY}.make)
		end

end
