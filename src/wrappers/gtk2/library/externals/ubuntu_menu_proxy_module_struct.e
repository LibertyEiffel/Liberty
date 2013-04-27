-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTU_MENU_PROXY_MODULE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	ubuntu_menu_proxy_module_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_set_priv"
		}"
		end

	ubuntu_menu_proxy_module_struct_set_library (a_structure: POINTER; a_value: POINTER) is
			-- Setter for library field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_set_library"
		}"
		end

	ubuntu_menu_proxy_module_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_set_name"
		}"
		end

	ubuntu_menu_proxy_module_struct_set_load (a_structure: POINTER; a_value: POINTER) is
			-- Setter for load field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_set_load"
		}"
		end

	ubuntu_menu_proxy_module_struct_set_unload (a_structure: POINTER; a_value: POINTER) is
			-- Setter for unload field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_set_unload"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	ubuntu_menu_proxy_module_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_get_priv"
		}"
		end

	ubuntu_menu_proxy_module_struct_get_library (a_structure: POINTER): POINTER is
			-- Query for library field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_get_library"
		}"
		end

	ubuntu_menu_proxy_module_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_get_name"
		}"
		end

	ubuntu_menu_proxy_module_struct_get_load (a_structure: POINTER): POINTER is
			-- Query for load field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_get_load"
		}"
		end

	ubuntu_menu_proxy_module_struct_get_unload (a_structure: POINTER): POINTER is
			-- Query for unload field of UBUNTU_MENU_PROXY_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_struct_get_unload"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__UbuntuMenuProxyModule"
		}"
		end

end -- class UBUNTU_MENU_PROXY_MODULE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

