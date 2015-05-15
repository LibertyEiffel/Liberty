-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GMP_RANDALG_T_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = default_external_low_level)  or else
				(a_value = lc_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_external
               do
                       value := default_external_low_level
               end

	set_lc
               do
                       value := lc_low_level
               end

feature {ANY} -- Queries
       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_lc: BOOLEAN
               do
                       Result := (value=lc_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GMP_RAND_ALG_DEFAULT"
                       }"
               end

     lc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GMP_RAND_ALG_LC"
                       }"
               end


end -- class GMP_RANDALG_T_ENUM
