-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DATA_MODEL_QUERY_OPTIONS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (gda_data_model_query_option_use_all_fields_if_no_pk)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_gda_data_model_query_option_use_all_fields_if_no_pk is
		do
			value := value.bit_or(gda_data_model_query_option_use_all_fields_if_no_pk)
		end

	unset_gda_data_model_query_option_use_all_fields_if_no_pk is
		do
			value := value.bit_xor(gda_data_model_query_option_use_all_fields_if_no_pk)
		end


feature {ANY} -- Queries
	is_gda_data_model_query_option_use_all_fields_if_no_pk: BOOLEAN is
		do
			Result := (value &gda_data_model_query_option_use_all_fields_if_no_pk).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_data_model_query_option_use_all_fields_if_no_pk: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_DATA_MODEL_QUERY_OPTION_USE_ALL_FIELDS_IF_NO_PK"
		end


end

