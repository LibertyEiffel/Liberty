-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TYPE_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_type_flag_abstract | 
				g_type_flag_value_abstract)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_g_type_flag_abstract
		do
			value := value.bit_or(g_type_flag_abstract)
		end

	unset_g_type_flag_abstract
		do
			value := value.bit_xor(g_type_flag_abstract)
		end

	set_g_type_flag_value_abstract
		do
			value := value.bit_or(g_type_flag_value_abstract)
		end

	unset_g_type_flag_value_abstract
		do
			value := value.bit_xor(g_type_flag_value_abstract)
		end


feature {ANY} -- Queries
	is_g_type_flag_abstract: BOOLEAN
		do
			Result := (value &g_type_flag_abstract).to_boolean
		end

	is_g_type_flag_value_abstract: BOOLEAN
		do
			Result := (value &g_type_flag_value_abstract).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_flag_abstract: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_FLAG_ABSTRACT"
		end

	g_type_flag_value_abstract: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_FLAG_VALUE_ABSTRACT"
		end


end

