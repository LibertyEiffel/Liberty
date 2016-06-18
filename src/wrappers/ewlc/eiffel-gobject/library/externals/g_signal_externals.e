note
	descriptio: "External calls for G_SIGNAL"

deferred class G_SIGNAL_EXTERNALS
inherit
	G_SIGNAL_FLAGS
	G_SIGNAL_MATCH_TYPE
	G_CONNECT_FLAGS
	ANY undefine is_equal, copy end

feature {} -- External calls
-- #include <glib-object.h>


--             GSignalInvocationHint;
-- gboolean    (*GSignalAccumulator)           (GSignalInvocationHint *ihint,
--                                              GValue *return_accu,
--                                              const GValue *handler_return,
--                                              gpointer data);
-- typedef     GSignalCMarshaller;
-- gboolean    (*GSignalEmissionHook)          (GSignalInvocationHint *ihint,
--                                              guint n_param_values,
--                                              const GValue *param_values,
--                                              gpointer data);
-- enum        GSignalFlags;
-- enum        GSignalMatchType;
--             GSignalQuery;
-- #define     G_SIGNAL_TYPE_STATIC_SCOPE
-- #define     G_SIGNAL_MATCH_MASK
-- #define     G_SIGNAL_FLAGS_MASK
-- guint       g_signal_new                    (const gchar *signal_name,
--                                              GType itype,
--                                              GSignalFlags signal_flags,
--                                              guint class_offset,
--                                              GSignalAccumulator accumulator,
--                                              gpointer accu_data,
--                                              GSignalCMarshaller c_marshaller,
--                                              GType return_type,
--                                              guint n_params,
--                                              ...);
-- guint       g_signal_newv                   (const gchar *signal_name,
--                                              GType itype,
--                                              GSignalFlags signal_flags,
--                                              GClosure *class_closure,
--                                              GSignalAccumulator accumulator,
--                                              gpointer accu_data,
--                                              GSignalCMarshaller c_marshaller,
--                                              GType return_type,
--                                              guint n_params,
--                                              GType *param_types);
-- guint       g_signal_new_valist             (const gchar *signal_name,
--                                              GType itype,
--                                              GSignalFlags signal_flags,
--                                              GClosure *class_closure,
--                                              GSignalAccumulator accumulator,
--                                              gpointer accu_data,
--                                              GSignalCMarshaller c_marshaller,
--                                              GType return_type,
--                                              guint n_params,
--                                              va_list args);
	g_signal_query (an_id: INTEGER; a_gsignalquery: POINTER)
			-- TODO: `an_id: INTEGER' maps `guint signal_id'; it shall be NATURAL
		require positive_id: an_id>0
		external "C use <glib-object.h>"
		end

	g_signal_lookup (a_name: POINTER; a_type: INTEGER): INTEGER
		require valid_type: a_type>0
		external "C use <glib-object.h>"
		end
		
		

	g_signal_name (an_id: INTEGER): POINTER
			-- TODO: `an_id: INTEGER' maps `guint signal_id'; it shall be NATURAL
		require positive_id: an_id>0
		external "C use <glib-object.h>"
		end
											  
