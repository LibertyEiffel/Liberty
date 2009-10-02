-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GREL_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_relation_delete (a_relation: POINTER; a_key: POINTER; a_field: INTEGER_32): INTEGER_32 is
 		-- g_relation_delete
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_delete"
		}"
		end

	g_relation_count (a_relation: POINTER; a_key: POINTER; a_field: INTEGER_32): INTEGER_32 is
 		-- g_relation_count
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_count"
		}"
		end

	g_tuples_index (a_tuples: POINTER; an_index_: INTEGER_32; a_field: INTEGER_32): POINTER is
 		-- g_tuples_index
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_tuples_index"
		}"
		end

	g_relation_new (a_fields: INTEGER_32): POINTER is
 		-- g_relation_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_new"
		}"
		end

	g_relation_select (a_relation: POINTER; a_key: POINTER; a_field: INTEGER_32): POINTER is
 		-- g_relation_select
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_select"
		}"
		end

	g_relation_insert (a_relation: POINTER; ) is
 		-- g_relation_insert			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_insert"
		}"
		end

	g_relation_exists (a_relation: POINTER; ): INTEGER_32 is
 		-- g_relation_exists			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_exists"
		}"
		end

	g_relation_destroy (a_relation: POINTER) is
 		-- g_relation_destroy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_destroy"
		}"
		end

	g_relation_print (a_relation: POINTER) is
 		-- g_relation_print
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_print"
		}"
		end

	g_tuples_destroy (a_tuples: POINTER) is
 		-- g_tuples_destroy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_tuples_destroy"
		}"
		end

	g_relation_index (a_relation: POINTER; a_field: INTEGER_32; a_hash_func: POINTER; a_key_equal_func: POINTER) is
 		-- g_relation_index
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_relation_index"
		}"
		end

end
