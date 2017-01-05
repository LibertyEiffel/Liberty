note
	description: "Generic values, a polymorphic type that can hold values of any other type"
	copyright: "Copyright (C) 2005-2017: , Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

class G_VALUE

inherit
	C_STRUCT
	FREEZABLE

insert
	G_TYPE
	G_TYPES
	GLIB_MEMORY_ALLOCATION export {} all end
	G_VALUE_EXTERNALS
	
create {ANY}
	make, from_external_pointer, with_gtype,
	make_boolean, make_integer, make_natural, make_real, make_real_64, make_real_32,
	make_string, make_object, make_pointer,
	from_boolean, from_integer, from_natural, from_real, from_string,
	from_object, from_pointer

feature {} -- Creation

	make
			-- Create a undefined GValue.
		do
			handle := g_try_malloc0 (struct_size)
			if handle.is_null then raise_exception (No_more_memory) end
			-- handle := g_value_init(malloc_g_value, g_type_invalid)
		ensure
			not_valid: not is_valid
		end

	with_gtype (a_gtype: INTEGER)
			-- Create a GValue that holds values of a_gtype type index. A
			-- GType is a numerical value which represents the unique
			-- identifier of a type registered in the GObject type
			-- system. Fundamental types are provided by G_TYPE_EXTERNALS
			-- (use insert when you need it).
			
			-- TODO: forcing end-user to inherit from an external class
			-- is a temporary solution; provide higher level/more
			-- Eiffellish API.
			
		require valid_type: is_g_type (a_gtype)
		do
			handle := g_value_init (malloc_g_value, a_gtype)
		end

	make_boolean
			-- create a new boolean G_VALUE
		local ptr: POINTER
		do
			ptr := malloc_g_value
			handle := g_value_init (ptr, g_type_boolean)
			check handle=ptr end
			-- Note: from "The Glib Object system v0.10.0" by Mathieu
			-- Lacagetin
			-- (http://www.le-hacker.org/papers/gobject/ch02.html) it
			-- seems that ptr is meaningless: it is thrown away all the
			-- times. We will discard it accordingly. Paolo 2005-06-02
		ensure is_boolean: is_boolean
		end

	make_integer
			-- create a new integer G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_int)
		ensure is_integer: is_integer
		end

	make_natural
			-- create a new natural G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_uint)
		ensure is_natural: is_natural
		end

	make_real, make_real_64
			-- create a new real G_VALUE (Note: using C type `double'
		do
			handle := g_value_init (malloc_g_value, g_type_double)
		ensure is_real: is_real
		end

	make_real_32
			-- create a new REAL_32 G_VALUE (Note: using C type `float')
		do
			handle := g_value_init (malloc_g_value, g_type_double)
		ensure is_real: is_real
		end

	make_string
			-- create a new string G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_string)
		ensure is_string: is_string
		end

	make_object
			-- create a new object G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_object)
		ensure is_object: is_object
		end

	make_pointer
			-- create a new pointer G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_pointer)
		ensure is_pointer: is_pointer
		end

	from_boolean (a_boolean: BOOLEAN)
			-- create a new boolean G_VALUE
		local ptr: POINTER
		do
			ptr := malloc_g_value
			handle := g_value_init (ptr, g_type_boolean)
			check handle=ptr end
			-- Note: from "The Glib Object system v0.10.0" by Mathieu
			-- Lacagetin
			-- (http://www.le-hacker.org/papers/gobject/ch02.html) it
			-- seems that ptr is meaningless: it is thrown away all the
			-- times. We will discard it accordingly. Paolo 2005-06-02
			set_boolean (a_boolean)
		ensure
			is_boolean: is_boolean
			value_set: boolean = a_boolean
		end

	from_integer (a_integer: INTEGER)
			-- create a new integer G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_int)
			set_integer (a_integer)
		ensure
			is_integer: is_integer
			value_set: integer = a_integer
		end

	from_natural (a_natural: INTEGER)
			-- create a new natural G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_uint)
			set_natural (a_natural)
		ensure
			is_natural: is_natural
			value_set: natural = a_natural
		end

	from_real, from_real_64 (a_real: REAL_64)
			-- create a new real G_VALUE (Note: using C type `double'
		do
			handle := g_value_init (malloc_g_value, g_type_double)
			set_real (a_real)
		ensure
			is_real: is_real
			value_set: real = a_real
		end

	from_real_32 (a_real_32: REAL_32)
			-- create a new REAL_32 G_VALUE (Note: using C type `float')
		do
			handle := g_value_init (malloc_g_value, g_type_float)
			set_real_32 (a_real_32)
		ensure
			is_real_32: is_real_32
			value_set: real_32 = a_real_32
		end

	from_string (a_string: STRING)
			-- create a new string G_VALUE
		require string_not_void: a_string/=Void
		do
			handle := g_value_init (malloc_g_value, g_type_string)
			set_string (a_string)
		ensure
			is_string: is_string
			value_set: string.is_equal(a_string)
		end

	from_object (an_object: G_OBJECT)
			-- create a new object G_VALUE
		require object_not_void: an_object/=Void
		do
			handle := g_value_init (malloc_g_value, g_type_object)
			set_object (an_object)
		ensure
			is_object: is_object
			value_set: object.is_equal(an_object.handle)
		end

	from_pointer (a_pointer: POINTER)
			-- create a new pointer G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_pointer)
			set_pointer (a_pointer)
		ensure
			is_pointer: is_pointer
			value_set: pointer.is_equal (a_pointer)
		end

