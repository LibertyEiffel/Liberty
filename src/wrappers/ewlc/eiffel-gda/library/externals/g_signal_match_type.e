-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SIGNAL_MATCH_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_signal_match_id | 
				g_signal_match_detail | 
				g_signal_match_closure | 
				g_signal_match_func | 
				g_signal_match_data | 
				g_signal_match_unblocked)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_id
		do
			value := value.bit_or(g_signal_match_id)
		end

	unset_id
		do
			value := value.bit_xor(g_signal_match_id)
		end

	set_detail
		do
			value := value.bit_or(g_signal_match_detail)
		end

	unset_detail
		do
			value := value.bit_xor(g_signal_match_detail)
		end

	set_closure
		do
			value := value.bit_or(g_signal_match_closure)
		end

	unset_closure
		do
			value := value.bit_xor(g_signal_match_closure)
		end

	set_func
		do
			value := value.bit_or(g_signal_match_func)
		end

	unset_func
		do
			value := value.bit_xor(g_signal_match_func)
		end

	set_data
		do
			value := value.bit_or(g_signal_match_data)
		end

	unset_data
		do
			value := value.bit_xor(g_signal_match_data)
		end

	set_unblocked
		do
			value := value.bit_or(g_signal_match_unblocked)
		end

	unset_unblocked
		do
			value := value.bit_xor(g_signal_match_unblocked)
		end


feature {ANY} -- Queries
	is_id: BOOLEAN
		do
			Result := (value &g_signal_match_id).to_boolean
		end

	is_detail: BOOLEAN
		do
			Result := (value &g_signal_match_detail).to_boolean
		end

	is_closure: BOOLEAN
		do
			Result := (value &g_signal_match_closure).to_boolean
		end

	is_func: BOOLEAN
		do
			Result := (value &g_signal_match_func).to_boolean
		end

	is_data: BOOLEAN
		do
			Result := (value &g_signal_match_data).to_boolean
		end

	is_unblocked: BOOLEAN
		do
			Result := (value &g_signal_match_unblocked).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_match_id: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_ID"
		end

	g_signal_match_detail: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_DETAIL"
		end

	g_signal_match_closure: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_CLOSURE"
		end

	g_signal_match_func: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_FUNC"
		end

	g_signal_match_data: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_DATA"
		end

	g_signal_match_unblocked: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_UNBLOCKED"
		end


end

