-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSIGNAL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_signal_parse_name (a_detailed_signal: POINTER; an_itype: NATURAL_32; a_signal_id_p: POINTER; a_detail_p: POINTER; a_force_detail_quark: INTEGER_32): INTEGER_32 is
 		-- g_signal_parse_name (node at line 9)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_parse_name"
		}"
		end

	g_signal_handler_find (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_signal_handler_find (node at line 348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handler_find"
		}"
		end

	g_signal_remove_emission_hook (a_signal_id: NATURAL_32; a_hook_id: NATURAL_32) is
 		-- g_signal_remove_emission_hook (node at line 357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_remove_emission_hook"
		}"
		end

	g_signal_accumulator_true_handled (an_ihint: POINTER; a_return_accu: POINTER; a_handler_return: POINTER; a_dummy: POINTER): INTEGER_32 is
 		-- g_signal_accumulator_true_handled (node at line 1379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_accumulator_true_handled"
		}"
		end

	g_signal_has_handler_pending (an_instance: POINTER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_may_be_blocked: INTEGER_32): INTEGER_32 is
 		-- g_signal_has_handler_pending (node at line 1409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_has_handler_pending"
		}"
		end

	g_signal_query (a_signal_id: NATURAL_32; a_query: POINTER) is
 		-- g_signal_query (node at line 1958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_query"
		}"
		end

	g_signal_get_invocation_hint (an_instance: POINTER): POINTER is
 		-- g_signal_get_invocation_hint (node at line 2276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_get_invocation_hint"
		}"
		end

	g_signal_chain_from_overridden_handler (an_instance: POINTER) is
 		-- g_signal_chain_from_overridden_handler (variadic call)  (node at line 2588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_chain_from_overridden_handler"
		}"
		end

	g_signal_override_class_closure (a_signal_id: NATURAL_32; an_instance_type: NATURAL_32; a_class_closure: POINTER) is
 		-- g_signal_override_class_closure (node at line 2627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_override_class_closure"
		}"
		end

	g_signal_emit_by_name (an_instance: POINTER; a_detailed_signal: POINTER) is
 		-- g_signal_emit_by_name (variadic call)  (node at line 2651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_emit_by_name"
		}"
		end

	g_signal_list_ids (an_itype: NATURAL_32; a_n_ids: POINTER): POINTER is
 		-- g_signal_list_ids (node at line 2669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_list_ids"
		}"
		end

	g_signal_name (a_signal_id: NATURAL_32): POINTER is
 		-- g_signal_name (node at line 2714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_name"
		}"
		end

	g_signal_handler_block (an_instance: POINTER; a_handler_id: NATURAL_32) is
 		-- g_signal_handler_block (node at line 3192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handler_block"
		}"
		end

	g_signal_handlers_unblock_matched (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_signal_handlers_unblock_matched (node at line 3284)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handlers_unblock_matched"
		}"
		end

	g_signal_emit (an_instance: POINTER; a_signal_id: NATURAL_32; a_detail: NATURAL_32) is
 		-- g_signal_emit (variadic call)  (node at line 3367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_emit"
		}"
		end

	g_signal_connect_closure (an_instance: POINTER; a_detailed_signal: POINTER; a_closure: POINTER; an_after: INTEGER_32): NATURAL_32 is
 		-- g_signal_connect_closure (node at line 3418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_connect_closure"
		}"
		end

	g_signal_chain_from_overridden (an_instance_and_params: POINTER; a_return_value: POINTER) is
 		-- g_signal_chain_from_overridden (node at line 3501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_chain_from_overridden"
		}"
		end

	g_signal_newv (a_signal_name: POINTER; an_itype: NATURAL_32; a_signal_flags: INTEGER; a_class_closure: POINTER; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: NATURAL_32; a_n_params: NATURAL_32; a_param_types: POINTER): NATURAL_32 is
 		-- g_signal_newv (node at line 3544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_newv"
		}"
		end

	g_signal_stop_emission_by_name (an_instance: POINTER; a_detailed_signal: POINTER) is
 		-- g_signal_stop_emission_by_name (node at line 3701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_stop_emission_by_name"
		}"
		end

	g_signal_new (a_signal_name: POINTER; an_itype: NATURAL_32; a_signal_flags: INTEGER; a_class_offset: NATURAL_32; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: NATURAL_32; a_n_params: NATURAL_32): NATURAL_32 is
 		-- g_signal_new (variadic call)  (node at line 3705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_new"
		}"
		end

	g_signal_emit_valist (an_instance: POINTER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_var_args: POINTER) is
 		-- g_signal_emit_valist (node at line 3922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_emit_valist"
		}"
		end

	g_signal_lookup (a_name: POINTER; an_itype: NATURAL_32): NATURAL_32 is
 		-- g_signal_lookup (node at line 4182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_lookup"
		}"
		end

	g_signal_handler_unblock (an_instance: POINTER; a_handler_id: NATURAL_32) is
 		-- g_signal_handler_unblock (node at line 4542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handler_unblock"
		}"
		end

	g_signal_handlers_block_matched (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_signal_handlers_block_matched (node at line 4572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handlers_block_matched"
		}"
		end

	g_signal_new_valist (a_signal_name: POINTER; an_itype: NATURAL_32; a_signal_flags: INTEGER; a_class_closure: POINTER; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: NATURAL_32; a_n_params: NATURAL_32; an_args: POINTER): NATURAL_32 is
 		-- g_signal_new_valist (node at line 4859)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_new_valist"
		}"
		end

	g_signal_connect_data (an_instance: POINTER; a_detailed_signal: POINTER; a_c_handler: POINTER; a_data: POINTER; a_destroy_data: POINTER; a_connect_flags: INTEGER): NATURAL_32 is
 		-- g_signal_connect_data (node at line 5084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_connect_data"
		}"
		end

	g_signal_handlers_destroy (an_instance: POINTER) is
 		-- g_signal_handlers_destroy (node at line 5341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handlers_destroy"
		}"
		end

	-- `hidden' function _g_signals_destroy skipped.
	g_signal_handlers_disconnect_matched (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL_32 is
 		-- g_signal_handlers_disconnect_matched (node at line 5815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handlers_disconnect_matched"
		}"
		end

	g_signal_handler_disconnect (an_instance: POINTER; a_handler_id: NATURAL_32) is
 		-- g_signal_handler_disconnect (node at line 5897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handler_disconnect"
		}"
		end

	g_signal_stop_emission (an_instance: POINTER; a_signal_id: NATURAL_32; a_detail: NATURAL_32) is
 		-- g_signal_stop_emission (node at line 7111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_stop_emission"
		}"
		end

	g_signal_new_class_handler (a_signal_name: POINTER; an_itype: NATURAL_32; a_signal_flags: INTEGER; a_class_handler: POINTER; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: NATURAL_32; a_n_params: NATURAL_32): NATURAL_32 is
 		-- g_signal_new_class_handler (variadic call)  (node at line 7255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_new_class_handler"
		}"
		end

	g_signal_connect_closure_by_id (an_instance: POINTER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_closure: POINTER; an_after: INTEGER_32): NATURAL_32 is
 		-- g_signal_connect_closure_by_id (node at line 7362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_connect_closure_by_id"
		}"
		end

	g_signal_emitv (an_instance_and_params: POINTER; a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_return_value: POINTER) is
 		-- g_signal_emitv (node at line 7425)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_emitv"
		}"
		end

	g_signal_override_class_handler (a_signal_name: POINTER; an_instance_type: NATURAL_32; a_class_handler: POINTER) is
 		-- g_signal_override_class_handler (node at line 7742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_override_class_handler"
		}"
		end

	g_signal_handler_is_connected (an_instance: POINTER; a_handler_id: NATURAL_32): INTEGER_32 is
 		-- g_signal_handler_is_connected (node at line 7886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_handler_is_connected"
		}"
		end

	g_signal_add_emission_hook (a_signal_id: NATURAL_32; a_detail: NATURAL_32; a_hook_func: POINTER; a_hook_data: POINTER; a_data_destroy: POINTER): NATURAL_32 is
 		-- g_signal_add_emission_hook (node at line 7901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_add_emission_hook"
		}"
		end


end -- class GSIGNAL_EXTERNALS
