deferred class FFI_TYPES
	-- Pointers to the descriptors of built-in types that can be used to describe the argi,ets of a call made with Foreign Function Interface library. Use them as arguments and return type of a FFI_CALL

insert 
	ANY 
		undefine
			copy,
			default_create,
			is_equal
		end
feature {ANY}
	is_valid_type (a_type: POINTER): BOOLEAN is
		-- Does `a_type' represent a known type?
	do
	Result := ((a_type = ffi_type_void) or else
			(a_type = ffi_type_uint8) or else
			(a_type = ffi_type_sint8) or else
			(a_type = ffi_type_uint16) or else
			(a_type = ffi_type_sint16) or else
			(a_type = ffi_type_uint32) or else
			(a_type = ffi_type_sint32) or else
			(a_type = ffi_type_uint64) or else
			(a_type = ffi_type_sint64) or else
			(a_type = ffi_type_float) or else
			(a_type = ffi_type_double) or else
			(a_type = ffi_type_uchar) or else
			(a_type = ffi_type_schar) or else
			(a_type = ffi_type_ushort) or else
			(a_type = ffi_type_sshort) or else
			(a_type = ffi_type_uint) or else
			(a_type = ffi_type_sint) or else
			(a_type = ffi_type_ulong) or else
			(a_type = ffi_type_slong) or else
			(a_type = ffi_type_longdouble) or else
			(a_type = ffi_type_pointer))
	end

feature {ANY} -- Primitive types

   ffi_type_void: POINTER is
	-- The type void. This cannot be used for argument types, only for return values.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_void"
	}"
	end

   ffi_type_uint8: POINTER is
	-- An unsigned, 8-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_uint8"
	}"
	end

   ffi_type_sint8: POINTER is
	-- A signed, 8-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_sint8"
	}"
	end

   ffi_type_uint16: POINTER is
	-- An unsigned, 16-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_uint16"
	}"
	end

   ffi_type_sint16: POINTER is
	-- A signed, 16-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_sint16"
	}"
	end

   ffi_type_uint32: POINTER is
	-- An unsigned, 32-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_uint32"
	}"
	end

   ffi_type_sint32: POINTER is
	-- A signed, 32-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_sint32"
	}"
	end

   ffi_type_uint64: POINTER is
	-- An unsigned, 64-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_uint64"
	}"
	end

   ffi_type_sint64: POINTER is
	-- A signed, 64-bit integer type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_sint64"
	}"
	end

   ffi_type_float: POINTER is
	-- The C float type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_float"
	}"
	end

   ffi_type_double: POINTER is
	-- The C double type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_double"
	}"
	end

   ffi_type_uchar: POINTER is
	-- The C unsigned char type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_uchar"
	}"
	end

   ffi_type_schar: POINTER is -- The C signed char type. (Note that there is not an exact equivalent to the C char type in libffi; ordinarily you should either use ffi_type_schar or ffi_type_uchar depending on whether char is signed.)
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_schar"
	}"
	end

   ffi_type_ushort: POINTER is
	-- The C unsigned short type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_ushort"
	}"
	end

   ffi_type_sshort: POINTER is
	-- The C short type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_sshort"
	}"
	end

   ffi_type_uint: POINTER is
	-- The C unsigned int type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_uint"
	}"
	end

   ffi_type_sint: POINTER is
	-- The C int type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_sint"
	}"
	end

   ffi_type_ulong: POINTER is
	-- The C unsigned long type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_ulong"
	}"
	end

   ffi_type_slong: POINTER is
	-- The C long type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_slong"
	}"
	end

   ffi_type_longdouble: POINTER is
	-- On platforms that have a C long double type, this is defined. On other platforms, it is not.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_longdouble"
	}"
	end

   ffi_type_pointer: POINTER is
	-- A generic void * pointer. You should use this for all pointers, regardless of their real type.
	external "plug_in"
	alias "{
		location: "."
		module_name: "plugin"
		feature_name: "eiffel_ffi_type_pointer"
	}"
	end

   -- Each of these is of type ffi_type, so you must take the address when passing to ffi_prep_cif.

  -- Alhough `libffi' has no special support for unions or bit-fields, it is perfectly happy
  --  passing structures back and forth. You must first describe the structure to `libffi' by
  --  creating a new ffi_type object for it.

  --  - ffi_type:

  --    The ffi_type has the following members:

  --    size_t size
  --            This is set by libffi; you should initialize it to zero.

  --    unsigned short alignment
  --            This is set by libffi; you should initialize it to zero.

  --    unsigned short type
  --            For a structure, this should be set to FFI_TYPE_STRUCT.

  --    ffi_type **elements
  --            This is a `NULL'-terminated array of pointers to ffi_type objects. There is one
  --            element per field of the struct.

end -- class FFI_TYPES
