-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_COVERAGE_LEVEL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = fallback_low_level)  or else
				(a_value = approximate_low_level)  or else
				(a_value = exact_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_fallback is
		do
			value := fallback_low_level
		end

	set_approximate is
		do
			value := approximate_low_level
		end

	set_exact is
		do
			value := exact_low_level
		end

feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_fallback: BOOLEAN is
		do
			Result := (value=fallback_low_level)
		end

	is_approximate: BOOLEAN is
		do
			Result := (value=approximate_low_level)
		end

	is_exact: BOOLEAN is
		do
			Result := (value=exact_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_NONE"
 			}"
 		end

	fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_FALLBACK"
 			}"
 		end

	approximate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_APPROXIMATE"
 			}"
 		end

	exact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_EXACT"
 			}"
 		end


end -- class PANGO_COVERAGE_LEVEL_ENUM
