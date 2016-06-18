deferred class FFI_MORE_EXTERNALS

insert
    FFI_EXTERNALS

feature {} -- Implementation
   default_abi: INTEGER_32
         -- The enumeration value representing the default ABI. To be removed whenever support for different ABIs will be provided.
      external "plug_in"
      alias "{
         location: "generated"
         module_name: "plugin"
         feature_name: "FFI_DEFAULT_ABI"
         }"
      end

feature {}


	ffi_type_void: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_void"
		}"
		end

	ffi_type_sint8: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_sint8"
		}"
		end

	ffi_type_uint64: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_uint64"
		}"
		end

	ffi_type_uint8: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_uint8"
		}"
		end

	ffi_type_pointer: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_pointer"
		}"
		end

	ffi_type_sint16: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_sint16"
		}"
		end

	ffi_type_sint32: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_sint32"
		}"
		end

	ffi_type_sint64: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_sint64"
		}"
		end

	ffi_type_float: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_float"
		}"
		end

	ffi_type_uint16: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_uint16"
		}"
		end

	ffi_type_uint32: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_uint32"
		}"
		end

	ffi_type_longdouble: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_longdouble"
		}"
		end

	ffi_type_double: POINTER
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "&ffi_type_double"
		}"
		end

end -- class FFI_MORE_EXTERNALS
