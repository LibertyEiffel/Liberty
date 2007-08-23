indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_STRING

inherit
	-- STRING redefine make undefine storage TODO: make G_STRING a
	-- proper heir of STRING. This require to handle all the
	-- relationship between STRING's storage and G_STRING handle

	ANY
		redefine 
			copy, 
			is_equal 
		end
	SHARED_C_STRUCT
		redefine
			copy,
			is_equal,
			dispose
		end

insert
	G_STRING_EXTERNALS
	GLIB_STRING_UTILITY_FUNCTIONS
	
creation {ANY}
	make, copy, make_empty, from_string
	
feature {WRAPPER_HANDLER, G_STRING}

	c_string: POINTER is
			-- Pointer to the str field of GString structure pointed by
			-- handle. Speaking in C: c_string == handle->str
		do
			Result := str(handle)
		end
	
feature {ANY}
	count: INTEGER is
		do
			Result := len(handle)
		end
		
	capacity: INTEGER is
		do
			Result := allocated_len(handle)
		end
		
	lower: INTEGER is 0

	upper: INTEGER is
		do
			Result := count
		end

feature {ANY} -- Creation / Modification:
	make (needed_capacity: INTEGER) is
			-- Initialize the string to have at least `needed_capacity'
			-- characters of storage.
		do
			handle := g_string_sized_new (needed_capacity)
			-- The following is needed to comply with the postcondition
			handle := g_string_set_size (handle, needed_capacity)
			store_eiffel_wrapper
			set_unshared
		ensure
			count = needed_capacity
		end

	make_empty is
			-- Create an empty string.
		do
			make(0)
			store_eiffel_wrapper
			set_unshared
		end

	from_string (a_string: STRING) is
			-- Create a new G_STRING from `a_string'
		require a_string_not_void: a_string/=Void
		do
			handle := g_string_new (a_string.to_external)
			store_eiffel_wrapper
			set_unshared
		end
	
feature {ANY} 
	item (i: INTEGER): CHARACTER is
			-- Character at position `i'.
		require
			valid_index: i.in_range (0,count-1)
		local array: NATIVE_ARRAY[CHARACTER]
		do
			Result := array.from_pointer(c_string).item(i)
		end

	hash_code: INTEGER is
		do
			Result := g_string_hash (handle)
		end

	is_equal (other: like Current): BOOLEAN is
			-- Do both strings have the same character sequence?
			--
			-- See also `same_as'.
		do
			Result := g_string_equal( handle, other.handle).to_boolean
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		local i: INTEGER; found: BOOLEAN
		do
			from i:=start_index until not found or else i<=upper
			loop
				if item(i)=c then found := True; Result :=i
				else i:=i+1
				end
			end
		end

	has_suffix (s: STRING): BOOLEAN is
			-- True if suffix of `Current' is `s'.
		do
			Result:=(g_str_has_suffix(handle, s.to_external)).to_boolean
		end

	has_prefix (p: STRING): BOOLEAN is
			-- True if prefix of `Current' is `p'.
		do
			Result:=(g_str_has_prefix(handle, p.to_external)).to_boolean
		end

feature {ANY} -- Modification:
	resize (new_count: INTEGER) is
		do
			g_string_truncate (handle,new_count)
		end

	clear is
		do
			handle := g_string_set_size (handle,0)
		end

	copy (other: like Current) is
			-- Copy `other' onto Current.
		do
			handle := g_string_new_len (str(other.handle), len (other.handle))
		end

	fill_with (c: CHARACTER) is
		local i:INTEGER
		do
			from i:=lower until i<upper loop put(c,i); i:=i+1 end
		end

	append (s: STRING) is
		do
			handle := g_string_append (handle, s.to_external)
		end

	prepend (other: STRING) is
		do
			handle:=g_string_prepend(handle, other.to_external)
		end

	put (c: CHARACTER; i: INTEGER) is
			-- Put `c' at index `i'.
		require valid_index: i.in_range (0,count-1)
		local array: NATIVE_ARRAY[CHARACTER]
		do
			array := array.from_pointer(c_string)
			array.put(c,i)
		end

feature -- Conversion to STRING
	to_string: STRING is
			-- A string holding a copy of Current
		do
			create Result.from_external_copy (c_string)
		end

	as_string: CONST_STRING is
			-- A string holding the very same content of Current
			-- (i.e. using the same memory area.)
		do
			create Result.from_external (c_string)
		end
	
feature {} -- Disposing
	dispose is
		local p: POINTER
		do
			if not is_shared then
				p:=g_string_free (handle, 1)
			end
			unstore_eiffel_wrapper
			handle := default_pointer
		end
	
feature {}
	struct_size: INTEGER is
		external "C inline use <glib.h>"
		alias "sizeof(GString)"
		end
end
	
