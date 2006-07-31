indexing

	description: "Generic values, a polymorphic type that can hold values of any other type"

	copyright: "Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

class G_VALUE

inherit
	SHARED_C_STRUCT redefine dispose end

insert
	G_TYPE
	GLIB_MEMORY_ALLOCATION export {NONE} all end
	G_VALUE_EXTERNALS

creation
	make, from_external_pointer, with_gtype,
	make_boolean, make_integer, make_natural, make_real, make_string, make_object,
	from_boolean, from_integer, from_natural, from_real, from_string, from_object

feature {NONE} -- Creation
	make is
			-- Create a undefined GValue.
		do
			handle := g_value_init(malloc_g_value, g_type_invalid)
		ensure then not is_valid
		end

	with_gtype (a_gtype: INTEGER) is
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
			handle := g_value_init(malloc_g_value, a_gtype)
		end

	make_boolean is
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

	make_integer is
			-- create a new integer G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_int)
		ensure is_integer: is_integer
		end

	make_natural is
			-- create a new natural G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_uint)
		ensure is_natural: is_natural
		end

	make_real is
			-- create a new real G_VALUE (Note: using C type `double'
		do
			handle := g_value_init (malloc_g_value, g_type_double)
		ensure is_real: is_real
		end

	make_string is
			-- create a new string G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_string)
		ensure is_string: is_string
		end

	make_object is
			-- create a new object G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_object)
		ensure is_object: is_object
		end

	from_boolean (a_boolean: BOOLEAN) is
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

	from_integer (a_integer: INTEGER) is
			-- create a new integer G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_int)
			set_integer (a_integer)
		ensure
			is_integer: is_integer
			value_set: integer = a_integer
		end

	from_natural (a_natural: INTEGER) is
			-- create a new natural G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_uint)
			set_natural (a_natural)
		ensure
			is_natural: is_natural
			value_set: natural = a_natural
		end

	from_real (a_real: REAL) is
			-- create a new real G_VALUE (Note: using C type `double'
		do
			handle := g_value_init (malloc_g_value, g_type_double)
			set_real (a_real)
		ensure
			is_real: is_real
			value_set: real = a_real
		end

	from_string (a_string: STRING) is
			-- create a new string G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_string)
			set_string (a_string)
		ensure
			is_string: is_string
			value_set: string.is_equal(a_string)
		end

	from_object (an_object: G_OBJECT) is
			-- create a new object G_VALUE
		do
			handle := g_value_init (malloc_g_value, g_type_object)
			set_object (an_object)
		ensure
			is_object: is_object
			value_set: object.is_equal(an_object.handle)
		end

