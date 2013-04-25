-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_MARKUP_PARSE_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_markup_do_not_use_this_unsupported_flag | 
				g_markup_treat_cdata_as_text | 
				g_markup_prefix_error_position)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_g_markup_do_not_use_this_unsupported_flag is
		do
			value := value.bit_or(g_markup_do_not_use_this_unsupported_flag)
		end

	unset_g_markup_do_not_use_this_unsupported_flag is
		do
			value := value.bit_xor(g_markup_do_not_use_this_unsupported_flag)
		end

	set_g_markup_treat_cdata_as_text is
		do
			value := value.bit_or(g_markup_treat_cdata_as_text)
		end

	unset_g_markup_treat_cdata_as_text is
		do
			value := value.bit_xor(g_markup_treat_cdata_as_text)
		end

	set_g_markup_prefix_error_position is
		do
			value := value.bit_or(g_markup_prefix_error_position)
		end

	unset_g_markup_prefix_error_position is
		do
			value := value.bit_xor(g_markup_prefix_error_position)
		end


feature {ANY} -- Queries
	is_g_markup_do_not_use_this_unsupported_flag: BOOLEAN is
		do
			Result := (value &g_markup_do_not_use_this_unsupported_flag).to_boolean
		end

	is_g_markup_treat_cdata_as_text: BOOLEAN is
		do
			Result := (value &g_markup_treat_cdata_as_text).to_boolean
		end

	is_g_markup_prefix_error_position: BOOLEAN is
		do
			Result := (value &g_markup_prefix_error_position).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_do_not_use_this_unsupported_flag: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG"
		end

	g_markup_treat_cdata_as_text: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_TREAT_CDATA_AS_TEXT"
		end

	g_markup_prefix_error_position: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_PREFIX_ERROR_POSITION"
		end


end

