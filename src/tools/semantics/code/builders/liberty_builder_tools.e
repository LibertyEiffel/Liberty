deferred class LIBERTY_BUILDER_TOOLS

insert
	LIBERTY_AST_HANDLER
	LIBERTY_ERROR_LEVELS

feature {}
	errors: LIBERTY_ERRORS
	torch: LIBERTY_ENLIGHTENING_THE_WORLD
	logging: LOGGING
	type_lookup: LIBERTY_TYPE_LOOKUP

	universe: LIBERTY_UNIVERSE is
		deferred
		end

	effective_generic_parameters: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]

	ast: LIBERTY_AST_NON_TERMINAL_NODE is
		deferred
		ensure
			Result /= Void
		end

	file: FIXED_STRING is
		deferred
		ensure
			Result /= Void
		end

feature {}
	decoded_string (string_image: LIBERTY_AST_STRING): STRING is
		require
			{TYPED_EIFFEL_IMAGE[STRING]} ?:= string_image.image
		local
			s: TYPED_EIFFEL_IMAGE[STRING]
		do
			s ::= string_image.image
			Result := s.decoded
		end

feature {}
	semantics_position_at (a_node: EIFFEL_NODE): LIBERTY_POSITION is
		require
			{LIBERTY_AST_TERMINAL_NODE} ?:= a_node
		local
			node: LIBERTY_AST_TERMINAL_NODE
		do
			node ::= a_node
			Result := image_semantics_position_at(node.image)
		end

	image_semantics_position_at (a_image: EIFFEL_IMAGE): LIBERTY_POSITION is
		do
			Result := errors.semantics_position(a_image.index, ast, file)
		end

	semantics_position_after (a_node: EIFFEL_NODE): LIBERTY_POSITION is
		require
			{LIBERTY_AST_TERMINAL_NODE} ?:= a_node
		local
			node: LIBERTY_AST_TERMINAL_NODE
		do
			node ::= a_node
			Result := image_semantics_position_after(node.image)
		end

	image_semantics_position_after (a_image: EIFFEL_IMAGE): LIBERTY_POSITION is
		do
			Result := errors.semantics_position(a_image.index + a_image.image.count, ast, file)
		end

invariant
	universe /= Void
	effective_generic_parameters /= Void

end -- class LIBERTY_BUILDER_TOOLS
