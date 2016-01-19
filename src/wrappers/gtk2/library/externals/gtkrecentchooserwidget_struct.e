-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSERWIDGET_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrecentchooserwidget_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTKRECENTCHOOSERWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentchooserwidget_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkrecentchooserwidget_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTKRECENTCHOOSERWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentchooserwidget_struct_get_priv"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentChooserWidget"
		}"
		end

end -- class GTKRECENTCHOOSERWIDGET_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

