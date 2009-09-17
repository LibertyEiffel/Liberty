expanded class EIFFEL_POSITION

insert
	ANY
		redefine
			default_create
		end

creation {EIFFEL_GRAMMAR}
	default_create

feature {EIFFEL_GRAMMAR}
	next (buffer: MINI_PARSER_BUFFER): like Current is
		do
			buffer.next
			index := buffer.current_index
			if not buffer.end_reached then
				inspect
					buffer.current_character
				when '%N' then
					line := line + 1
					column := 1
				else
					column := column + 1
				end
			end
			Result := Current
		end

feature {EIFFEL_GRAMMAR, EIFFEL_IMAGE}
	line: INTEGER
	column: INTEGER
	index: INTEGER

feature {}
	default_create is
		do
			index := 1
			line := 1
			column := 1
		end

end
