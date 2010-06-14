-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_PIXMAP_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_pixmap_struct_set_pixmap (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixmap field of GTK_PIXMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_set_pixmap"
		}"
		end

	gtk_pixmap_struct_set_mask (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mask field of GTK_PIXMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_set_mask"
		}"
		end

	gtk_pixmap_struct_set_pixmap_insensitive (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pixmap_insensitive field of GTK_PIXMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_set_pixmap_insensitive"
		}"
		end

	gtk_pixmap_struct_set_build_insensitive (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for build_insensitive field of GTK_PIXMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_set_build_insensitive"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field misc.
	gtk_pixmap_struct_get_pixmap (a_structure: POINTER): POINTER is
			-- Query for pixmap field of GTK_PIXMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_get_pixmap"
		}"
		end

	gtk_pixmap_struct_get_mask (a_structure: POINTER): POINTER is
			-- Query for mask field of GTK_PIXMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_get_mask"
		}"
		end

	gtk_pixmap_struct_get_pixmap_insensitive (a_structure: POINTER): POINTER is
			-- Query for pixmap_insensitive field of GTK_PIXMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_get_pixmap_insensitive"
		}"
		end

	gtk_pixmap_struct_get_build_insensitive (a_structure: POINTER): NATURAL_32 is
			-- Query for build_insensitive field of GTK_PIXMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_pixmap_struct_get_build_insensitive"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPixmap"
		}"
		end

end -- class GTK_PIXMAP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

