-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKET_MSG_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = oob_low_level)  or else
				(a_value = peek_low_level)  or else
				(a_value = dontroute_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_oob is
		do
			value := oob_low_level
		end

	set_peek is
		do
			value := peek_low_level
		end

	set_dontroute is
		do
			value := dontroute_low_level
		end

feature -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	oob: BOOLEAN is
		do
			Result := (value=oob_low_level)
		end

	peek: BOOLEAN is
		do
			Result := (value=peek_low_level)
		end

	dontroute: BOOLEAN is
		do
			Result := (value=dontroute_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_MSG_NONE"
 			}"
 		end

	oob_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_MSG_OOB"
 			}"
 		end

	peek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_MSG_PEEK"
 			}"
 		end

	dontroute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_MSG_DONTROUTE"
 			}"
 		end


end -- class GSOCKET_MSG_FLAGS_ENUM
