-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CBLAS_TRANSPOSE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cblas_conj_trans_low_level)  or else
				(a_value = cblas_no_trans_low_level)  or else
				(a_value = cblas_trans_low_level) )
		end

feature -- Setters
	default_create,
	set_cblas_conj_trans is
		do
			value := cblas_conj_trans_low_level
		end

	set_cblas_no_trans is
		do
			value := cblas_no_trans_low_level
		end

	set_cblas_trans is
		do
			value := cblas_trans_low_level
		end

feature -- Queries
	is_cblas_conj_trans: BOOLEAN is
		do
			Result := (value=cblas_conj_trans_low_level)
		end

	is_cblas_no_trans: BOOLEAN is
		do
			Result := (value=cblas_no_trans_low_level)
		end

	is_cblas_trans: BOOLEAN is
		do
			Result := (value=cblas_trans_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cblas_conj_trans_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasConjTrans"
 			}"
 		end

	cblas_no_trans_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasNoTrans"
 			}"
 		end

	cblas_trans_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CblasTrans"
 			}"
 		end


end -- class CBLAS_TRANSPOSE_ENUM
