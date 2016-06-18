-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TYPE_FUNDAMENTAL_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_type_flag_classed | 
				g_type_flag_instantiatable | 
				g_type_flag_derivable | 
				g_type_flag_deep_derivable)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_classed
		do
			value := value.bit_or(g_type_flag_classed)
		end

	unset_classed
		do
			value := value.bit_xor(g_type_flag_classed)
		end

	set_instantiatable
		do
			value := value.bit_or(g_type_flag_instantiatable)
		end

	unset_instantiatable
		do
			value := value.bit_xor(g_type_flag_instantiatable)
		end

	set_derivable
		do
			value := value.bit_or(g_type_flag_derivable)
		end

	unset_derivable
		do
			value := value.bit_xor(g_type_flag_derivable)
		end

	set_deep_derivable
		do
			value := value.bit_or(g_type_flag_deep_derivable)
		end

	unset_deep_derivable
		do
			value := value.bit_xor(g_type_flag_deep_derivable)
		end


feature {ANY} -- Queries
	is_classed: BOOLEAN
		do
			Result := (value &g_type_flag_classed).to_boolean
		end

	is_instantiatable: BOOLEAN
		do
			Result := (value &g_type_flag_instantiatable).to_boolean
		end

	is_derivable: BOOLEAN
		do
			Result := (value &g_type_flag_derivable).to_boolean
		end

	is_deep_derivable: BOOLEAN
		do
			Result := (value &g_type_flag_deep_derivable).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_type_flag_classed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_FLAG_CLASSED"
		end

	g_type_flag_instantiatable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_FLAG_INSTANTIATABLE"
		end

	g_type_flag_derivable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_FLAG_DERIVABLE"
		end

	g_type_flag_deep_derivable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TYPE_FLAG_DEEP_DERIVABLE"
		end


end

