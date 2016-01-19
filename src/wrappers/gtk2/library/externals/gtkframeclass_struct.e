-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFRAMECLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkframeclass_struct_set_compute_child_allocation (a_structure: POINTER; a_value: POINTER) is
			-- Setter for compute_child_allocation field of GTKFRAMECLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframeclass_struct_set_compute_child_allocation"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkframeclass_struct_get_compute_child_allocation (a_structure: POINTER): POINTER is
			-- Query for compute_child_allocation field of GTKFRAMECLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframeclass_struct_get_compute_child_allocation"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFrameClass"
		}"
		end

end -- class GTKFRAMECLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