feature {ANY}
	type_name: STRING is
			-- type name of value
		do
			create Result.from_external (g_value_type_name (handle))
		end

	type: INTEGER is
			-- GType numerical value
		do
			Result := g_value_type (handle)
		end

	is_valid: BOOLEAN is
		do
			Result := (type /= g_type_invalid)
		end
	
	is_a (a_type: INTEGER): BOOLEAN is
			-- Is Current gtype conforming to `a_type'?
		do
			Result := g_type_is_a (type, a_type).to_boolean
		end

feature {ANY} -- Boolean
	is_boolean: BOOLEAN is
			-- Is current value a boolean?
		do
			Result := g_value_holds_boolean (handle).to_boolean
		end

	boolean: BOOLEAN is
			-- If the current value is a boolean, return it
		require
			is_boolean: is_boolean
		do
			Result := (g_value_get_boolean (handle) = 1)
		end


	set_boolean (a_value: BOOLEAN) is
			-- If the current value is a boolean, set it.
		require
			is_boolean: is_boolean
		do
			g_value_set_boolean (handle, a_value.to_integer)
		end

feature {ANY} -- Integer
	is_integer: BOOLEAN is
			-- Is current value an integer?
		do
			Result := g_value_holds_int (handle).to_boolean
		end

	integer: INTEGER is
			-- If current value is an integer, returns it
		require
			is_integer: is_integer
		do
			Result := g_value_get_int (handle)
		end

	set_integer (a_value: INTEGER) is
			-- If the current value is a integer, set it.
		require
			is_integer: is_integer
		do
			g_value_set_int (handle, a_value)
		end

feature {ANY} -- Natural
	is_natural: BOOLEAN is
			-- Is current value an natural?
		do
			Result := g_value_holds_uint (handle).to_boolean
		end

	natural: INTEGER is
			-- If current value is an natural, returns it
		require
			is_natural: is_natural
		do
			Result := g_value_get_uint (handle)
		end

	set_natural (a_value: INTEGER) is
			-- If the current value is a natural, set it.
		require
			is_natural: is_natural
		do
			g_value_set_uint (handle, a_value)
		end

feature {ANY} -- Real

	is_real: BOOLEAN is
			-- Is current value a real? Note: REAL is mapped to C double
		do
			Result := g_value_holds_double (handle).to_boolean
		end

	real: REAL is
			-- If current value is an real, returns it. Note: REAL is mapped to C double
		require
			is_real: is_real
		do
			Result := g_value_get_double (handle)
		end

	set_real (a_value: REAL) is
			-- If the current value is a real, set it. Note: REAL is mapped to C double
		require
			is_real: is_real
		do
			g_value_set_double (handle, a_value)
		end

feature {ANY} -- Character

	is_character: BOOLEAN is
			-- Is current value a character?
		do
			Result := g_value_holds_char (handle).to_boolean
		end

	character: CHARACTER is
			-- If current value is an character, returns it.
		require
			is_character: is_character
		do
			Result := g_value_get_char (handle)
		end

	set_character (a_value: CHARACTER) is
			-- If the current value is a character, set it.
		require
			is_character: is_character
		do
			g_value_set_char (handle, a_value)
		end

feature {ANY} -- String

	is_string: BOOLEAN is
			-- Is current value a string?
		do
			Result := g_value_holds_string (handle).to_boolean
		end

	string: STRING is
			-- If current value is an string, returns it.
		require
			is_string: is_string
		do
			create Result.from_external (g_value_get_string (handle))
		end

	set_string (a_value: STRING) is
			-- If the current value is a string, set it.
		require
			is_string: is_string
		do
			g_value_set_string (handle, a_value.to_external)
		end

feature {ANY} -- Object

	is_object: BOOLEAN is
			-- Is current value an object?
		do
			Result := g_value_holds_object(handle).to_boolean
		end

	object: POINTER is
			-- If current value is an string, returns it.
		require
			is_object: is_object
		do
			Result := g_value_get_object (handle)
		end

	set_object (a_value: G_OBJECT) is
			-- If the current value is an object, set it.
		require
			is_object: is_object
		do
			g_value_set_object (handle, a_value.handle)
		end

feature {ANY} -- Pointer

	is_pointer: BOOLEAN is
			-- Is current value a pointer?
		do
			Result := g_value_holds_pointer (handle).to_boolean
		end

	pointer: POINTER is
			-- If current value is a pointer, returns it.
		require
			is_pointer: is_pointer
		do
			Result := g_value_get_pointer (handle)
		end

	set_pointer (a_value: POINTER) is
			-- If the current value is a pointer, set it.
		require
			is_pointer: is_pointer
		do
			g_value_set_pointer (handle, a_value)
		end

	-- TODO: wrap all Parameter specification functions, such as
	-- g_param_spec_* ()

feature {G_OBJECT} -- Type changing features
	turn_to_boolean is
			-- Reset Current and make it a boolean value
		do
			g_value_unset (handle)
			handle := g_value_init (handle, g_type_boolean)
		ensure is_boolean: is_boolean
		end


	turn_to_integer is
			-- Reset Current and make it a integer value
		do
			g_value_unset (handle)
			handle := g_value_init (handle, g_type_int)
		ensure is_integer: is_integer
		end
	
	turn_to_natural is
			-- Reset Current and make it a natural value
		do
			g_value_unset (handle)
			handle := g_value_init (handle, g_type_uint)
		ensure is_natural: is_natural
		end

	turn_to_real is
			-- Reset Current and make it a real value
		do
			g_value_unset (handle)
			handle := g_value_init (handle, g_type_double)
		ensure is_real: is_real
		end

	turn_to_string is
			-- Reset Current and make it a string value
		do
			g_value_unset (handle)
			handle := g_value_init (handle, g_type_string)
		ensure is_string: is_string
		end
 
feature
	struct_size: INTEGER is
		external "C inline use <glib-object.h>"
		alias "sizeof(GValue)"
		end

feature 	{NONE} -- Disposing
	dispose is
		do
			g_value_unset (handle)
			g_free (handle)
			handle := default_pointer
		end
	
invariant handle_not_null: is_not_null

end
