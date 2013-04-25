-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVIEWPORTCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkviewportclass_struct_set_set_scroll_adjustments (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_scroll_adjustments field of GTKVIEWPORTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkviewportclass_struct_set_set_scroll_adjustments"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkviewportclass_struct_get_set_scroll_adjustments (a_structure: POINTER): POINTER is
			-- Query for set_scroll_adjustments field of GTKVIEWPORTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkviewportclass_struct_get_set_scroll_adjustments"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkViewportClass"
		}"
		end

end -- class GTKVIEWPORTCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

