-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLAYOUTCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtklayoutclass_struct_set_set_scroll_adjustments (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_scroll_adjustments field of GTKLAYOUTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklayoutclass_struct_set_set_scroll_adjustments"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtklayoutclass_struct_get_set_scroll_adjustments (a_structure: POINTER): POINTER is
			-- Query for set_scroll_adjustments field of GTKLAYOUTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklayoutclass_struct_get_set_scroll_adjustments"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkLayoutClass"
		}"
		end

end -- class GTKLAYOUTCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

