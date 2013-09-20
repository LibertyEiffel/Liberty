-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIDIRECTION_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = in_low_level)  or else
				(a_value = inout_low_level)  or else
				(a_value = out_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_in is
		do
			value := in_low_level
		end

	set_inout is
		do
			value := inout_low_level
		end

	set_out_external is
		do
			value := out_external_low_level
		end

feature {ANY} -- Queries
	is_in: BOOLEAN is
		do
			Result := (value=in_low_level)
		end

	is_inout: BOOLEAN is
		do
			Result := (value=inout_low_level)
		end

	is_out_external: BOOLEAN is
		do
			Result := (value=out_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_DIRECTION_IN"
 			}"
 		end

	inout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_DIRECTION_INOUT"
 			}"
 		end

	out_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_DIRECTION_OUT"
 			}"
 		end


end -- class GIDIRECTION_ENUM
