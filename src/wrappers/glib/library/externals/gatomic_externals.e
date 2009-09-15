-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GATOMIC_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_atomic_int_add (an_atomic: POINTER; a_val: INTEGER_32) is
 		-- g_atomic_int_add
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_int_add"
		}"
		end

	g_atomic_int_exchange_and_add (an_atomic: POINTER; a_val: INTEGER_32): INTEGER_32 is
 		-- g_atomic_int_exchange_and_add
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_int_exchange_and_add"
		}"
		end

	g_atomic_pointer_compare_and_exchange (an_atomic: POINTER; an_oldval: POINTER; a_newval: POINTER): INTEGER_32 is
 		-- g_atomic_pointer_compare_and_exchange
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_pointer_compare_and_exchange"
		}"
		end

	g_atomic_pointer_get (an_atomic: POINTER): POINTER is
 		-- g_atomic_pointer_get
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_pointer_get"
		}"
		end

	g_atomic_int_set (an_atomic: POINTER; a_newval: INTEGER_32) is
 		-- g_atomic_int_set
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_int_set"
		}"
		end

	g_atomic_int_compare_and_exchange (an_atomic: POINTER; an_oldval: INTEGER_32; a_newval: INTEGER_32): INTEGER_32 is
 		-- g_atomic_int_compare_and_exchange
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_int_compare_and_exchange"
		}"
		end

	g_atomic_int_get (an_atomic: POINTER): INTEGER_32 is
 		-- g_atomic_int_get
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_int_get"
		}"
		end

	g_atomic_pointer_set (an_atomic: POINTER; a_newval: POINTER) is
 		-- g_atomic_pointer_set
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_atomic_pointer_set"
		}"
		end

end
