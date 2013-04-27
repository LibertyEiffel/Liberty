-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SIGNAL_MATCH_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_signal_match_id | 
				g_signal_match_detail | 
				g_signal_match_closure | 
				g_signal_match_func | 
				g_signal_match_data | 
				g_signal_match_unblocked)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_id is
		do
			value := value.bit_or(g_signal_match_id)
		end

	unset_id is
		do
			value := value.bit_xor(g_signal_match_id)
		end

	set_detail is
		do
			value := value.bit_or(g_signal_match_detail)
		end

	unset_detail is
		do
			value := value.bit_xor(g_signal_match_detail)
		end

	set_closure is
		do
			value := value.bit_or(g_signal_match_closure)
		end

	unset_closure is
		do
			value := value.bit_xor(g_signal_match_closure)
		end

	set_func is
		do
			value := value.bit_or(g_signal_match_func)
		end

	unset_func is
		do
			value := value.bit_xor(g_signal_match_func)
		end

	set_data is
		do
			value := value.bit_or(g_signal_match_data)
		end

	unset_data is
		do
			value := value.bit_xor(g_signal_match_data)
		end

	set_unblocked is
		do
			value := value.bit_or(g_signal_match_unblocked)
		end

	unset_unblocked is
		do
			value := value.bit_xor(g_signal_match_unblocked)
		end


feature {ANY} -- Queries
	is_id: BOOLEAN is
		do
			Result := (value &g_signal_match_id).to_boolean
		end

	is_detail: BOOLEAN is
		do
			Result := (value &g_signal_match_detail).to_boolean
		end

	is_closure: BOOLEAN is
		do
			Result := (value &g_signal_match_closure).to_boolean
		end

	is_func: BOOLEAN is
		do
			Result := (value &g_signal_match_func).to_boolean
		end

	is_data: BOOLEAN is
		do
			Result := (value &g_signal_match_data).to_boolean
		end

	is_unblocked: BOOLEAN is
		do
			Result := (value &g_signal_match_unblocked).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_match_id: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_ID"
		end

	g_signal_match_detail: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_DETAIL"
		end

	g_signal_match_closure: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_CLOSURE"
		end

	g_signal_match_func: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_FUNC"
		end

	g_signal_match_data: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_DATA"
		end

	g_signal_match_unblocked: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_MATCH_UNBLOCKED"
		end


end

