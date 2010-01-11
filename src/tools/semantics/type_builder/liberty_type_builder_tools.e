expanded class LIBERTY_TYPE_BUILDER_TOOLS

insert
	LIBERTY_AST_HANDLER
	LIBERTY_ERROR_LEVELS

feature {}
	errors: LIBERTY_ERRORS

	builder: LIBERTY_TYPE_BUILDER
	type: LIBERTY_TYPE
	universe: LIBERTY_UNIVERSE
	effective_generic_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]

	is_any: BOOLEAN is
		do
			Result := type.name = any_type_name
		end

	any_type_name: FIXED_STRING is
		once
			Result := "ANY".intern
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

feature {} -- Client list
	list_clients (clients: LIBERTY_AST_CLIENTS): COLLECTION[LIBERTY_TYPE] is
		local
			i: INTEGER
		do
			if clients.is_empty then
				--|*** TODO: add warning (client list should always be set)
				Result := any_client_list
			elseif clients.list_is_empty then
				Result := empty_client_list
			else
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(clients.list_count)
				from
					i := clients.list_lower
				until
					errors.has_error or else i > clients.list_upper
				loop
					Result.add_last(universe.get_type_from_client(type, clients.list_item(i), effective_generic_parameters))
					i := i + 1
				end
			end
		end

	empty_client_list: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

	any_client_list: COLLECTION[LIBERTY_TYPE] is
		once
			Result := {FAST_ARRAY[LIBERTY_TYPE] << universe.type_any >> }
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
			Result := errors.semantics_position(a_image.index, type.ast, type.file)
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
			Result := errors.semantics_position(a_image.index + a_image.image.count, type.ast, type.file)
		end

invariant
	builder /= Void
	type /= Void
	universe /= Void
	effective_generic_parameters /= Void

end -- class LIBERTY_TYPE_BUILDER_TOOLS
