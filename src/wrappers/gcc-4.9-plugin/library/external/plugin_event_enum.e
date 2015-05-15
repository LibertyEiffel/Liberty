-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class PLUGIN_EVENT_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = all_ipa_passes_end_low_level)  or else
				(a_value = all_ipa_passes_start_low_level)  or else
				(a_value = all_passes_end_low_level)  or else
				(a_value = all_passes_start_low_level)  or else
				(a_value = attributes_low_level)  or else
				(a_value = early_gimple_passes_end_low_level)  or else
				(a_value = early_gimple_passes_start_low_level)  or else
				(a_value = event_first_dynamic_low_level)  or else
				(a_value = finish_low_level)  or else
				(a_value = finish_decl_low_level)  or else
				(a_value = finish_type_low_level)  or else
				(a_value = finish_unit_low_level)  or else
				(a_value = ggc_end_low_level)  or else
				(a_value = ggc_marking_low_level)  or else
				(a_value = ggc_start_low_level)  or else
				(a_value = include_file_low_level)  or else
				(a_value = info_low_level)  or else
				(a_value = new_pass_low_level)  or else
				(a_value = override_gate_low_level)  or else
				(a_value = pass_execution_low_level)  or else
				(a_value = pass_manager_setup_low_level)  or else
				(a_value = pragmas_low_level)  or else
				(a_value = pre_genericize_low_level)  or else
				(a_value = register_ggc_caches_low_level)  or else
				(a_value = register_ggc_roots_low_level)  or else
				(a_value = start_unit_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_all_ipa_passes_end
               do
                       value := all_ipa_passes_end_low_level
               end

	set_all_ipa_passes_start
               do
                       value := all_ipa_passes_start_low_level
               end

	set_all_passes_end
               do
                       value := all_passes_end_low_level
               end

	set_all_passes_start
               do
                       value := all_passes_start_low_level
               end

	set_attributes
               do
                       value := attributes_low_level
               end

	set_early_gimple_passes_end
               do
                       value := early_gimple_passes_end_low_level
               end

	set_early_gimple_passes_start
               do
                       value := early_gimple_passes_start_low_level
               end

	set_event_first_dynamic
               do
                       value := event_first_dynamic_low_level
               end

	set_finish
               do
                       value := finish_low_level
               end

	set_finish_decl
               do
                       value := finish_decl_low_level
               end

	set_finish_type
               do
                       value := finish_type_low_level
               end

	set_finish_unit
               do
                       value := finish_unit_low_level
               end

	set_ggc_end
               do
                       value := ggc_end_low_level
               end

	set_ggc_marking
               do
                       value := ggc_marking_low_level
               end

	set_ggc_start
               do
                       value := ggc_start_low_level
               end

	set_include_file
               do
                       value := include_file_low_level
               end

	set_info
               do
                       value := info_low_level
               end

	set_new_pass
               do
                       value := new_pass_low_level
               end

	set_override_gate
               do
                       value := override_gate_low_level
               end

	set_pass_execution
               do
                       value := pass_execution_low_level
               end

	set_pass_manager_setup
               do
                       value := pass_manager_setup_low_level
               end

	set_pragmas
               do
                       value := pragmas_low_level
               end

	set_pre_genericize
               do
                       value := pre_genericize_low_level
               end

	set_register_ggc_caches
               do
                       value := register_ggc_caches_low_level
               end

	set_register_ggc_roots
               do
                       value := register_ggc_roots_low_level
               end

	set_start_unit
               do
                       value := start_unit_low_level
               end

feature {ANY} -- Queries
       is_all_ipa_passes_end: BOOLEAN
               do
                       Result := (value=all_ipa_passes_end_low_level)
               end

       is_all_ipa_passes_start: BOOLEAN
               do
                       Result := (value=all_ipa_passes_start_low_level)
               end

       is_all_passes_end: BOOLEAN
               do
                       Result := (value=all_passes_end_low_level)
               end

       is_all_passes_start: BOOLEAN
               do
                       Result := (value=all_passes_start_low_level)
               end

       is_attributes: BOOLEAN
               do
                       Result := (value=attributes_low_level)
               end

       is_early_gimple_passes_end: BOOLEAN
               do
                       Result := (value=early_gimple_passes_end_low_level)
               end

       is_early_gimple_passes_start: BOOLEAN
               do
                       Result := (value=early_gimple_passes_start_low_level)
               end

       is_event_first_dynamic: BOOLEAN
               do
                       Result := (value=event_first_dynamic_low_level)
               end

       is_finish: BOOLEAN
               do
                       Result := (value=finish_low_level)
               end

       is_finish_decl: BOOLEAN
               do
                       Result := (value=finish_decl_low_level)
               end

       is_finish_type: BOOLEAN
               do
                       Result := (value=finish_type_low_level)
               end

       is_finish_unit: BOOLEAN
               do
                       Result := (value=finish_unit_low_level)
               end

       is_ggc_end: BOOLEAN
               do
                       Result := (value=ggc_end_low_level)
               end

       is_ggc_marking: BOOLEAN
               do
                       Result := (value=ggc_marking_low_level)
               end

       is_ggc_start: BOOLEAN
               do
                       Result := (value=ggc_start_low_level)
               end

       is_include_file: BOOLEAN
               do
                       Result := (value=include_file_low_level)
               end

       is_info: BOOLEAN
               do
                       Result := (value=info_low_level)
               end

       is_new_pass: BOOLEAN
               do
                       Result := (value=new_pass_low_level)
               end

       is_override_gate: BOOLEAN
               do
                       Result := (value=override_gate_low_level)
               end

       is_pass_execution: BOOLEAN
               do
                       Result := (value=pass_execution_low_level)
               end

       is_pass_manager_setup: BOOLEAN
               do
                       Result := (value=pass_manager_setup_low_level)
               end

       is_pragmas: BOOLEAN
               do
                       Result := (value=pragmas_low_level)
               end

       is_pre_genericize: BOOLEAN
               do
                       Result := (value=pre_genericize_low_level)
               end

       is_register_ggc_caches: BOOLEAN
               do
                       Result := (value=register_ggc_caches_low_level)
               end

       is_register_ggc_roots: BOOLEAN
               do
                       Result := (value=register_ggc_roots_low_level)
               end

       is_start_unit: BOOLEAN
               do
                       Result := (value=start_unit_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     all_ipa_passes_end_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_ALL_IPA_PASSES_END"
                       }"
               end

     all_ipa_passes_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_ALL_IPA_PASSES_START"
                       }"
               end

     all_passes_end_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_ALL_PASSES_END"
                       }"
               end

     all_passes_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_ALL_PASSES_START"
                       }"
               end

     attributes_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_ATTRIBUTES"
                       }"
               end

     early_gimple_passes_end_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_EARLY_GIMPLE_PASSES_END"
                       }"
               end

     early_gimple_passes_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_EARLY_GIMPLE_PASSES_START"
                       }"
               end

     event_first_dynamic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_EVENT_FIRST_DYNAMIC"
                       }"
               end

     finish_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_FINISH"
                       }"
               end

     finish_decl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_FINISH_DECL"
                       }"
               end

     finish_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_FINISH_TYPE"
                       }"
               end

     finish_unit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_FINISH_UNIT"
                       }"
               end

     ggc_end_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_GGC_END"
                       }"
               end

     ggc_marking_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_GGC_MARKING"
                       }"
               end

     ggc_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_GGC_START"
                       }"
               end

     include_file_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_INCLUDE_FILE"
                       }"
               end

     info_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_INFO"
                       }"
               end

     new_pass_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_NEW_PASS"
                       }"
               end

     override_gate_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_OVERRIDE_GATE"
                       }"
               end

     pass_execution_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_PASS_EXECUTION"
                       }"
               end

     pass_manager_setup_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_PASS_MANAGER_SETUP"
                       }"
               end

     pragmas_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_PRAGMAS"
                       }"
               end

     pre_genericize_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_PRE_GENERICIZE"
                       }"
               end

     register_ggc_caches_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_REGISTER_GGC_CACHES"
                       }"
               end

     register_ggc_roots_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_REGISTER_GGC_ROOTS"
                       }"
               end

     start_unit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PLUGIN_START_UNIT"
                       }"
               end


end -- class PLUGIN_EVENT_ENUM
