class TEST_PARSER

insert
	EIFFELTEST_TOOLS

create {}
	make

feature {}
	make is
		do
			parse_all("../../src")
			parse_all(".")
		end

	parse_all (dirname: STRING) is
		require
			file_tools.is_directory(dirname)
		local
			dir: DIRECTORY
			i: INTEGER
			childname, childpath: STRING
		do
			create dir.scan(dirname)
			label_assert(dirname, dir.last_scan_status)
			from
				i := dir.lower
				childpath := ""
			until
				i > dir.upper
			loop
				childname := dir.item(i)
				if childname.has_suffix(once ".e") then
					bd.compute_file_path_with(dirname, childname)
					childpath.copy(bd.last_entry)
					std_output.put_line(once "Parsing " + childpath)
					parse_code(childpath)
				else
					inspect
						childname
					when "eiffeltest", ".svn", "CVS", ".git", ".", ".." then
						-- ignored
					else
						bd.compute_subdirectory_with(dirname, childname)
						if file_tools.is_directory(bd.last_entry) then
							childpath.copy(bd.last_entry)
							parse_all(childpath)
						else
							-- ignored
						end
					end
				end
				i := i + 1
			end
		end

	read_code (filename: STRING) is
		do
			code.clear_count
			tfr.connect_to(filename)
			message_assert(agent generate_not_connected(filename), tfr.is_connected)
			from
				tfr.read_line
			until
				tfr.end_of_input
			loop
				code.append(tfr.last_string)
				code.extend('%N')
				tfr.read_line
			end
			code.append(tfr.last_string)
			tfr.disconnect
		end

	generate_not_connected (filename: STRING): STRING is
		do
			Result := "Could not connect to " + filename
		end

	parse_code (filename: STRING) is
		do
			read_code(filename)
			buffer.initialize_with(code)
			eiffel.reset
			parser.eval(buffer, eiffel.table, once "Class")
			message_assert(agent generate_syntax_error(filename), parser.error = Void)
			generated.clear
			eiffel.generate(generated)
			label_assert(filename, code.is_equal(generated.to_string))
		end

	generate_syntax_error (filename: STRING): STRING is
		do
			Result := "Syntax error in " + filename + " - " + parser.error.message
		end

	tfr: TEXT_FILE_READ is
		once
			create Result.make
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

	bd: BASIC_DIRECTORY
	file_tools: FILE_TOOLS

end
