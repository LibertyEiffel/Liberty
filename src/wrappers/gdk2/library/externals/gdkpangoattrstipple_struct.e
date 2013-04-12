-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKPANGOATTRSTIPPLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkpangoattrstipple_struct_set_stipple (a_structure: POINTER; a_value: POINTER) is
			-- Setter for stipple field of GDKPANGOATTRSTIPPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpangoattrstipple_struct_set_stipple"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	gdkpangoattrstipple_struct_get_stipple (a_structure: POINTER): POINTER is
			-- Query for stipple field of GDKPANGOATTRSTIPPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkpangoattrstipple_struct_get_stipple"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkPangoAttrStipple"
		}"
		end

end -- class GDKPANGOATTRSTIPPLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

