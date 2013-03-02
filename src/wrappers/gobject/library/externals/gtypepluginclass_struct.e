-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEPLUGINCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypepluginclass_struct_set_use_plugin (a_structure: POINTER; a_value: POINTER) is
			-- Setter for use_plugin field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_set_use_plugin"
		}"
		end

	gtypepluginclass_struct_set_unuse_plugin (a_structure: POINTER; a_value: POINTER) is
			-- Setter for unuse_plugin field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_set_unuse_plugin"
		}"
		end

	gtypepluginclass_struct_set_complete_type_info (a_structure: POINTER; a_value: POINTER) is
			-- Setter for complete_type_info field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_set_complete_type_info"
		}"
		end

	gtypepluginclass_struct_set_complete_interface_info (a_structure: POINTER; a_value: POINTER) is
			-- Setter for complete_interface_info field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_set_complete_interface_info"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field base_iface.
	gtypepluginclass_struct_get_use_plugin (a_structure: POINTER): POINTER is
			-- Query for use_plugin field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_get_use_plugin"
		}"
		end

	gtypepluginclass_struct_get_unuse_plugin (a_structure: POINTER): POINTER is
			-- Query for unuse_plugin field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_get_unuse_plugin"
		}"
		end

	gtypepluginclass_struct_get_complete_type_info (a_structure: POINTER): POINTER is
			-- Query for complete_type_info field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_get_complete_type_info"
		}"
		end

	gtypepluginclass_struct_get_complete_interface_info (a_structure: POINTER): POINTER is
			-- Query for complete_interface_info field of GTYPEPLUGINCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypepluginclass_struct_get_complete_interface_info"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypePluginClass"
		}"
		end

end -- class GTYPEPLUGINCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

