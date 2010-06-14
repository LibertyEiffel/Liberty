-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTYPEUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_type_enum_find_value (an_enum_type: NATURAL_32; a_value_name: POINTER): POINTER is
 		-- gtk_type_enum_find_value (node at line 2715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_enum_find_value"
		}"
		end

	gtk_type_unique (a_parent_type: NATURAL_32; a_gtkinfo: POINTER): NATURAL_32 is
 		-- gtk_type_unique (node at line 4100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_unique"
		}"
		end

	gtk_type_enum_get_values (an_enum_type: NATURAL_32): POINTER is
 		-- gtk_type_enum_get_values (node at line 7029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_enum_get_values"
		}"
		end

	gtk_type_new (a_type: NATURAL_32): POINTER is
 		-- gtk_type_new (node at line 12484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_new"
		}"
		end

	gtk_identifier_get_type: NATURAL_32 is
 		-- gtk_identifier_get_type (node at line 20534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_identifier_get_type()"
		}"
		end

	gtk_type_flags_find_value (a_flags_type: NATURAL_32; a_value_name: POINTER): POINTER is
 		-- gtk_type_flags_find_value (node at line 25361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_flags_find_value"
		}"
		end

	gtk_type_class (a_type: NATURAL_32): POINTER is
 		-- gtk_type_class (node at line 25562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_class"
		}"
		end

	gtk_type_flags_get_values (a_flags_type: NATURAL_32): POINTER is
 		-- gtk_type_flags_get_values (node at line 32868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_flags_get_values"
		}"
		end

	gtk_type_init (a_debug_flags: INTEGER) is
 		-- gtk_type_init (node at line 36259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_type_init"
		}"
		end


end -- class GTKTYPEUTILS_EXTERNALS
