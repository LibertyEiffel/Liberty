-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GINTERFACE_INFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	ginterface_info_struct_set_interface_init (a_structure: POINTER; a_value: POINTER) is
			-- Setter for interface_init field of GINTERFACE_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginterface_info_struct_set_interface_init"
		}"
		end

	ginterface_info_struct_set_interface_finalize (a_structure: POINTER; a_value: POINTER) is
			-- Setter for interface_finalize field of GINTERFACE_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginterface_info_struct_set_interface_finalize"
		}"
		end

	ginterface_info_struct_set_interface_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for interface_data field of GINTERFACE_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginterface_info_struct_set_interface_data"
		}"
		end

feature {} -- Low-level queries

	ginterface_info_struct_get_interface_init (a_structure: POINTER): POINTER is
			-- Query for interface_init field of GINTERFACE_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginterface_info_struct_get_interface_init"
		}"
		end

	ginterface_info_struct_get_interface_finalize (a_structure: POINTER): POINTER is
			-- Query for interface_finalize field of GINTERFACE_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginterface_info_struct_get_interface_finalize"
		}"
		end

	ginterface_info_struct_get_interface_data (a_structure: POINTER): POINTER is
			-- Query for interface_data field of GINTERFACE_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginterface_info_struct_get_interface_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GInterfaceInfo"
		}"
		end

end -- class GINTERFACE_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

