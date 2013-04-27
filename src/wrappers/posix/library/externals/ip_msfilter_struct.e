-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IP_MSFILTER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

	ip_msfilter_struct_set_imsf_fmode (a_structure: POINTER; a_value: like uint32_t) is
			-- Setter for imsf_fmode field of IP_MSFILTER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip_msfilter_struct_set_imsf_fmode"
		}"
		end

	ip_msfilter_struct_set_imsf_numsrc (a_structure: POINTER; a_value: like uint32_t) is
			-- Setter for imsf_numsrc field of IP_MSFILTER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip_msfilter_struct_set_imsf_numsrc"
		}"
		end

	ip_msfilter_struct_set_imsf_slist (a_structure: POINTER; a_value: POINTER) is
			-- Setter for imsf_slist field of IP_MSFILTER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip_msfilter_struct_set_imsf_slist"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field imsf_multiaddr.
	-- Unwrappable field imsf_interface.
	ip_msfilter_struct_get_imsf_fmode (a_structure: POINTER): like uint32_t is
			-- Query for imsf_fmode field of IP_MSFILTER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip_msfilter_struct_get_imsf_fmode"
		}"
		end

	ip_msfilter_struct_get_imsf_numsrc (a_structure: POINTER): like uint32_t is
			-- Query for imsf_numsrc field of IP_MSFILTER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip_msfilter_struct_get_imsf_numsrc"
		}"
		end

	ip_msfilter_struct_get_imsf_slist (a_structure: POINTER): POINTER is
			-- Query for imsf_slist field of IP_MSFILTER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ip_msfilter_struct_get_imsf_slist"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_ip_msfilter"
		}"
		end

end -- class IP_MSFILTER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

