-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEMODULE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypemodule_struct_set_use_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for use_count field of GTYPEMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_set_use_count"
		}"
		end

	gtypemodule_struct_set_type_infos (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type_infos field of GTYPEMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_set_type_infos"
		}"
		end

	gtypemodule_struct_set_interface_infos (a_structure: POINTER; a_value: POINTER) is
			-- Setter for interface_infos field of GTYPEMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_set_interface_infos"
		}"
		end

	gtypemodule_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GTYPEMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_set_name"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtypemodule_struct_get_use_count (a_structure: POINTER): NATURAL_32 is
			-- Query for use_count field of GTYPEMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_get_use_count"
		}"
		end

	gtypemodule_struct_get_type_infos (a_structure: POINTER): POINTER is
			-- Query for type_infos field of GTYPEMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_get_type_infos"
		}"
		end

	gtypemodule_struct_get_interface_infos (a_structure: POINTER): POINTER is
			-- Query for interface_infos field of GTYPEMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_get_interface_infos"
		}"
		end

	gtypemodule_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GTYPEMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypemodule_struct_get_name"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeModule"
		}"
		end

end -- class GTYPEMODULE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

