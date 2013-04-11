-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSIGNALFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_signal_action is
		do
			value := value.bit_or(g_signal_action_low_level)
		end

	unset_g_signal_action is
		do
			value := value.bit_xor(g_signal_action_low_level)
		end

	set_g_signal_detailed is
		do
			value := value.bit_or(g_signal_detailed_low_level)
		end

	unset_g_signal_detailed is
		do
			value := value.bit_xor(g_signal_detailed_low_level)
		end

	set_g_signal_must_collect is
		do
			value := value.bit_or(g_signal_must_collect_low_level)
		end

	unset_g_signal_must_collect is
		do
			value := value.bit_xor(g_signal_must_collect_low_level)
		end

	set_g_signal_no_hooks is
		do
			value := value.bit_or(g_signal_no_hooks_low_level)
		end

	unset_g_signal_no_hooks is
		do
			value := value.bit_xor(g_signal_no_hooks_low_level)
		end

	set_g_signal_no_recurse is
		do
			value := value.bit_or(g_signal_no_recurse_low_level)
		end

	unset_g_signal_no_recurse is
		do
			value := value.bit_xor(g_signal_no_recurse_low_level)
		end

	set_g_signal_run_cleanup is
		do
			value := value.bit_or(g_signal_run_cleanup_low_level)
		end

	unset_g_signal_run_cleanup is
		do
			value := value.bit_xor(g_signal_run_cleanup_low_level)
		end

	set_g_signal_run_first is
		do
			value := value.bit_or(g_signal_run_first_low_level)
		end

	unset_g_signal_run_first is
		do
			value := value.bit_xor(g_signal_run_first_low_level)
		end

	set_g_signal_run_last is
		do
			value := value.bit_or(g_signal_run_last_low_level)
		end

	unset_g_signal_run_last is
		do
			value := value.bit_xor(g_signal_run_last_low_level)
		end

feature {ANY} -- Queries
	is_g_signal_action: BOOLEAN is
		do
			Result := (value=g_signal_action_low_level)
		end

	is_g_signal_detailed: BOOLEAN is
		do
			Result := (value=g_signal_detailed_low_level)
		end

	is_g_signal_must_collect: BOOLEAN is
		do
			Result := (value=g_signal_must_collect_low_level)
		end

	is_g_signal_no_hooks: BOOLEAN is
		do
			Result := (value=g_signal_no_hooks_low_level)
		end

	is_g_signal_no_recurse: BOOLEAN is
		do
			Result := (value=g_signal_no_recurse_low_level)
		end

	is_g_signal_run_cleanup: BOOLEAN is
		do
			Result := (value=g_signal_run_cleanup_low_level)
		end

	is_g_signal_run_first: BOOLEAN is
		do
			Result := (value=g_signal_run_first_low_level)
		end

	is_g_signal_run_last: BOOLEAN is
		do
			Result := (value=g_signal_run_last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_ACTION"
 			}"
 		end

	g_signal_detailed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_DETAILED"
 			}"
 		end

	g_signal_must_collect_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MUST_COLLECT"
 			}"
 		end

	g_signal_no_hooks_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_NO_HOOKS"
 			}"
 		end

	g_signal_no_recurse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_NO_RECURSE"
 			}"
 		end

	g_signal_run_cleanup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_RUN_CLEANUP"
 			}"
 		end

	g_signal_run_first_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_RUN_FIRST"
 			}"
 		end

	g_signal_run_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_RUN_LAST"
 			}"
 		end


end -- class GSIGNALFLAGS_ENUM
