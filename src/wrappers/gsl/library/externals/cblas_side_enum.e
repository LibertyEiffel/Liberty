-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CBLAS_SIDE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cblas_left_low_level)  or else
				(a_value = cblas_right_low_level) )
		end

feature -- Setters
	default_create,
	set_cblas_left is
		do
			value := cblas_left_low_level
		end

	set_cblas_right is
		do
			value := cblas_right_low_level
		end

feature -- Queries
	is_cblas_left: BOOLEAN is
		do
			Result := (value=cblas_left_low_level)
		end

	is_cblas_right: BOOLEAN is
		do
			Result := (value=cblas_right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cblas_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasLeft"
 			}"
 		end

	cblas_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasRight"
 			}"
 		end


end -- class CBLAS_SIDE_ENUM
