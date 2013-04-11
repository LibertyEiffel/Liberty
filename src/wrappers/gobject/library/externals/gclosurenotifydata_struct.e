-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCLOSURENOTIFYDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gclosurenotifydata_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GCLOSURENOTIFYDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosurenotifydata_struct_set_data"
		}"
		end

	gclosurenotifydata_struct_set_notify (a_structure: POINTER; a_value: POINTER) is
			-- Setter for notify field of GCLOSURENOTIFYDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosurenotifydata_struct_set_notify"
		}"
		end

feature {} -- Low-level queries

	gclosurenotifydata_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GCLOSURENOTIFYDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosurenotifydata_struct_get_data"
		}"
		end

	gclosurenotifydata_struct_get_notify (a_structure: POINTER): POINTER is
			-- Query for notify field of GCLOSURENOTIFYDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosurenotifydata_struct_get_notify"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GClosureNotifyData"
		}"
		end

end -- class GCLOSURENOTIFYDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

