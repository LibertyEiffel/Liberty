-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IFCONF_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

	ifconf_struct_set_ifc_len (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for ifc_len field of IFCONF_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ifconf_struct_set_ifc_len"
		}"
		end

feature {} -- Low-level queries

	ifconf_struct_get_ifc_len (a_structure: POINTER): INTEGER is
			-- Query for ifc_len field of IFCONF_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ifconf_struct_get_ifc_len"
		}"
		end

	-- Unwrappable field ifc_ifcu.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ifconf"
		}"
		end

end -- class IFCONF_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

