-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GATOMIC_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_atomic_int_add (an_atomic: POINTER; a_val: INTEGER_32): INTEGER_32 is
 		-- g_atomic_int_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_add"
		}"
		end

	g_atomic_int_and (an_atomic: POINTER; a_val: NATURAL_32): NATURAL_32 is
 		-- g_atomic_int_and
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_and"
		}"
		end

	g_atomic_int_compare_and_exchange (an_atomic: POINTER; an_oldval: INTEGER_32; a_newval: INTEGER_32): INTEGER_32 is
 		-- g_atomic_int_compare_and_exchange
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_compare_and_exchange"
		}"
		end

	g_atomic_int_dec_and_test (an_atomic: POINTER): INTEGER_32 is
 		-- g_atomic_int_dec_and_test
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_dec_and_test"
		}"
		end

	g_atomic_int_exchange_and_add (an_atomic: POINTER; a_val: INTEGER_32): INTEGER_32 is
 		-- g_atomic_int_exchange_and_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_exchange_and_add"
		}"
		end

	g_atomic_int_get (an_atomic: POINTER): INTEGER_32 is
 		-- g_atomic_int_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_get"
		}"
		end

	g_atomic_int_inc (an_atomic: POINTER) is
 		-- g_atomic_int_inc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_inc"
		}"
		end

	g_atomic_int_or (an_atomic: POINTER; a_val: NATURAL_32): NATURAL_32 is
 		-- g_atomic_int_or
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_or"
		}"
		end

	g_atomic_int_set (an_atomic: POINTER; a_newval: INTEGER_32) is
 		-- g_atomic_int_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_set"
		}"
		end

	g_atomic_int_xor (an_atomic: POINTER; a_val: NATURAL_32): NATURAL_32 is
 		-- g_atomic_int_xor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_int_xor"
		}"
		end

	g_atomic_pointer_add (an_atomic: POINTER; a_val: INTEGER_64): INTEGER_64 is
 		-- g_atomic_pointer_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_add"
		}"
		end

	g_atomic_pointer_and (an_atomic: POINTER; a_val: NATURAL_64): NATURAL_64 is
 		-- g_atomic_pointer_and
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_and"
		}"
		end

	g_atomic_pointer_compare_and_exchange (an_atomic: POINTER; an_oldval: POINTER; a_newval: POINTER): INTEGER_32 is
 		-- g_atomic_pointer_compare_and_exchange
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_compare_and_exchange"
		}"
		end

	g_atomic_pointer_get (an_atomic: POINTER): POINTER is
 		-- g_atomic_pointer_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_get"
		}"
		end

	g_atomic_pointer_or (an_atomic: POINTER; a_val: NATURAL_64): NATURAL_64 is
 		-- g_atomic_pointer_or
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_or"
		}"
		end

	g_atomic_pointer_set (an_atomic: POINTER; a_newval: POINTER) is
 		-- g_atomic_pointer_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_set"
		}"
		end

	g_atomic_pointer_xor (an_atomic: POINTER; a_val: NATURAL_64): NATURAL_64 is
 		-- g_atomic_pointer_xor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_atomic_pointer_xor"
		}"
		end


end -- class GATOMIC_EXTERNALS
