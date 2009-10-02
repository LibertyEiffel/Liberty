deferred class EIFFEL_TERMINAL_NODE

inherit
	EIFFEL_NODE

feature {ANY}
	image: EIFFEL_IMAGE is
		deferred
		end

	source_line: INTEGER is
		do
			Result := image.line
		end

	source_column: INTEGER is
		do
			Result := image.column
		end

	source_index: INTEGER is
		do
			Result := image.index
		end

end -- class EIFFEL_TERMINAL_NODE
