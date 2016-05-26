-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSIGNAL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_signal_accumulator_first_wins (an_ihint: POINTER; a_return_accu: POINTER; a_handler_return: POINTER; a_dummy: POINTER): INTEGER 

		-- function g_signal_accumulator_first_wins (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_accumulator_first_wins
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_accumulator_first_wins"
               }"
               end

	g_signal_accumulator_true_handled (an_ihint: POINTER; a_return_accu: POINTER; a_handler_return: POINTER; a_dummy: POINTER): INTEGER 

		-- function g_signal_accumulator_true_handled (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_accumulator_true_handled
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_accumulator_true_handled"
               }"
               end

	g_signal_add_emission_hook (a_signal_id: NATURAL; a_detail: NATURAL; a_hook_func: POINTER; a_hook_data: POINTER; a_data_destroy: POINTER): like long_unsigned 

		-- function g_signal_add_emission_hook (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_add_emission_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_add_emission_hook"
               }"
               end

	g_signal_chain_from_overridden (an_instance_and_params: POINTER; a_return_value: POINTER) 

		-- function g_signal_chain_from_overridden (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_chain_from_overridden
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_chain_from_overridden"
               }"
               end

	g_signal_chain_from_overridden_handler (an_instance: POINTER) 

		-- function g_signal_chain_from_overridden_handler (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_chain_from_overridden_handler (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_chain_from_overridden_handler"
               }"
               end

	g_signal_connect_closure (an_instance: POINTER; a_detailed_signal: POINTER; a_closure: POINTER; an_after: INTEGER): like long_unsigned 

		-- function g_signal_connect_closure (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_connect_closure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_connect_closure"
               }"
               end

	g_signal_connect_closure_by_id (an_instance: POINTER; a_signal_id: NATURAL; a_detail: NATURAL; a_closure: POINTER; an_after: INTEGER): like long_unsigned 

		-- function g_signal_connect_closure_by_id (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_connect_closure_by_id
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_connect_closure_by_id"
               }"
               end

	g_signal_connect_data (an_instance: POINTER; a_detailed_signal: POINTER; a_c_handler: POINTER; a_data: POINTER; a_destroy_data: POINTER; a_connect_flags: INTEGER): like long_unsigned 

		-- function g_signal_connect_data (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_connect_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_connect_data"
               }"
               end

	g_signal_emit (an_instance: POINTER; a_signal_id: NATURAL; a_detail: NATURAL) 

		-- function g_signal_emit (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_emit (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_emit"
               }"
               end

	g_signal_emit_by_name (an_instance: POINTER; a_detailed_signal: POINTER) 

		-- function g_signal_emit_by_name (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_emit_by_name (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_emit_by_name"
               }"
               end

	g_signal_emit_valist (an_instance: POINTER; a_signal_id: NATURAL; a_detail: NATURAL; a_var_args: POINTER) 

		-- function g_signal_emit_valist (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_emit_valist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_emit_valist"
               }"
               end

	g_signal_emitv (an_instance_and_params: POINTER; a_signal_id: NATURAL; a_detail: NATURAL; a_return_value: POINTER) 

		-- function g_signal_emitv (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_emitv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_emitv"
               }"
               end

	g_signal_get_invocation_hint (an_instance: POINTER): POINTER 

		-- function g_signal_get_invocation_hint (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_get_invocation_hint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_get_invocation_hint"
               }"
               end

	g_signal_handler_block (an_instance: POINTER; a_handler_id: like long_unsigned) 

		-- function g_signal_handler_block (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handler_block
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handler_block"
               }"
               end

	g_signal_handler_disconnect (an_instance: POINTER; a_handler_id: like long_unsigned) 

		-- function g_signal_handler_disconnect (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handler_disconnect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handler_disconnect"
               }"
               end

	g_signal_handler_find (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL; a_detail: NATURAL; a_closure: POINTER; a_func: POINTER; a_data: POINTER): like long_unsigned 

		-- function g_signal_handler_find (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handler_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handler_find"
               }"
               end

	g_signal_handler_is_connected (an_instance: POINTER; a_handler_id: like long_unsigned): INTEGER 

		-- function g_signal_handler_is_connected (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handler_is_connected
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handler_is_connected"
               }"
               end

	g_signal_handler_unblock (an_instance: POINTER; a_handler_id: like long_unsigned) 

		-- function g_signal_handler_unblock (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handler_unblock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handler_unblock"
               }"
               end

	g_signal_handlers_block_matched (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL; a_detail: NATURAL; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL 

		-- function g_signal_handlers_block_matched (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handlers_block_matched
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handlers_block_matched"
               }"
               end

	g_signal_handlers_destroy (an_instance: POINTER) 

		-- function g_signal_handlers_destroy (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handlers_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handlers_destroy"
               }"
               end

	g_signal_handlers_disconnect_matched (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL; a_detail: NATURAL; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL 

		-- function g_signal_handlers_disconnect_matched (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handlers_disconnect_matched
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handlers_disconnect_matched"
               }"
               end

	g_signal_handlers_unblock_matched (an_instance: POINTER; a_mask: INTEGER; a_signal_id: NATURAL; a_detail: NATURAL; a_closure: POINTER; a_func: POINTER; a_data: POINTER): NATURAL 

		-- function g_signal_handlers_unblock_matched (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_handlers_unblock_matched
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_handlers_unblock_matched"
               }"
               end

	g_signal_has_handler_pending (an_instance: POINTER; a_signal_id: NATURAL; a_detail: NATURAL; a_may_be_blocked: INTEGER): INTEGER 

		-- function g_signal_has_handler_pending (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_has_handler_pending
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_has_handler_pending"
               }"
               end

	g_signal_list_ids (an_itype: like long_unsigned; a_n_ids: POINTER): POINTER 

		-- function g_signal_list_ids (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_list_ids
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_list_ids"
               }"
               end

	g_signal_lookup (a_name: POINTER; an_itype: like long_unsigned): NATURAL 

		-- function g_signal_lookup (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_lookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_lookup"
               }"
               end

	g_signal_name (a_signal_id: NATURAL): POINTER 

		-- function g_signal_name (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_name"
               }"
               end

	g_signal_new (a_signal_name: POINTER; an_itype: like long_unsigned; a_signal_flags: INTEGER; a_class_offset: NATURAL; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: like long_unsigned; a_n_params: NATURAL): NATURAL 

		-- function g_signal_new (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_new (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_new"
               }"
               end

	g_signal_new_class_handler (a_signal_name: POINTER; an_itype: like long_unsigned; a_signal_flags: INTEGER; a_class_handler: POINTER; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: like long_unsigned; a_n_params: NATURAL): NATURAL 

		-- function g_signal_new_class_handler (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_new_class_handler (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_new_class_handler"
               }"
               end

	g_signal_new_valist (a_signal_name: POINTER; an_itype: like long_unsigned; a_signal_flags: INTEGER; a_class_closure: POINTER; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: like long_unsigned; a_n_params: NATURAL; an_args: POINTER): NATURAL 

		-- function g_signal_new_valist (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_new_valist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_new_valist"
               }"
               end

	g_signal_newv (a_signal_name: POINTER; an_itype: like long_unsigned; a_signal_flags: INTEGER; a_class_closure: POINTER; an_accumulator: POINTER; an_accu_data: POINTER; a_c_marshaller: POINTER; a_return_type: like long_unsigned; a_n_params: NATURAL; a_param_types: POINTER): NATURAL 

		-- function g_signal_newv (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_newv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_newv"
               }"
               end

	g_signal_override_class_closure (a_signal_id: NATURAL; an_instance_type: like long_unsigned; a_class_closure: POINTER) 

		-- function g_signal_override_class_closure (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_override_class_closure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_override_class_closure"
               }"
               end

	g_signal_override_class_handler (a_signal_name: POINTER; an_instance_type: like long_unsigned; a_class_handler: POINTER) 

		-- function g_signal_override_class_handler (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_override_class_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_override_class_handler"
               }"
               end

	g_signal_parse_name (a_detailed_signal: POINTER; an_itype: like long_unsigned; a_signal_id_p: POINTER; a_detail_p: POINTER; a_force_detail_quark: INTEGER): INTEGER 

		-- function g_signal_parse_name (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_parse_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_parse_name"
               }"
               end

	g_signal_query (a_signal_id: NATURAL; a_query: POINTER) 

		-- function g_signal_query (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_query
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_query"
               }"
               end

	g_signal_remove_emission_hook (a_signal_id: NATURAL; a_hook_id: like long_unsigned) 

		-- function g_signal_remove_emission_hook (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_remove_emission_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_remove_emission_hook"
               }"
               end

	g_signal_set_va_marshaller (a_signal_id: NATURAL; an_instance_type: like long_unsigned; a_va_marshaller: POINTER) 

		-- function g_signal_set_va_marshaller (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_set_va_marshaller
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_set_va_marshaller"
               }"
               end

	g_signal_stop_emission (an_instance: POINTER; a_signal_id: NATURAL; a_detail: NATURAL) 

		-- function g_signal_stop_emission (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_stop_emission
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_stop_emission"
               }"
               end

	g_signal_stop_emission_by_name (an_instance: POINTER; a_detailed_signal: POINTER) 

		-- function g_signal_stop_emission_by_name (in `/usr/include/glib-2.0/gobject/gsignal.h')
               -- g_signal_stop_emission_by_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_signal_stop_emission_by_name"
               }"
               end

	-- `hidden' function _g_signals_destroy skipped.

end -- class GSIGNAL_EXTERNALS
