-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GSIGNAL_FLAGS_ENUM

-- Wrapper of enum GSignalFlags defined in file /usr/include/glib-2.0/gobject/gsignal.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (action_low_level | 
				deprecated_low_level | 
				detailed_low_level | 
				must_collect_low_level | 
				no_hooks_low_level | 
				no_recurse_low_level | 
				run_cleanup_low_level | 
				run_first_low_level | 
				run_last_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_action
               do
                       value := value.bit_or(action_low_level)
               end

	unset_action
               do
                       value := value.bit_xor(action_low_level)
               end

	set_deprecated
               do
                       value := value.bit_or(deprecated_low_level)
               end

	unset_deprecated
               do
                       value := value.bit_xor(deprecated_low_level)
               end

	set_detailed
               do
                       value := value.bit_or(detailed_low_level)
               end

	unset_detailed
               do
                       value := value.bit_xor(detailed_low_level)
               end

	set_must_collect
               do
                       value := value.bit_or(must_collect_low_level)
               end

	unset_must_collect
               do
                       value := value.bit_xor(must_collect_low_level)
               end

	set_no_hooks
               do
                       value := value.bit_or(no_hooks_low_level)
               end

	unset_no_hooks
               do
                       value := value.bit_xor(no_hooks_low_level)
               end

	set_no_recurse
               do
                       value := value.bit_or(no_recurse_low_level)
               end

	unset_no_recurse
               do
                       value := value.bit_xor(no_recurse_low_level)
               end

	set_run_cleanup
               do
                       value := value.bit_or(run_cleanup_low_level)
               end

	unset_run_cleanup
               do
                       value := value.bit_xor(run_cleanup_low_level)
               end

	set_run_first
               do
                       value := value.bit_or(run_first_low_level)
               end

	unset_run_first
               do
                       value := value.bit_xor(run_first_low_level)
               end

	set_run_last
               do
                       value := value.bit_or(run_last_low_level)
               end

	unset_run_last
               do
                       value := value.bit_xor(run_last_low_level)
               end

feature {ANY} -- Queries
       is_action: BOOLEAN
               do
                       Result := (value.bit_and(action_low_level).to_boolean)
               end

       is_deprecated: BOOLEAN
               do
                       Result := (value.bit_and(deprecated_low_level).to_boolean)
               end

       is_detailed: BOOLEAN
               do
                       Result := (value.bit_and(detailed_low_level).to_boolean)
               end

       is_must_collect: BOOLEAN
               do
                       Result := (value.bit_and(must_collect_low_level).to_boolean)
               end

       is_no_hooks: BOOLEAN
               do
                       Result := (value.bit_and(no_hooks_low_level).to_boolean)
               end

       is_no_recurse: BOOLEAN
               do
                       Result := (value.bit_and(no_recurse_low_level).to_boolean)
               end

       is_run_cleanup: BOOLEAN
               do
                       Result := (value.bit_and(run_cleanup_low_level).to_boolean)
               end

       is_run_first: BOOLEAN
               do
                       Result := (value.bit_and(run_first_low_level).to_boolean)
               end

       is_run_last: BOOLEAN
               do
                       Result := (value.bit_and(run_last_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     action_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_ACTION"
                       }"
               end

     deprecated_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_DEPRECATED"
                       }"
               end

     detailed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_DETAILED"
                       }"
               end

     must_collect_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MUST_COLLECT"
                       }"
               end

     no_hooks_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_NO_HOOKS"
                       }"
               end

     no_recurse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_NO_RECURSE"
                       }"
               end

     run_cleanup_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_RUN_CLEANUP"
                       }"
               end

     run_first_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_RUN_FIRST"
                       }"
               end

     run_last_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_RUN_LAST"
                       }"
               end


end -- class GSIGNAL_FLAGS_ENUM
