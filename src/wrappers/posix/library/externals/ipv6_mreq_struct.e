-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IPV6_MREQ_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

	ipv6_mreq_struct_set_ipv6mr_interface (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ipv6mr_interface field of IPV6_MREQ_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ipv6_mreq_struct_set_ipv6mr_interface"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field ipv6mr_multiaddr.
	ipv6_mreq_struct_get_ipv6mr_interface (a_structure: POINTER): NATURAL_32 is
			-- Query for ipv6mr_interface field of IPV6_MREQ_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ipv6_mreq_struct_get_ipv6mr_interface"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ipv6_mreq"
		}"
		end

end -- class IPV6_MREQ_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

