-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFIEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

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
 		-- ffi_java_ptrarray_to_raw (node at line 195)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_ptrarray_to_raw"
		}"
		end

	ffi_ptrarray_to_raw (a_cif: POINTER; an_args: POINTER; a_raw: POINTER) is
 		-- ffi_ptrarray_to_raw (node at line 223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_ptrarray_to_raw"
		}"
		end

	ffi_prep_java_raw_closure_loc (an_argument_l278_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER; a_codeloc: POINTER): INTEGER is
 		-- ffi_prep_java_raw_closure_loc (node at line 277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_java_raw_closure_loc"
		}"
		end

	ffi_prep_cif (a_cif: POINTER; an_abi: INTEGER; a_nargs: NATURAL_32; a_rtype: POINTER; an_atypes: POINTER): INTEGER is
 		-- ffi_prep_cif (node at line 292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_cif"
		}"
		end

	ffi_closure_free (an_argument_l300_c7: POINTER) is
 		-- ffi_closure_free (node at line 299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_closure_free"
		}"
		end

	ffi_prep_java_raw_closure (an_argument_l305_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER): INTEGER is
 		-- ffi_prep_java_raw_closure (node at line 304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_java_raw_closure"
		}"
		end

	ffi_prep_raw_closure_loc (an_argument_l343_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER; a_codeloc: POINTER): INTEGER is
 		-- ffi_prep_raw_closure_loc (node at line 342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_raw_closure_loc"
		}"
		end

	ffi_raw_to_ptrarray (a_cif: POINTER; a_raw: POINTER; an_args: POINTER) is
 		-- ffi_raw_to_ptrarray (node at line 385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_to_ptrarray"
		}"
		end

	ffi_raw_size (a_cif: POINTER): NATURAL_32 is
 		-- ffi_raw_size (node at line 394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_size"
		}"
		end

	ffi_raw_call (a_cif: POINTER; a_fn: POINTER; a_rvalue: POINTER; an_avalue: POINTER) is
 		-- ffi_raw_call (node at line 409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_raw_call"
		}"
		end

	ffi_java_raw_size (a_cif: POINTER): NATURAL_32 is
 		-- ffi_java_raw_size (node at line 415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_raw_size"
		}"
		end

	ffi_java_raw_call (a_cif: POINTER; a_fn: POINTER; a_rvalue: POINTER; an_avalue: POINTER) is
 		-- ffi_java_raw_call (node at line 418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_java_raw_call"
		}"
		end

	ffi_call (a_cif: POINTER; a_fn: POINTER; a_rvalue: POINTER; an_avalue: POINTER) is
 		-- ffi_call (node at line 429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_call"
		}"
		end

	ffi_prep_raw_closure (an_argument_l460_c7: POINTER; a_cif: POINTER; a_fun: POINTER; an_user_data: POINTER): INTEGER is
 		-- ffi_prep_raw_closure (node at line 459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_raw_closure"
		}"
		end

	ffi_prep_closure_loc (an_argument_l491_c7: POINTER; an_argument_l492_c7: POINTER; a_fun: POINTER; an_user_data: POINTER; a_codeloc: POINTER): INTEGER is
 		-- ffi_prep_closure_loc (node at line 490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_closure_loc"
		}"
		end

	ffi_prep_closure (an_argument_l498_c7: POINTER; an_argument_l499_c7: POINTER; a_fun: POINTER; an_user_data: POINTER): INTEGER is
 		-- ffi_prep_closure (node at line 497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_prep_closure"
		}"
		end

	ffi_closure_alloc (a_size: NATURAL_32; a_code: POINTER): POINTER is
 		-- ffi_closure_alloc (node at line 539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_closure_alloc"
		}"
		end


end -- class FFIEXTERNALS