-- guint*      g_signal_list_ids               (GType itype,
--                                              guint *n_ids);
-- void        g_signal_emit                   (gpointer instance,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              ...);
-- void        g_signal_emit_by_name           (gpointer instance,
--                                              const gchar *detailed_signal,
--                                              ...);
-- void        g_signal_emitv                  (const GValue *instance_and_params,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              GValue *return_value);
-- void        g_signal_emit_valist            (gpointer instance,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              va_list var_args);

	g_signal_connect (instance, detailed_signal, c_handler, data: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		ensure positive_result: Result>=0
		end
	
	-- #define     g_signal_connect_after          (instance, detailed_signal, c_handler, data)
	
	g_signal_connect_swapped (instance, detailed_signal, c_handler, data: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		ensure positive_result: Result>=0
		end

	g_signal_connect_object  (instance, signal_name, c_handler, gobject: POINTER;
									  connect_flags: INTEGER): INTEGER
		external "C use <glib-object.h>"
		ensure positive: Result>=0 -- TODO: Result is actually a gulong!
		end

	g_signal_connect_data (an_instance, a_detailed_signal, c_handler, data, destroy_data: POINTER
								  connect_flags: INTEGER): INTEGER_64
			-- Result is actually gulong, i.e. a NATURAL_64
		require
			valid_instance: an_instance.is_not_null
			valid_detailed_signal: a_detailed_signal.is_not_null
			valid_c_handler: c_handler.is_not_null
			valid_data: data.is_not_null
			valid_flags: are_valid_signal_flags(connect_flags)
		external "C use <glib-object.h>"
		ensure positive: Result>=0 -- TODO: Result is actually a gulong!
		end
		
	g_signal_connect_closure (an_instance, a_detailed_signal, a_closure: POINTER
									  after: INTEGER): INTEGER_64
			-- Result is actually gulong, i.e. a NATURAL_64
		require
			valid_instance: an_instance.is_not_null
			valid_detailed_signal: a_detailed_signal.is_not_null
			valid_cclosure: a_closure.is_not_null
		external "C use <glib-object.h>"
		ensure positive: Result>=0 -- TODO: Result is actually a gulong!
		end

-- gulong      g_signal_connect_closure_by_id  (gpointer instance,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              GClosure *closure,
--                                              gboolean after);
-- void        g_signal_handler_block          (gpointer instance,
--                                              gulong handler_id);
-- void        g_signal_handler_unblock        (gpointer instance,
--                                              gulong handler_id);
-- void        g_signal_handler_disconnect     (gpointer instance,
--                                              gulong handler_id);
-- gulong      g_signal_handler_find           (gpointer instance,
--                                              GSignalMatchType mask,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              GClosure *closure,
--                                              gpointer func,
--                                              gpointer data);
-- guint       g_signal_handlers_block_matched (gpointer instance,
--                                              GSignalMatchType mask,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              GClosure *closure,
--                                              gpointer func,
--                                              gpointer data);
-- guint       g_signal_handlers_unblock_matched
--                                             (gpointer instance,
--                                              GSignalMatchType mask,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              GClosure *closure,
--                                              gpointer func,
--                                              gpointer data);
-- guint       g_signal_handlers_disconnect_matched
--                                             (gpointer instance,
--                                              GSignalMatchType mask,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              GClosure *closure,
--                                              gpointer func,
--                                              gpointer data);
-- gboolean    g_signal_handler_is_connected   (gpointer instance,
--                                              gulong handler_id);
-- #define     g_signal_handlers_block_by_func (instance, func, data)
-- #define     g_signal_handlers_unblock_by_func(instance, func, data)
-- #define     g_signal_handlers_disconnect_by_func(instance, func, data)
-- gboolean    g_signal_has_handler_pending    (gpointer instance,
--                                              guint signal_id,
--                                              GQuark detail,
--                                              gboolean may_be_blocked);
-- void        g_signal_stop_emission          (gpointer instance,
--                                              guint signal_id,
--                                              GQuark detail);
	g_signal_stop_emission_by_name (an_instance, a_detailed_signal: POINTER)
		require
			valid_instance: an_instance.is_not_null
			valid_detailed_signal: a_detailed_signal.is_not_null
		external "C use <glib-object.h>"
		end
		
-- void        g_signal_stop_emission_by_name  (gpointer instance,
--                                              const gchar *detailed_signal);
-- void        g_signal_override_class_closure (guint signal_id,
--                                              GType instance_type,
--                                              GClosure *class_closure);
-- void        g_signal_chain_from_overridden  (const GValue *instance_and_params,
--                                              GValue *return_value);
-- gulong      g_signal_add_emission_hook      (guint signal_id,
--                                              GQuark detail,
--                                              GSignalEmissionHook hook_func,
--                                              gpointer hook_data,
--                                              GDestroyNotify data_destroy);
-- void        g_signal_remove_emission_hook   (guint signal_id,
--                                              gulong hook_id);
-- gboolean    g_signal_parse_name             (const gchar *detailed_signal,
--                                              GType itype,
--                                              guint *signal_id_p,
--                                              GQuark *detail_p,
--                                              gboolean force_detail_quark);
-- GSignalInvocationHint* g_signal_get_invocation_hint
--                                             (gpointer instance);
-- GClosure*   g_signal_type_cclosure_new      (GType itype,
--                                              guint struct_offset);
-- gboolean    g_signal_accumulator_true_handled
--                                             (GSignalInvocationHint *ihint,
--                                              GValue *return_accu,
--                                              const GValue *handler_return,
--                                              gpointer dummy);
end
