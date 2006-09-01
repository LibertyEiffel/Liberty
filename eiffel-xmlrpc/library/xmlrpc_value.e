class XMLRPC_VALUE

inherit
	SHARED_C_STRUCT
		redefine from_external_pointer end

insert
	XMLRPC_VALUE_EXTERNALS

creation from_external_pointer

feature -- size

	struct_size: INTEGER is
		external "C inline use <xmlrpc-c/base.h>"
		alias "sizeof (xmlrpc_value)"
		end

feature -- Creation

	from_external_pointer (a_pointer: POINTER) is
		do
			is_shared := True
			Precursor (a_pointer)
		end

feature

	type: INTEGER is
		require
			handle.is_not_null
		do
			Result := xmlrpc_value_type (handle)
		ensure
			is_valid_xmlrpc_value_type (Result)
		end

	is_value_int: BOOLEAN is
		do
			Result := type = xmlrpc_value_int
		end

	is_value_bool: BOOLEAN is
		do
			Result := type = xmlrpc_value_bool
		end

	is_value_double: BOOLEAN is
		do
			Result := type = xmlrpc_value_double
		end

	is_value_datetime: BOOLEAN is
		do
			Result := type = xmlrpc_value_datetime
		end

	is_value_string: BOOLEAN is
		do
			Result := type = xmlrpc_value_string
		end

	is_value_base64: BOOLEAN is
		do
			Result := type = xmlrpc_value_base64
		end

	is_value_array: BOOLEAN is
		do
			Result := type = xmlrpc_value_array
		end

	is_value_struct: BOOLEAN is
		do
			Result := type = xmlrpc_value_struct
		end

	is_value_c_ptr: BOOLEAN is
		do
			Result := type = xmlrpc_value_c_ptr
		end

	is_value_nil: BOOLEAN is
		do
			Result := type = xmlrpc_value_nil
		end

	is_value_dead: BOOLEAN is
		do
			Result := type = xmlrpc_value_dead
		end

feature -- Convertion to different value types

	value_int: XMLRPC_VALUE_INT is
		require
			is_value_int
		do
			create Result.from_value (Current)
		end

	value_bool: XMLRPC_VALUE_BOOL is
		require
			is_value_bool
		do
			create Result.from_value (Current)
		end

--	value_double: XMLRPC_VALUE_DOUBLE is
--		require
--			is_value_double
--		do
--			create Result.from_value (Current)
--		end
--
--	value_datetime: XMLRPC_VALUE_DATETIME is
--		require
--			is_value_datetime
--		do
--			create Result.from_value (Current)
--		end
--
--	value_string: XMLRPC_VALUE_STRING is
--		require
--			is_value_string
--		do
--			create Result.from_value (Current)
--		end
--
--	value_base64: XMLRPC_VALUE_BASE64 is
--		require
--			is_value_base64
--		do
--			create Result.from_value (Current)
--		end

	value_array: XMLRPC_VALUE_ARRAY is
		require
			is_value_array
		do
			create Result.from_value (Current)
		end

--	value_struct: XMLRPC_VALUE_STRUCT is
--		require
--			is_value_struct
--		do
--			create Result.from_value (Current)
--		end
--
--	value_c_ptr: XMLRPC_VALUE_C_PTR is
--		require
--			is_value_c_ptr
--		do
--			create Result.from_value (Current)
--		end
--
--	value_nil: XMLRPC_VALUE_NIL is
--		require
--			is_value_nil
--		do
--			create Result.from_value (Current)
--		end
--
--	value_dead: XMLRPC_VALUE_DEAD is
--		require
--			is_value_dead
--		do
--			create Result.from_value (Current)
--		end

end -- class XMLRPC_VALUE
