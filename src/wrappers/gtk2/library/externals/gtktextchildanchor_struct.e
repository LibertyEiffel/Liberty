-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTCHILDANCHOR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktextchildanchor_struct_set_segment (a_structure: POINTER; a_value: POINTER) is
			-- Setter for segment field of GTKTEXTCHILDANCHOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktextchildanchor_struct_set_segment"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtktextchildanchor_struct_get_segment (a_structure: POINTER): POINTER is
			-- Query for segment field of GTKTEXTCHILDANCHOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktextchildanchor_struct_get_segment"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTextChildAnchor"
		}"
		end

end -- class GTKTEXTCHILDANCHOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

