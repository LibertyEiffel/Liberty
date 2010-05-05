-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GREL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_relation_delete (a_relation: POINTER; a_key: POINTER; a_field: INTEGER_32): INTEGER_32 is
 		-- g_relation_delete (node at line 1458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_delete"
		}"
		end

	g_relation_count (a_relation: POINTER; a_key: POINTER; a_field: INTEGER_32): INTEGER_32 is
 		-- g_relation_count (node at line 2966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_count"
		}"
		end

	g_tuples_index (a_tuples: POINTER; an_index: INTEGER_32; a_field: INTEGER_32): POINTER is
 		-- g_tuples_index (node at line 3320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tuples_index"
		}"
		end

	g_relation_new (a_fields: INTEGER_32): POINTER is
 		-- g_relation_new (node at line 4155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_new"
		}"
		end

	g_relation_select (a_relation: POINTER; a_key: POINTER; a_field: INTEGER_32): POINTER is
 		-- g_relation_select (node at line 4201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_select"
		}"
		end

	-- function g_relation_insert (at line 76 in file /usr/include/glib-2.0/glib/grel.h is not wrappable
	-- function g_relation_exists (at line 87 in file /usr/include/glib-2.0/glib/grel.h is not wrappable
	g_relation_destroy (a_relation: POINTER) is
 		-- g_relation_destroy (node at line 5150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_destroy"
		}"
		end

	g_relation_print (a_relation: POINTER) is
 		-- g_relation_print (node at line 6138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_print"
		}"
		end

	g_tuples_destroy (a_tuples: POINTER) is
 		-- g_tuples_destroy (node at line 6425)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_tuples_destroy"
		}"
		end

	g_relation_index (a_relation: POINTER; a_field: INTEGER_32; a_hash_func: POINTER; a_key_equal_func: POINTER) is
 		-- g_relation_index (node at line 6603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_relation_index"
		}"
		end


end -- class GREL_EXTERNALS
