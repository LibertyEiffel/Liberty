-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOCOVERAGELEVEL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_coverage_approximate_low_level)  or else
				(a_value = pango_coverage_exact_low_level)  or else
				(a_value = pango_coverage_fallback_low_level)  or else
				(a_value = pango_coverage_none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_coverage_approximate is
		do
			value := pango_coverage_approximate_low_level
		end

	set_pango_coverage_exact is
		do
			value := pango_coverage_exact_low_level
		end

	set_pango_coverage_fallback is
		do
			value := pango_coverage_fallback_low_level
		end

	set_pango_coverage_none is
		do
			value := pango_coverage_none_low_level
		end

feature {ANY} -- Queries
	is_pango_coverage_approximate: BOOLEAN is
		do
			Result := (value=pango_coverage_approximate_low_level)
		end

	is_pango_coverage_exact: BOOLEAN is
		do
			Result := (value=pango_coverage_exact_low_level)
		end

	is_pango_coverage_fallback: BOOLEAN is
		do
			Result := (value=pango_coverage_fallback_low_level)
		end

	is_pango_coverage_none: BOOLEAN is
		do
			Result := (value=pango_coverage_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_coverage_approximate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_APPROXIMATE"
 			}"
 		end

	pango_coverage_exact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_EXACT"
 			}"
 		end

	pango_coverage_fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_FALLBACK"
 			}"
 		end

	pango_coverage_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_COVERAGE_NONE"
 			}"
 		end


end -- class PANGOCOVERAGELEVEL_ENUM
