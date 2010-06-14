-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCLOSURE_NOTIFY_DATA_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gclosure_notify_data_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosure_notify_data_struct_set_data"
		}"
		end

	gclosure_notify_data_struct_set_notify (a_structure: POINTER; a_value: POINTER) is
			-- Setter for notify field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosure_notify_data_struct_set_notify"
		}"
		end

feature {} -- Low-level queries

	gclosure_notify_data_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosure_notify_data_struct_get_data"
		}"
		end

	gclosure_notify_data_struct_get_notify (a_structure: POINTER): POINTER is
			-- Query for notify field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gclosure_notify_data_struct_get_notify"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GClosureNotifyData"
		}"
		end

end -- class GCLOSURE_NOTIFY_DATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

