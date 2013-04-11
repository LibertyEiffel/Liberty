-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKASPECTFRAME_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkaspectframe_struct_set_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xalign field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_set_xalign"
		}"
		end

	gtkaspectframe_struct_set_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yalign field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_set_yalign"
		}"
		end

	gtkaspectframe_struct_set_ratio (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for ratio field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_set_ratio"
		}"
		end

	gtkaspectframe_struct_set_obey_child (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for obey_child field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_set_obey_child"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field frame.
	gtkaspectframe_struct_get_xalign (a_structure: POINTER): REAL_32 is
			-- Query for xalign field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_get_xalign"
		}"
		end

	gtkaspectframe_struct_get_yalign (a_structure: POINTER): REAL_32 is
			-- Query for yalign field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_get_yalign"
		}"
		end

	gtkaspectframe_struct_get_ratio (a_structure: POINTER): REAL_32 is
			-- Query for ratio field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_get_ratio"
		}"
		end

	gtkaspectframe_struct_get_obey_child (a_structure: POINTER): INTEGER_32 is
			-- Query for obey_child field of GTKASPECTFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaspectframe_struct_get_obey_child"
		}"
		end

	-- Unwrappable field center_allocation.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAspectFrame"
		}"
		end

end -- class GTKASPECTFRAME_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

