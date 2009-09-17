expanded class POINTER
	--
	-- References to objects meant to be exchanged with non-Eiffel software.
	--
	-- Note : An Eiffel POINTER is mapped as C type "Void *" or as
	-- Java "java.lang.Object" type.
	--

insert
	HASHABLE
		redefine out_in_tagged_out_memory, fill_tagged_out_memory
		end

	STRING_HANDLER
		redefine out_in_tagged_out_memory, fill_tagged_out_memory
		end

feature {ANY}
	is_null: BOOLEAN is
			-- Is the external POINTER a NULL pointer ?
		do
			Result := not is_not_null
		end

	is_not_null: BOOLEAN is
			-- Is the external POINTER a non-NULL pointer ?
		external "built_in"
		end

	to_string: STRING is
		do
			string_buffer.clear_count
			Current.append_in(string_buffer)
			Result := string_buffer.twin
		end

	append_in (buffer: STRING) is
			-- Append on `str' a viewable version of `Current'.
		local
			storage: NATIVE_ARRAY[CHARACTER]; i: INTEGER
		do
			from
				storage := string_buffer.storage
				sprintf_pointer(storage, Current)
				i := 0
			until
				storage.item(i) = '%U'
			loop
				buffer.extend(storage.item(i))
				i := i + 1
			end
		end

	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			Current.append_in(tagged_out_memory)
		end

	hash_code: INTEGER is
		do
			Result := pointer_hash_code(Current)
		end

	infix "+" (offset: INTEGER): POINTER is
			-- `Current' moved by an offset of `offset' bytes.
		do
			Result := pointer_plus(Current, offset)
		end

	to_any: ANY is
			-- Dangerous forced conversion. This function assume that `Current'
			-- is really a reference to some Eiffel allocated object.
		do
			Result := pointer_to_any(Current)
		end

feature {}
	sprintf_pointer (native_array: NATIVE_ARRAY[CHARACTER]; p: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_sprintf"
			feature_name: "sprintf_pointer"
			}"
		end

	pointer_hash_code (p: POINTER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_pointer"
			feature_name: "pointer_hash_code"
			}"
		end

	pointer_to_any (p: POINTER): ANY is
			-- Dangerous forced conversion. This function assume that `p' is
			-- really a reference to some Eiffel allocated object.
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_pointer"
			feature_name: "pointer_to_any"
			}"
		end

	pointer_plus (p: POINTER; offset: INTEGER): POINTER is
			-- Pointer `p' moved by an offset of `offset' bytes.
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_pointer"
			feature_name: "pointer_plus"
			}"
		end

	string_buffer: STRING is
		once
			create Result.make(64)
		end

end -- class POINTER
