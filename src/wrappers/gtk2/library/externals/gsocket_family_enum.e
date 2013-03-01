-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKET_FAMILY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = unix_low_level)  or else
				(a_value = ipv4_low_level)  or else
				(a_value = ipv6_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_unix is
		do
			value := unix_low_level
		end

	set_ipv4 is
		do
			value := ipv4_low_level
		end

	set_ipv6 is
		do
			value := ipv6_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	unix: BOOLEAN is
		do
			Result := (value=unix_low_level)
		end

	ipv4: BOOLEAN is
		do
			Result := (value=ipv4_low_level)
		end

	ipv6: BOOLEAN is
		do
			Result := (value=ipv6_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_INVALID"
 			}"
 		end

	unix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_UNIX"
 			}"
 		end

	ipv4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_IPV4"
 			}"
 		end

	ipv6_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_IPV6"
 			}"
 		end


end -- class GSOCKET_FAMILY_ENUM
