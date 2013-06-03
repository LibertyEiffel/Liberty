-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CBLAS_ORDER_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cblas_col_major_low_level)  or else
				(a_value = cblas_row_major_low_level) )
		end

feature -- Setters
	default_create,
	set_cblas_col_major is
		do
			value := cblas_col_major_low_level
		end

	set_cblas_row_major is
		do
			value := cblas_row_major_low_level
		end

feature -- Queries
	is_cblas_col_major: BOOLEAN is
		do
			Result := (value=cblas_col_major_low_level)
		end

	is_cblas_row_major: BOOLEAN is
		do
			Result := (value=cblas_row_major_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cblas_col_major_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasColMajor"
 			}"
 		end

	cblas_row_major_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasRowMajor"
 			}"
 		end


end -- class CBLAS_ORDER_ENUM
