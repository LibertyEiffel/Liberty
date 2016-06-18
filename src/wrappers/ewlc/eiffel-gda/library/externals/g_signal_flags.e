-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SIGNAL_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_signal_run_first | 
				g_signal_run_last | 
				g_signal_run_cleanup | 
				g_signal_no_recurse | 
				g_signal_detailed | 
				g_signal_action | 
				g_signal_no_hooks)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_run_first
		do
			value := value.bit_or(g_signal_run_first)
		end

	unset_run_first
		do
			value := value.bit_xor(g_signal_run_first)
		end

	set_run_last
		do
			value := value.bit_or(g_signal_run_last)
		end

	unset_run_last
		do
			value := value.bit_xor(g_signal_run_last)
		end

	set_run_cleanup
		do
			value := value.bit_or(g_signal_run_cleanup)
		end

	unset_run_cleanup
		do
			value := value.bit_xor(g_signal_run_cleanup)
		end

	set_no_recurse
		do
			value := value.bit_or(g_signal_no_recurse)
		end

	unset_no_recurse
		do
			value := value.bit_xor(g_signal_no_recurse)
		end

	set_detailed
		do
			value := value.bit_or(g_signal_detailed)
		end

	unset_detailed
		do
			value := value.bit_xor(g_signal_detailed)
		end

	set_action
		do
			value := value.bit_or(g_signal_action)
		end

	unset_action
		do
			value := value.bit_xor(g_signal_action)
		end

	set_no_hooks
		do
			value := value.bit_or(g_signal_no_hooks)
		end

	unset_no_hooks
		do
			value := value.bit_xor(g_signal_no_hooks)
		end


feature {ANY} -- Queries
	is_run_first: BOOLEAN
		do
			Result := (value &g_signal_run_first).to_boolean
		end

	is_run_last: BOOLEAN
		do
			Result := (value &g_signal_run_last).to_boolean
		end

	is_run_cleanup: BOOLEAN
		do
			Result := (value &g_signal_run_cleanup).to_boolean
		end

	is_no_recurse: BOOLEAN
		do
			Result := (value &g_signal_no_recurse).to_boolean
		end

	is_detailed: BOOLEAN
		do
			Result := (value &g_signal_detailed).to_boolean
		end

	is_action: BOOLEAN
		do
			Result := (value &g_signal_action).to_boolean
		end

	is_no_hooks: BOOLEAN
		do
			Result := (value &g_signal_no_hooks).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_run_first: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_RUN_FIRST"
		end

	g_signal_run_last: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_RUN_LAST"
		end

	g_signal_run_cleanup: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_RUN_CLEANUP"
		end

	g_signal_no_recurse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_NO_RECURSE"
		end

	g_signal_detailed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_DETAILED"
		end

	g_signal_action: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_ACTION"
		end

	g_signal_no_hooks: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SIGNAL_NO_HOOKS"
		end


end

