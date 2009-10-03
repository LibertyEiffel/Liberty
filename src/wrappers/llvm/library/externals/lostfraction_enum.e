-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LOSTFRACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = exactlyzero_low_level)  or else
				(a_value = exactlyhalf_low_level)  or else
				(a_value = morethanhalf_low_level) )
		end

feature -- Setters
	default_create,
	set_exactlyzero is
		do
			value := exactlyzero_low_level
		end

	set_exactlyhalf is
		do
			value := exactlyhalf_low_level
		end

	set_morethanhalf is
		do
			value := morethanhalf_low_level
		end

feature -- Queries
	is_exactlyzero: BOOLEAN is
		do
			Result := (value=exactlyzero_low_level)
		end

	is_exactlyhalf: BOOLEAN is
		do
			Result := (value=exactlyhalf_low_level)
		end

	is_morethanhalf: BOOLEAN is
		do
			Result := (value=morethanhalf_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	exactlyzero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "lfExactlyZero"
 			}"
 		end

	exactlyhalf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "lfExactlyHalf"
 			}"
 		end

	morethanhalf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "lfMoreThanHalf"
 			}"
 		end


end -- class LOSTFRACTION_ENUM
