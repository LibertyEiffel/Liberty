-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPOLLFD_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gpollfd_struct_set_fd (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for fd field of GPOLLFD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gpollfd_struct_set_fd"
		}"
		end

	gpollfd_struct_set_events (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for events field of GPOLLFD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gpollfd_struct_set_events"
		}"
		end

	gpollfd_struct_set_revents (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for revents field of GPOLLFD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gpollfd_struct_set_revents"
		}"
		end

feature {} -- Low-level queries

	gpollfd_struct_get_fd (a_structure: POINTER): INTEGER_32 is
			-- Query for fd field of GPOLLFD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gpollfd_struct_get_fd"
		}"
		end

	gpollfd_struct_get_events (a_structure: POINTER): NATURAL_16 is
			-- Query for events field of GPOLLFD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gpollfd_struct_get_events"
		}"
		end

	gpollfd_struct_get_revents (a_structure: POINTER): NATURAL_16 is
			-- Query for revents field of GPOLLFD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gpollfd_struct_get_revents"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GPollFD"
		}"
		end

end -- class GPOLLFD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

