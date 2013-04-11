-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_COMMAND_OPTIONS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (gda_command_option_ignore_errors | 
				gda_command_option_stop_on_errors | 
				gda_command_option_bad_option)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_gda_command_option_ignore_errors is
		do
			value := value.bit_or(gda_command_option_ignore_errors)
		end

	unset_gda_command_option_ignore_errors is
		do
			value := value.bit_xor(gda_command_option_ignore_errors)
		end

	set_gda_command_option_stop_on_errors is
		do
			value := value.bit_or(gda_command_option_stop_on_errors)
		end

	unset_gda_command_option_stop_on_errors is
		do
			value := value.bit_xor(gda_command_option_stop_on_errors)
		end

	set_gda_command_option_bad_option is
		do
			value := value.bit_or(gda_command_option_bad_option)
		end

	unset_gda_command_option_bad_option is
		do
			value := value.bit_xor(gda_command_option_bad_option)
		end


feature {ANY} -- Queries
	is_gda_command_option_ignore_errors: BOOLEAN is
		do
			Result := (value &gda_command_option_ignore_errors).to_boolean
		end

	is_gda_command_option_stop_on_errors: BOOLEAN is
		do
			Result := (value &gda_command_option_stop_on_errors).to_boolean
		end

	is_gda_command_option_bad_option: BOOLEAN is
		do
			Result := (value &gda_command_option_bad_option).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_command_option_ignore_errors: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_OPTION_IGNORE_ERRORS"
		end

	gda_command_option_stop_on_errors: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_OPTION_STOP_ON_ERRORS"
		end

	gda_command_option_bad_option: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_COMMAND_OPTION_BAD_OPTION"
		end


end

