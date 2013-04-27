-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKEXPANDERCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkexpanderclass_struct_set_activate (a_structure: POINTER; a_value: POINTER) is
			-- Setter for activate field of GTKEXPANDERCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkexpanderclass_struct_set_activate"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkexpanderclass_struct_get_activate (a_structure: POINTER): POINTER is
			-- Query for activate field of GTKEXPANDERCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkexpanderclass_struct_get_activate"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkExpanderClass"
		}"
		end

end -- class GTKEXPANDERCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

