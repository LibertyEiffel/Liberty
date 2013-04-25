-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIONGROUPCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkactiongroupclass_struct_set_get_action (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_action field of GTKACTIONGROUPCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactiongroupclass_struct_set_get_action"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkactiongroupclass_struct_get_get_action (a_structure: POINTER): POINTER is
			-- Query for get_action field of GTKACTIONGROUPCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactiongroupclass_struct_get_get_action"
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
			feature_name: "sizeof__GtkActionGroupClass"
		}"
		end

end -- class GTKACTIONGROUPCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

