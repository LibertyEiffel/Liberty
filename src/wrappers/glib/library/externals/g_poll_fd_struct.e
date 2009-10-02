-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_POLL_FD_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gpollfd_struct_set_fd (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for fd field of GPollFD structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gpollfd_struct_set_fd"
		}"
		end

	gpollfd_struct_set_events (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for events field of GPollFD structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gpollfd_struct_set_events"
		}"
		end

	gpollfd_struct_set_revents (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for revents field of GPollFD structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gpollfd_struct_set_revents"
		}"
		end

feature {} -- Low-level queries

	gpollfd_struct_get_fd (a_structure: POINTER): INTEGER_32 is
			-- Query for fd field of GPollFD structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gpollfd_struct_get_fd"
		}"
		end

	gpollfd_struct_get_events (a_structure: POINTER): NATURAL_16 is
			-- Query for events field of GPollFD structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gpollfd_struct_get_events"
		}"
		end

	gpollfd_struct_get_revents (a_structure: POINTER): NATURAL_16 is
			-- Query for revents field of GPollFD structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gpollfd_struct_get_revents"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GPollFD"
		}"
		end

end
