-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKREQUISITION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrequisition_struct_set_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for width field of GTKREQUISITION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrequisition_struct_set_width"
		}"
		end

	gtkrequisition_struct_set_height (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for height field of GTKREQUISITION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrequisition_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	gtkrequisition_struct_get_width (a_structure: POINTER): INTEGER_32 is
			-- Query for width field of GTKREQUISITION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrequisition_struct_get_width"
		}"
		end

	gtkrequisition_struct_get_height (a_structure: POINTER): INTEGER_32 is
			-- Query for height field of GTKREQUISITION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrequisition_struct_get_height"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRequisition"
		}"
		end

end -- class GTKREQUISITION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

