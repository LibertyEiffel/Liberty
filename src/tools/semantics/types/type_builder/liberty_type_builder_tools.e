expanded class LIBERTY_TYPE_BUILDER_TOOLS

insert
	LIBERTY_BUILDER_TOOLS

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
					Result.add_last(type_lookup.resolver.export_type(clients.list_item(i).type_definition))
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
	builder: LIBERTY_TYPE_BUILDER
	type: LIBERTY_ACTUAL_TYPE

	ast: LIBERTY_AST_NON_TERMINAL_NODE is
		do
			Result := type.ast
		end

	file: FIXED_STRING is
		do
			Result := type.file
		end

	is_any: BOOLEAN is
		do
			Result := type.name = any_type_name
		end

	any_type_name: FIXED_STRING is
		once
			Result := "ANY".intern
		end

invariant
	builder /= Void
	type /= Void

end -- class LIBERTY_TYPE_BUILDER_TOOLS
