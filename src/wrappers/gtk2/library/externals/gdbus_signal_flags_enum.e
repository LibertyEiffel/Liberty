-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_SIGNAL_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ne_low_level)  or else
				(a_value = match_rule_low_level) )
		end

feature -- Setters
	default_create,
	set_ne is
		do
			value := ne_low_level
		end

	set_match_rule is
		do
			value := match_rule_low_level
		end

feature -- Queries
	ne: BOOLEAN is
		do
			Result := (value=ne_low_level)
		end

	match_rule: BOOLEAN is
		do
			Result := (value=match_rule_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SIGNAL_FLAGS_NONE"
 			}"
 		end

	match_rule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SIGNAL_FLAGS_NO_MATCH_RULE"
 			}"
 		end


end -- class GDBUS_SIGNAL_FLAGS_ENUM
