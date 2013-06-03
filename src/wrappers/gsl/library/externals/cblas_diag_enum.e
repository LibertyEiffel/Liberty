-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CBLAS_DIAG_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cblas_non_unit_low_level)  or else
				(a_value = cblas_unit_low_level) )
		end

feature -- Setters
	default_create,
	set_cblas_non_unit is
		do
			value := cblas_non_unit_low_level
		end

	set_cblas_unit is
		do
			value := cblas_unit_low_level
		end

feature -- Queries
	is_cblas_non_unit: BOOLEAN is
		do
			Result := (value=cblas_non_unit_low_level)
		end

	is_cblas_unit: BOOLEAN is
		do
			Result := (value=cblas_unit_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cblas_non_unit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasNonUnit"
 			}"
 		end

	cblas_unit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasUnit"
 			}"
 		end


end -- class CBLAS_DIAG_ENUM
