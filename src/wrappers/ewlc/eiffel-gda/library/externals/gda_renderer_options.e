-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_RENDERER_OPTIONS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (gda_renderer_extra_pretty_sql | 
				gda_renderer_params_as_detailed | 
				gda_renderer_error_if_default | 
				gda_renderer_fields_no_target_alias | 
				gda_renderer_params_as_colon | 
				gda_renderer_params_as_dollar)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_extra_pretty_sql is
		do
			value := value.bit_or(gda_renderer_extra_pretty_sql)
		end

	unset_extra_pretty_sql is
		do
			value := value.bit_xor(gda_renderer_extra_pretty_sql)
		end

	set_params_as_detailed is
		do
			value := value.bit_or(gda_renderer_params_as_detailed)
		end

	unset_params_as_detailed is
		do
			value := value.bit_xor(gda_renderer_params_as_detailed)
		end

	set_error_if_default is
		do
			value := value.bit_or(gda_renderer_error_if_default)
		end

	unset_error_if_default is
		do
			value := value.bit_xor(gda_renderer_error_if_default)
		end

	set_fields_no_target_alias is
		do
			value := value.bit_or(gda_renderer_fields_no_target_alias)
		end

	unset_fields_no_target_alias is
		do
			value := value.bit_xor(gda_renderer_fields_no_target_alias)
		end

	set_params_as_colon is
		do
			value := value.bit_or(gda_renderer_params_as_colon)
		end

	unset_params_as_colon is
		do
			value := value.bit_xor(gda_renderer_params_as_colon)
		end

	set_params_as_dollar is
		do
			value := value.bit_or(gda_renderer_params_as_dollar)
		end

	unset_params_as_dollar is
		do
			value := value.bit_xor(gda_renderer_params_as_dollar)
		end


feature {ANY} -- Queries
	is_extra_pretty_sql: BOOLEAN is
		do
			Result := (value &gda_renderer_extra_pretty_sql).to_boolean
		end

	is_params_as_detailed: BOOLEAN is
		do
			Result := (value &gda_renderer_params_as_detailed).to_boolean
		end

	is_error_if_default: BOOLEAN is
		do
			Result := (value &gda_renderer_error_if_default).to_boolean
		end

	is_fields_no_target_alias: BOOLEAN is
		do
			Result := (value &gda_renderer_fields_no_target_alias).to_boolean
		end

	is_params_as_colon: BOOLEAN is
		do
			Result := (value &gda_renderer_params_as_colon).to_boolean
		end

	is_params_as_dollar: BOOLEAN is
		do
			Result := (value &gda_renderer_params_as_dollar).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_renderer_extra_pretty_sql: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_EXTRA_PRETTY_SQL"
		end

	gda_renderer_params_as_detailed: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_PARAMS_AS_DETAILED"
		end

	gda_renderer_error_if_default: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_ERROR_IF_DEFAULT"
		end

	gda_renderer_fields_no_target_alias: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_FIELDS_NO_TARGET_ALIAS"
		end

	gda_renderer_params_as_colon: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_PARAMS_AS_COLON"
		end

	gda_renderer_params_as_dollar: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_RENDERER_PARAMS_AS_DOLLAR"
		end


end

