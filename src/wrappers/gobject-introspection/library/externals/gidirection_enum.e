-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIDIRECTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gi_direction_in_low_level)  or else
				(a_value = gi_direction_inout_low_level)  or else
				(a_value = gi_direction_out_low_level) )
		end

feature -- Setters
	default_create,
	set_gi_direction_in is
		do
			value := gi_direction_in_low_level
		end

	set_gi_direction_inout is
		do
			value := gi_direction_inout_low_level
		end

	set_gi_direction_out is
		do
			value := gi_direction_out_low_level
		end

feature -- Queries
	is_gi_direction_in: BOOLEAN is
		do
			Result := (value=gi_direction_in_low_level)
		end

	is_gi_direction_inout: BOOLEAN is
		do
			Result := (value=gi_direction_inout_low_level)
		end

	is_gi_direction_out: BOOLEAN is
		do
			Result := (value=gi_direction_out_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_direction_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_DIRECTION_IN"
 			}"
 		end

	gi_direction_inout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_DIRECTION_INOUT"
 			}"
 		end

	gi_direction_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_DIRECTION_OUT"
 			}"
 		end


end -- class GIDIRECTION_ENUM
