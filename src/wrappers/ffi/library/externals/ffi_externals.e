-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- Variable ffi_type_void (at line 170 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_void: POINTER is
 		-- Address of ffi_type_void (node at line 170)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_void"
		}"
		end

	-- Variable ffi_type_sint16 (at line 174 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_sint16: POINTER is
 		-- Address of ffi_type_sint16 (node at line 174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint16"
		}"
		end

	-- Variable ffi_type_sint8 (at line 172 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_sint8: POINTER is
 		-- Address of ffi_type_sint8 (node at line 172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint8"
		}"
		end

	-- Variable ffi_type_uint64 (at line 177 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_uint64: POINTER is
 		-- Address of ffi_type_uint64 (node at line 177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint64"
		}"
		end

	-- Variable ffi_type_uint8 (at line 171 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_uint8: POINTER is
 		-- Address of ffi_type_uint8 (node at line 171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint8"
		}"
		end

	-- Variable ffi_type_pointer (at line 181 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_pointer: POINTER is
 		-- Address of ffi_type_pointer (node at line 181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_pointer"
		}"
		end

	-- Variable ffi_type_sint32 (at line 176 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_sint32: POINTER is
 		-- Address of ffi_type_sint32 (node at line 176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint32"
		}"
		end

	-- Variable ffi_type_sint64 (at line 178 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_sint64: POINTER is
 		-- Address of ffi_type_sint64 (node at line 178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_sint64"
		}"
		end

	-- Variable ffi_type_float (at line 179 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_float: POINTER is
 		-- Address of ffi_type_float (node at line 179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_float"
		}"
		end

	-- Variable ffi_type_uint16 (at line 173 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_uint16: POINTER is
 		-- Address of ffi_type_uint16 (node at line 173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint16"
		}"
		end

	-- Variable ffi_type_uint32 (at line 175 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_uint32: POINTER is
 		-- Address of ffi_type_uint32 (node at line 175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_uint32"
		}"
		end

	-- Variable ffi_type_longdouble (at line 184 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_longdouble: POINTER is
 		-- Address of ffi_type_longdouble (node at line 184)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_longdouble"
		}"
		end

	-- Variable ffi_type_double (at line 180 in file /usr/include/x86_64-linux-gnu/ffi.h does not have a wrapper type
	address_of_ffi_type_double: POINTER is
 		-- Address of ffi_type_double (node at line 180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&ffi_type_double"
		}"
		end

	ffi_java_raw_to_ptrarray (a_cif: POINTER; a_raw: POINTER; an_args: POINTER) is
 		-- ffi_java_raw_to_ptrarray (node at line 38)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_raw_to_ptrarray"
		}"
		end

	ffi_java_ptrarray_to_raw (a_cif: POINTER; an_args: POINTER; a_raw: POINTER) is
 		-- ffi_java_ptrarray_to_raw (node at line 199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_ptrarray_to_raw"
		}"
		end

	ffi_ptrarray_to_raw (a_cif: POINTER; an_args: POINTER; a_raw: POINTER) is
 		-- ffi_ptrarray_to_raw (node at line 227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_ptrarray_to_raw"
		}"
		end

	ffi_prep_java_raw_closure_loc (an_argument_l282_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER; a_codeloc: POINTER): INTEGER is
 		-- ffi_prep_java_raw_closure_loc (node at line 281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_java_raw_closure_loc"
		}"
		end

	ffi_prep_cif (a_cif: POINTER; an_abi: INTEGER; a_nargs: NATURAL_32; a_rtype: POINTER; an_atypes: POINTER): INTEGER is
 		-- ffi_prep_cif (node at line 299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_cif"
		}"
		end

	ffi_closure_free (an_argument_l307_c7: POINTER) is
 		-- ffi_closure_free (node at line 306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_closure_free"
		}"
		end

	ffi_prep_java_raw_closure (an_argument_l311_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER): INTEGER is
 		-- ffi_prep_java_raw_closure (node at line 310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_java_raw_closure"
		}"
		end

	ffi_prep_raw_closure_loc (an_argument_l349_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER; a_codeloc: POINTER): INTEGER is
 		-- ffi_prep_raw_closure_loc (node at line 348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_raw_closure_loc"
		}"
		end

	ffi_raw_to_ptrarray (a_cif: POINTER; a_raw: POINTER; an_args: POINTER) is
 		-- ffi_raw_to_ptrarray (node at line 390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_to_ptrarray"
		}"
		end

	ffi_raw_size (a_cif: POINTER): NATURAL_64 is
 		-- ffi_raw_size (node at line 399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_size"
		}"
		end

	ffi_raw_call (a_cif: POINTER; a_fn: POINTER; a_rvalue: POINTER; an_avalue: POINTER) is
 		-- ffi_raw_call (node at line 414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_call"
		}"
		end

	ffi_java_raw_size (a_cif: POINTER): NATURAL_64 is
 		-- ffi_java_raw_size (node at line 420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_raw_size"
		}"
		end

	ffi_java_raw_call (a_cif: POINTER; a_fn: POINTER; a_rvalue: POINTER; an_avalue: POINTER) is
 		-- ffi_java_raw_call (node at line 423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_raw_call"
		}"
		end

	ffi_call (a_cif: POINTER; a_fn: POINTER; a_rvalue: POINTER; an_avalue: POINTER) is
 		-- ffi_call (node at line 434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_call"
		}"
		end

	ffi_prep_raw_closure (an_argument_l465_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER): INTEGER is
 		-- ffi_prep_raw_closure (node at line 464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_raw_closure"
		}"
		end

	ffi_prep_closure_loc (an_argument_l499_c7: POINTER; an_argument_l500_c7: POINTER; a_fun: POINTER; an_user_data: POINTER; a_codeloc: POINTER): INTEGER is
 		-- ffi_prep_closure_loc (node at line 498)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_closure_loc"
		}"
		end

	ffi_prep_closure (an_argument_l506_c7: POINTER; an_argument_l507_c7: POINTER; a_fun: POINTER; an_user_data: POINTER): INTEGER is
 		-- ffi_prep_closure (node at line 505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_closure"
		}"
		end

	ffi_prep_cif_var (a_cif: POINTER; an_abi: INTEGER; a_nfixedargs: NATURAL_32; a_ntotalargs: NATURAL_32; a_rtype: POINTER; an_atypes: POINTER): INTEGER is
 		-- ffi_prep_cif_var (node at line 526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_cif_var"
		}"
		end

	ffi_closure_alloc (a_size: NATURAL_64; a_code: POINTER): POINTER is
 		-- ffi_closure_alloc (node at line 555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_closure_alloc"
		}"
		end

	ffi_prep_cif_core (a_cif: POINTER; an_abi: INTEGER; an_isvariadic: NATURAL_32; a_nfixedargs: NATURAL_32; a_ntotalargs: NATURAL_32; a_rtype: POINTER; an_atypes: POINTER): INTEGER is
 		-- ffi_prep_cif_core (node at line 575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_cif_core"
		}"
		end


end -- class FFI_EXTERNALS
