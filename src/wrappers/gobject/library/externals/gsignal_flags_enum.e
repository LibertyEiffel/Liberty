-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSIGNAL_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_signal_action_low_level | 
				g_signal_detailed_low_level | 
				g_signal_must_collect_low_level | 
				g_signal_no_hooks_low_level | 
				g_signal_no_recurse_low_level | 
				g_signal_run_cleanup_low_level | 
				g_signal_run_first_low_level | 
				g_signal_run_last_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_signal_action
		do
			value := value.bit_or(g_signal_action_low_level)
		end

	unset_g_signal_action
		do
			value := value.bit_xor(g_signal_action_low_level)
		end

	set_g_signal_detailed
		do
			value := value.bit_or(g_signal_detailed_low_level)
		end

	unset_g_signal_detailed
		do
			value := value.bit_xor(g_signal_detailed_low_level)
		end

	set_g_signal_must_collect
		do
			value := value.bit_or(g_signal_must_collect_low_level)
		end

	unset_g_signal_must_collect
		do
			value := value.bit_xor(g_signal_must_collect_low_level)
		end

	set_g_signal_no_hooks
		do
			value := value.bit_or(g_signal_no_hooks_low_level)
		end

	unset_g_signal_no_hooks
		do
			value := value.bit_xor(g_signal_no_hooks_low_level)
		end

	set_g_signal_no_recurse
		do
			value := value.bit_or(g_signal_no_recurse_low_level)
		end

	unset_g_signal_no_recurse
		do
			value := value.bit_xor(g_signal_no_recurse_low_level)
		end

	set_g_signal_run_cleanup
		do
			value := value.bit_or(g_signal_run_cleanup_low_level)
		end

	unset_g_signal_run_cleanup
		do
			value := value.bit_xor(g_signal_run_cleanup_low_level)
		end

	set_g_signal_run_first
		do
			value := value.bit_or(g_signal_run_first_low_level)
		end

	unset_g_signal_run_first
		do
			value := value.bit_xor(g_signal_run_first_low_level)
		end

	set_g_signal_run_last
		do
			value := value.bit_or(g_signal_run_last_low_level)
		end

	unset_g_signal_run_last
		do
			value := value.bit_xor(g_signal_run_last_low_level)
		end

feature {ANY} -- Queries
	is_g_signal_action: BOOLEAN
		do
			Result := (value=g_signal_action_low_level)
		end

	is_g_signal_detailed: BOOLEAN
		do
			Result := (value=g_signal_detailed_low_level)
		end

	is_g_signal_must_collect: BOOLEAN
		do
			Result := (value=g_signal_must_collect_low_level)
		end

	is_g_signal_no_hooks: BOOLEAN
		do
			Result := (value=g_signal_no_hooks_low_level)
		end

	is_g_signal_no_recurse: BOOLEAN
		do
			Result := (value=g_signal_no_recurse_low_level)
		end

	is_g_signal_run_cleanup: BOOLEAN
		do
			Result := (value=g_signal_run_cleanup_low_level)
		end

	is_g_signal_run_first: BOOLEAN
		do
			Result := (value=g_signal_run_first_low_level)
		end

	is_g_signal_run_last: BOOLEAN
		do
			Result := (value=g_signal_run_last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_action_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_ACTION"
 			}"
 		end

	g_signal_detailed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_DETAILED"
 			}"
 		end

	g_signal_must_collect_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MUST_COLLECT"
 			}"
 		end

	g_signal_no_hooks_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_NO_HOOKS"
 			}"
 		end

	g_signal_no_recurse_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_NO_RECURSE"
 			}"
 		end

	g_signal_run_cleanup_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_RUN_CLEANUP"
 			}"
 		end

	g_signal_run_first_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_RUN_FIRST"
 			}"
 		end

	g_signal_run_last_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_RUN_LAST"
 			}"
 		end


end -- class GSIGNAL_FLAGS_ENUM
