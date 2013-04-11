-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GRESOLVERERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_resolver_error_internal_low_level)  or else
				(a_value = g_resolver_error_not_found_low_level)  or else
				(a_value = g_resolver_error_temporary_failure_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_resolver_error_internal is
		do
			value := g_resolver_error_internal_low_level
		end

	set_g_resolver_error_not_found is
		do
			value := g_resolver_error_not_found_low_level
		end

	set_g_resolver_error_temporary_failure is
		do
			value := g_resolver_error_temporary_failure_low_level
		end

feature {ANY} -- Queries
	is_g_resolver_error_internal: BOOLEAN is
		do
			Result := (value=g_resolver_error_internal_low_level)
		end

	is_g_resolver_error_not_found: BOOLEAN is
		do
			Result := (value=g_resolver_error_not_found_low_level)
		end

	is_g_resolver_error_temporary_failure: BOOLEAN is
		do
			Result := (value=g_resolver_error_temporary_failure_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_resolver_error_internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_ERROR_INTERNAL"
 			}"
 		end

	g_resolver_error_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_ERROR_NOT_FOUND"
 			}"
 		end

	g_resolver_error_temporary_failure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_ERROR_TEMPORARY_FAILURE"
 			}"
 		end


end -- class GRESOLVERERROR_ENUM
