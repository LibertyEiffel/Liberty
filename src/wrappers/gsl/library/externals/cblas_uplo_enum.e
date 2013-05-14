-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CBLAS_UPLO_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cblas_lower_low_level)  or else
				(a_value = cblas_upper_low_level) )
		end

feature -- Setters
	default_create,
	set_cblas_lower is
		do
			value := cblas_lower_low_level
		end

	set_cblas_upper is
		do
			value := cblas_upper_low_level
		end

feature -- Queries
	is_cblas_lower: BOOLEAN is
		do
			Result := (value=cblas_lower_low_level)
		end

	is_cblas_upper: BOOLEAN is
		do
			Result := (value=cblas_upper_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cblas_lower_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasLower"
 			}"
 		end

	cblas_upper_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasUpper"
 			}"
 		end


end -- class CBLAS_UPLO_ENUM
