-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_PARAMETER_LIST_PARAM_HINT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (gda_parameter_list_param_read_only | 
				gda_parameter_list_param_hide)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_gda_parameter_list_param_read_only
		do
			value := value.bit_or(gda_parameter_list_param_read_only)
		end

	unset_gda_parameter_list_param_read_only
		do
			value := value.bit_xor(gda_parameter_list_param_read_only)
		end

	set_gda_parameter_list_param_hide
		do
			value := value.bit_or(gda_parameter_list_param_hide)
		end

	unset_gda_parameter_list_param_hide
		do
			value := value.bit_xor(gda_parameter_list_param_hide)
		end


feature {ANY} -- Queries
	is_gda_parameter_list_param_read_only: BOOLEAN
		do
			Result := (value &gda_parameter_list_param_read_only).to_boolean
		end

	is_gda_parameter_list_param_hide: BOOLEAN
		do
			Result := (value &gda_parameter_list_param_hide).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_parameter_list_param_read_only: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_PARAM_READ_ONLY"
		end

	gda_parameter_list_param_hide: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_PARAM_HIDE"
		end


end