feature {ANY}

	is_initialized: BOOLEAN
			-- Returns True if value is a valid and initialized G_VALUE
		do
			Result := g_is_value (handle).to_boolean
		end

	type_name: STRING
			-- type name of value
		do
			create Result.from_external (g_value_type_name (handle))
		end

	type: INTEGER
			-- GType numerical value
		do
			Result := g_value_type (handle)
		end

	is_valid: BOOLEAN
		do
			Result := (type /= g_type_invalid)
		end

	is_a (a_type: INTEGER): BOOLEAN
			-- Is Current gtype conforming to `a_type'?
		do
			Result := g_type_is_a (type, a_type).to_boolean
		end

	holds (a_type: INTEGER): BOOLEAN
		require
			is_g_type (a_type)
		do
			Result := g_value_holds (handle, a_type).to_boolean
		end

feature {ANY} -- Boolean
	is_boolean: BOOLEAN
			-- Is current value a boolean?
		do
			Result := g_value_holds_boolean (handle).to_boolean
		end

	boolean: BOOLEAN
			-- If the current value is a boolean, return it
		require
			is_boolean: is_boolean
		do
			Result := (g_value_get_boolean (handle) = 1)
		end


	set_boolean (a_value: BOOLEAN)
			-- If the current value is a boolean, set it.
		require
			is_boolean: is_boolean
		do
			g_value_set_boolean (handle, a_value.to_integer)
		end

feature {ANY} -- Integer
	is_integer: BOOLEAN
			-- Is current value an integer?
		do
			Result := g_value_holds_int (handle).to_boolean
		end

	integer: INTEGER
			-- If current value is an integer, returns it
		require
			is_integer: is_integer
		do
			Result := g_value_get_int (handle)
		end

	set_integer (a_value: INTEGER)
			-- If the current value is a integer, set it.
		require
			is_integer: is_integer
		do
			g_value_set_int (handle, a_value)
		end

feature {ANY} -- Natural
	is_natural: BOOLEAN
			-- Is current value an natural?
		do
			Result := g_value_holds_uint (handle).to_boolean
		end

	natural: INTEGER
			-- If current value is an natural, returns it
		require
			is_natural: is_natural
		do
			Result := g_value_get_uint (handle)
		end

	set_natural (a_value: INTEGER)
			-- If the current value is a natural, set it.
		require
			is_natural: is_natural
		do
			g_value_set_uint (handle, a_value)
		end

feature {ANY} -- Real

	is_real, is_real_64: BOOLEAN
			-- Is current value a real? Note: REAL is mapped to C double
		do
			Result := g_value_holds_double (handle).to_boolean
		end

	real, real_64: REAL
			-- If current value is an real, returns it. Note: REAL is mapped to C double
		require
			is_real: is_real
		do
			Result := g_value_get_double (handle)
		end

	set_real, set_real_64 (a_value: REAL_64)
			-- If the current value is a real, set it. Note: REAL is mapped to C double
		require
			is_real: is_real
		do
			g_value_set_double (handle, a_value)
		end

feature {ANY} -- Real_32

	is_real_32: BOOLEAN
			-- Is current value a REAL_32? Note: REAL is mapped to C float
		do
			Result := g_value_holds_float (handle).to_boolean
		end

	real_32: REAL_32
			-- If current value is an real_32, returns it. Note: REAL is mapped to C float
		require
			is_real_32: is_real_32
		do
			Result := g_value_get_float (handle)
		end

	set_real_32 (a_value: REAL_32)
			-- If the current value is a REAL_32, set it. Note: REAL_32 is mapped to C float
		require
			is_real_32: is_real_32
		do
			g_value_set_float (handle, a_value)
		end

feature {ANY} -- Character

	is_character: BOOLEAN
			-- Is current value a character?
		do
			Result := g_value_holds_char (handle).to_boolean
		end

	character: CHARACTER
			-- If current value is an character, returns it.
		require
			is_character: is_character
		do
			Result := g_value_get_char (handle)
		end

	set_character (a_value: CHARACTER)
			-- If the current value is a character, set it.
		require
			is_character: is_character
		do
			g_value_set_char (handle, a_value)
		end

feature {ANY} -- String

	is_string: BOOLEAN
			-- Is current value a string?
		do
			Result := g_value_holds_string (handle).to_boolean
		end

	string: STRING
			-- If current value is an string, returns it.
			-- Note that a gvalue might be holding a NULL string
		require
			is_string: is_string
		local
			p: POINTER
		do
			p := g_value_get_string (handle)
			if p.is_not_null then
				-- ATTENTION: because this returns a const, we need to copy the memory
				-- const gchar* g_value_get_string (const GValue *value);
				create Result.from_external_copy (p)
			end
		end

	set_string (a_value: STRING)
			-- If the current value is a string, set it.
		require
			is_string: is_string
			value_not_void: a_value/=Void
		do
			g_value_set_string (handle, a_value.to_external)
		end

feature {ANY} -- Object

	is_object: BOOLEAN
			-- Is current value an object?
		do
			Result := g_value_holds_object(handle).to_boolean
		end

	object: POINTER
			-- If current value is an string, returns it.
		require
			is_object: is_object
		do
			Result := g_value_get_object (handle)
		end

	set_object (a_value: G_OBJECT)
			-- If the current value is an object, set it.
		require
			a_value /= Void
			is_object: is_object
		do
			g_value_set_object (handle, a_value.handle)
		end

feature {ANY} -- Pointer

	is_pointer: BOOLEAN
			-- Is current value a pointer?
		do
			Result := g_value_holds_pointer (handle).to_boolean
		end

	pointer: POINTER
			-- If current value is a pointer, returns it.
		require
			is_pointer: is_pointer
		do
			Result := g_value_get_pointer (handle)
		end

	set_pointer (a_value: POINTER)
			-- If the current value is a pointer, set it.
		require
			is_pointer: is_pointer
		do
			g_value_set_pointer (handle, a_value)
		end

	-- TODO: wrap all Parameter specification functions, such as
	-- g_param_spec_* ()

feature {G_OBJECT} -- Type changing features

	turn_to_boolean
			-- Reset Current and make it a boolean value
		do
			if is_initialized then
				g_value_unset (handle)
			end
			handle := g_value_init (handle, g_type_boolean)
		ensure
			is_boolean: is_boolean
		end

	turn_to_integer
			-- Reset Current and make it a integer value
		do
			if is_initialized then
				g_value_unset (handle)
			end
			handle := g_value_init (handle, g_type_int)
		ensure
			is_integer: is_integer
		end

	turn_to_natural
			-- Reset Current and make it a natural value
		do
			if is_initialized then
				g_value_unset (handle)
			end
			handle := g_value_init (handle, g_type_uint)
		ensure
			is_natural: is_natural
		end

	turn_to_real, turn_to_real_64
			-- Reset Current and make it a real value
		do
			if is_initialized then
				g_value_unset (handle)
			end
			handle := g_value_init (handle, g_type_double)
		ensure
			is_real: is_real
		end

	turn_to_real_32
			-- Reset Current and make it a REAL_32 value
		do
			if is_initialized then
				g_value_unset (handle)
			end
			handle := g_value_init (handle, g_type_float)
		ensure
			is_real_32: is_real_32
		end

	turn_to_string
			-- Reset Current and make it a string value
		do
			if is_initialized then
				g_value_unset (handle)
			end
			handle := g_value_init (handle, g_type_string)
		ensure
			is_string: is_string
		end

feature {ANY}
	struct_size: INTEGER
		external "C inline use <glib-object.h>"
		alias "sizeof(GValue)"
		end

feature {} -- Disposing

	dispose
		-- If not petriefied unset and free the value.
		do
			if not is_petrified then
				if is_initialized then
					g_value_unset (handle)
				else
					print ("G_VALUE::dispose: disposing an uninitialised G_VALUE%N")
				end
				g_free (handle)
			end
			handle := default_pointer
		end

invariant

	handle_not_null: is_not_null
--	is_initialized

end
