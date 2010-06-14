-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FILL_RULE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = even_odd_rule_low_level)  or else
				(a_value = winding_rule_low_level) )
		end

feature -- Setters
	default_create,
	set_even_odd_rule is
		do
			value := even_odd_rule_low_level
		end

	set_winding_rule is
		do
			value := winding_rule_low_level
		end

feature -- Queries
	is_even_odd_rule: BOOLEAN is
		do
			Result := (value=even_odd_rule_low_level)
		end

	is_winding_rule: BOOLEAN is
		do
			Result := (value=winding_rule_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	even_odd_rule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EVEN_ODD_RULE"
 			}"
 		end

	winding_rule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDING_RULE"
 			}"
 		end


end -- class GDK_FILL_RULE_ENUM
