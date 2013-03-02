-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IP6_MTUINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

	ip6_mtuinfo_struct_set_ip6m_mtu (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ip6m_mtu field of IP6_MTUINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip6_mtuinfo_struct_set_ip6m_mtu"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field ip6m_addr.
	ip6_mtuinfo_struct_get_ip6m_mtu (a_structure: POINTER): NATURAL_32 is
			-- Query for ip6m_mtu field of IP6_MTUINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip6_mtuinfo_struct_get_ip6m_mtu"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ip6_mtuinfo"
		}"
		end

end -- class IP6_MTUINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

