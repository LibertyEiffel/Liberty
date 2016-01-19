-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_REQUISITION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_requisition_struct_set_width (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for width field of GTK_REQUISITION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_struct_set_width"
		}"
		end

	gtk_requisition_struct_set_height (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for height field of GTK_REQUISITION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_struct_set_height"
		}"
		end

feature {} -- Low-level queries

	gtk_requisition_struct_get_width (a_structure: POINTER): INTEGER is
			-- Query for width field of GTK_REQUISITION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_struct_get_width"
		}"
		end

	gtk_requisition_struct_get_height (a_structure: POINTER): INTEGER is
			-- Query for height field of GTK_REQUISITION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_requisition_struct_get_height"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRequisition"
		}"
		end

end -- class GTK_REQUISITION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

