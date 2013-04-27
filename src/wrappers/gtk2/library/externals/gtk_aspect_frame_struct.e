-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ASPECT_FRAME_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_aspect_frame_struct_set_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xalign field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_set_xalign"
		}"
		end

	gtk_aspect_frame_struct_set_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yalign field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_set_yalign"
		}"
		end

	gtk_aspect_frame_struct_set_ratio (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for ratio field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_set_ratio"
		}"
		end

	gtk_aspect_frame_struct_set_obey_child (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for obey_child field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_set_obey_child"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field frame.
	gtk_aspect_frame_struct_get_xalign (a_structure: POINTER): REAL_32 is
			-- Query for xalign field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_get_xalign"
		}"
		end

	gtk_aspect_frame_struct_get_yalign (a_structure: POINTER): REAL_32 is
			-- Query for yalign field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_get_yalign"
		}"
		end

	gtk_aspect_frame_struct_get_ratio (a_structure: POINTER): REAL_32 is
			-- Query for ratio field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_get_ratio"
		}"
		end

	gtk_aspect_frame_struct_get_obey_child (a_structure: POINTER): INTEGER is
			-- Query for obey_child field of GTK_ASPECT_FRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_aspect_frame_struct_get_obey_child"
		}"
		end

	-- Unwrappable field center_allocation.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAspectFrame"
		}"
		end

end -- class GTK_ASPECT_FRAME_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

