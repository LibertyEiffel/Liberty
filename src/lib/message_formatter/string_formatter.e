deferred class STRING_FORMATTER

inherit
	MESSAGE_FORMATTER[CHARACTER]

feature {}
	delimiter: CHARACTER is '@'

	opening_brace: CHARACTER is '('

	closing_brace: CHARACTER is ')'

	is_digit (c: CHARACTER): BOOLEAN is
		do
			Result := c.is_digit
		end

	value (c: CHARACTER): INTEGER is
		do
			Result := c.value
		end

end -- class STRING_FORMATTER
