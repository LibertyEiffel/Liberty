deferred class FFI_MORE_EXTERNALS

insert FFI_EXTERNALS

feature {}
	ffi_type_void: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_void"
		}"
		end

	ffi_type_sint8: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint8"
		}"
		end

	ffi_type_uint64: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint64"
		}"
		end

	ffi_type_uint8: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint8"
		}"
		end

	ffi_type_pointer: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_pointer"
		}"
		end

	ffi_type_sint16: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint16"
		}"
		end

	ffi_type_sint32: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint32"
		}"
		end

	ffi_type_sint64: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint64"
		}"
		end

	ffi_type_float: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_float"
		}"
		end

	ffi_type_uint16: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint16"
		}"
		end

	ffi_type_uint32: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint32"
		}"
		end

	ffi_type_longdouble: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_longdouble"
		}"
		end

	ffi_type_double: POINTER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_double"
		}"
		end

end -- class FFI_MORE_EXTERNALS
