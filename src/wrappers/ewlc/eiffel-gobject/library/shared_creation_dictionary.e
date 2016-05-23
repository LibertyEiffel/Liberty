deferred class SHARED_CREATION_DICTIONARY
	-- Shared creation-agents dictionary.

inherit ANY undefine is_equal, copy end

feature {ANY}
	creation_agents_by_type: HASHED_DICTIONARY[FUNCTION[TUPLE[POINTER],G_OBJECT],INTEGER_32] is
		-- A dictionary of agent funtions that return a G_OBJECT.
		-- Key shall be the GType of the G_OBJECT returned by the
		-- value agent. Each value agent receive a pointer and
		-- returns a G_OBJECT initialized with that pointer as handle
		once
			create Result.make
		end

	creation_agents: HASHED_DICTIONARY[FUNCTION[TUPLE[POINTER],G_OBJECT],STRING] is
			-- A dictionary of agent funtions that return a G_OBJECT.
			-- Key shall be the type name of the G_OBJECT returned by the
			-- value agent. Each value agent receive a pointer and
			-- returns a G_OBJECT initialized with that pointer as handle
		once
			create Result.make
		end

	-- invariant all items in creation_agents shall return a G_OBJECT
	-- of correct type, i.e. its type must be equal to those of its
	-- key. I'm not absolutely sure this is an actual invariant. In
	-- fact a GObject class could be theorically unloaded and its type
	-- number de-registered and re-assigned to a different class loaded
	-- later on.

feature {} -- Auxialiary features
	update_creation_agents_by_type_with (a_pointer: POINTER) is
		local type: INTEGER; typename: STRING
		do
			not_yet_implemented
		end

	print_functions is
			-- Print all functions in
		local key_iter: ITERATOR[STRING]; key: STRING; function: FUNCTION[TUPLE[POINTER],G_OBJECT];
		do
			from key_iter:=creation_agents.get_new_iterator_on_keys; key_iter.start
			until key_iter.is_off
			loop
				key:=key_iter.item
				std_error.put_string(once "Class %"")
				std_error.put_string(key)
				std_error.put_string("%" function ")
				std_error.put_line(creation_agents.at(key).out)
				key_iter.next
			end
		end
	print_function (a_stream: OUTPUT_STREAM; f: FUNCTION[TUPLE[POINTER],G_OBJECT]; c: STRING) is
		require 
			a_stream/=Void; f/=Void; c/=Void
		do
			a_stream.put_string(once "Class %"")
			a_stream.put_string(c)
			a_stream.put_string("%" function ")
			a_stream.put_line(f.out)
		end

end -- class SHARED_CREATION_DICTIONARY
