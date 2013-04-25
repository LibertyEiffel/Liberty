-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTUMENUPROXYMODULE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	ubuntumenuproxymodule_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_set_priv"
		}"
		end

	ubuntumenuproxymodule_struct_set_library (a_structure: POINTER; a_value: POINTER) is
			-- Setter for library field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_set_library"
		}"
		end

	ubuntumenuproxymodule_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_set_name"
		}"
		end

	ubuntumenuproxymodule_struct_set_load (a_structure: POINTER; a_value: POINTER) is
			-- Setter for load field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_set_load"
		}"
		end

	ubuntumenuproxymodule_struct_set_unload (a_structure: POINTER; a_value: POINTER) is
			-- Setter for unload field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_set_unload"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	ubuntumenuproxymodule_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_get_priv"
		}"
		end

	ubuntumenuproxymodule_struct_get_library (a_structure: POINTER): POINTER is
			-- Query for library field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_get_library"
		}"
		end

	ubuntumenuproxymodule_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_get_name"
		}"
		end

	ubuntumenuproxymodule_struct_get_load (a_structure: POINTER): POINTER is
			-- Query for load field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_get_load"
		}"
		end

	ubuntumenuproxymodule_struct_get_unload (a_structure: POINTER): POINTER is
			-- Query for unload field of UBUNTUMENUPROXYMODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxymodule_struct_get_unload"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__UbuntuMenuProxyModule"
		}"
		end

end -- class UBUNTUMENUPROXYMODULE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

