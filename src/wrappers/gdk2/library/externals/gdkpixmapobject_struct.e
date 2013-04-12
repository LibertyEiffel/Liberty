-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKPIXMAPOBJECT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkpixmapobject_struct_set_impl (a_structure: POINTER; a_value: POINTER) is
			-- Setter for impl field of GDKPIXMAPOBJECT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpixmapobject_struct_set_impl"
		}"
		end

	gdkpixmapobject_struct_set_depth (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for depth field of GDKPIXMAPOBJECT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpixmapobject_struct_set_depth"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkpixmapobject_struct_get_impl (a_structure: POINTER): POINTER is
			-- Query for impl field of GDKPIXMAPOBJECT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpixmapobject_struct_get_impl"
		}"
		end

	gdkpixmapobject_struct_get_depth (a_structure: POINTER): INTEGER_32 is
			-- Query for depth field of GDKPIXMAPOBJECT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpixmapobject_struct_get_depth"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkPixmapObject"
		}"
		end

end -- class GDKPIXMAPOBJECT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

