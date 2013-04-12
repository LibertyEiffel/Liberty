-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKSCREENCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkscreenclass_struct_set_size_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for size_changed field of GDKSCREENCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreenclass_struct_set_size_changed"
		}"
		end

	gdkscreenclass_struct_set_composited_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for composited_changed field of GDKSCREENCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreenclass_struct_set_composited_changed"
		}"
		end

	gdkscreenclass_struct_set_monitors_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for monitors_changed field of GDKSCREENCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreenclass_struct_set_monitors_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gdkscreenclass_struct_get_size_changed (a_structure: POINTER): POINTER is
			-- Query for size_changed field of GDKSCREENCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreenclass_struct_get_size_changed"
		}"
		end

	gdkscreenclass_struct_get_composited_changed (a_structure: POINTER): POINTER is
			-- Query for composited_changed field of GDKSCREENCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreenclass_struct_get_composited_changed"
		}"
		end

	gdkscreenclass_struct_get_monitors_changed (a_structure: POINTER): POINTER is
			-- Query for monitors_changed field of GDKSCREENCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreenclass_struct_get_monitors_changed"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkScreenClass"
		}"
		end

end -- class GDKSCREENCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

