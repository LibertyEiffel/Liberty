deferred class EIFFEL_IMAGE

inherit
	PARSER_IMAGE
		redefine
			out_in_tagged_out_memory
		end

feature {ANY}
	image: STRING
			-- the real image of the token

	blanks: STRING
			-- the leading blanks and comments (before the `image' itself)

	line: INTEGER is
		do
			Result := position.line
		end

	column: INTEGER is
		do
			Result := position.column
		end

	index: INTEGER is
		do
			Result := position.index
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(image)
		end

feature {}
	position: EIFFEL_POSITION
			-- the position of the `image' (discarding the leading `blanks')

invariant
	image /= Void

end -- class EIFFEL_IMAGE
