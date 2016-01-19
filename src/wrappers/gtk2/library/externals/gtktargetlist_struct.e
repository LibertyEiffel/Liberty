-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTARGETLIST_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktargetlist_struct_set_list (a_structure: POINTER; a_value: POINTER) is
			-- Setter for list field of GTKTARGETLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktargetlist_struct_set_list"
		}"
		end

	gtktargetlist_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ref_count field of GTKTARGETLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktargetlist_struct_set_ref_count"
		}"
		end

feature {} -- Low-level queries

	gtktargetlist_struct_get_list (a_structure: POINTER): POINTER is
			-- Query for list field of GTKTARGETLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktargetlist_struct_get_list"
		}"
		end

	gtktargetlist_struct_get_ref_count (a_structure: POINTER): NATURAL_32 is
			-- Query for ref_count field of GTKTARGETLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktargetlist_struct_get_ref_count"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTargetList"
		}"
		end

end -- class GTKTARGETLIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

