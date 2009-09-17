expanded class UNICODE_PARSER_POSITION

feature {UNICODE_PARSER_BUFFER}
	index, line, column: INTEGER

	set (i, l, c: INTEGER) is
		do
			index := i
			line := l
			column := c
		end

end -- class UNICODE_PARSER_POSITION
