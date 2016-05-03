note

	description: "Signals -- A means for customization of object behaviour and a general purpose notification mechanism"
	long: ""
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"
	
deferred class G_SIGNAL

	-- Note: a signal is not a c_struct inherit C_STRUCT rename make as make_struct end
	
	-- The basic concept of the signal system is that of the emission
	-- of a signal. Signals are introduced per-type and are identified
	-- through strings. Signals introduced for a parent type are
	-- available in derived types as well, so basically they are a
	-- per-type facility that is inherited. A signal emission mainly
	-- involves invocation of a certain set of callbacks in precisely
	-- defined manner. There are two main categories of such callbacks,
	-- per-object [11] ones and user provided ones. The per-object
	-- callbacks are most often referred to as "object method handler"
	-- or "default (signal) handler", while user provided callbacks are
	-- usually just called "signal handler". The object method handler
	-- is provided at signal creation time (this most frequently
	-- happens at the end of an object class' creation), while user
	-- provided handlers are frequently connected and disconnected
	-- to/from a certain signal on certain object instances.
	
	-- A signal emission consists of five stages, unless prematurely
	-- stopped:
	
	-- 1 - Invocation of the object method handler for
	-- G_SIGNAL_RUN_FIRST signals
	
	-- 2 - Invocation of normal user-provided signal handlers
	-- (after flag FALSE)
	
	-- 3 - Invocation of the object method handler for
	-- G_SIGNAL_RUN_LAST signals
	
	-- 4 - Invocation of user provided signal handlers, connected
	-- with an after flag of TRUE
	
	-- 5 - Invocation of the object method handler for
	-- G_SIGNAL_RUN_CLEANUP signals
	
	-- The user-provided signal handlers are called in the order they
	-- were connected in. All handlers may prematurely stop a signal
	-- emission, and any number of handlers may be connected,
	-- disconnected, blocked or unblocked during a signal
	-- emission. There are certain criteria for skipping user handlers
	-- in stages 2 and 4 of a signal emission. First, user handlers may
	-- be blocked, blocked handlers are omitted during callback
	-- invocation, to return from the "blocked" state, a handler has to
	-- get unblocked exactly the same amount of times it has been
	-- blocked before. Second, upon emission of a G_SIGNAL_DETAILED
	-- signal, an additional "detail" argument passed in to
	-- g_signal_emit() has to match the detail argument of the signal
	-- handler currently subject to invocation. Specification of no
	-- detail argument for signal handlers (omission of the detail part
	-- of the signal specification upon connection) serves as a
	-- wildcard and matches any detail argument passed in to emission.

insert
	G_SIGNAL_EXTERNALS 
	G_SIGNAL_FLAGS
	G_SIGNAL_INVOCATION_HINT
	G_SIGNAL_MATCH_TYPE

feature {ANY} -- Implementation
	signal_id: INTEGER_64	
	
feature {ANY} -- Unwrapped C 

	-- GSignalAccumulator ()

	-- gboolean    (*GSignalAccumulator)           (GSignalInvocationHint *ihint,
	--                                              GValue *return_accu,
	--                                              const GValue *handler_return,
	--                                              gpointer data);
	
	-- The signal accumulator is a special callback function that can be used to collect return values of the various callbacks that are called during a signal emission. The signal accumulator is specified at signal creation time, if it is left NULL, no accumulation of callback return values is performed. The return value of signal emissions is then the value returned by the last callback.
	-- ihint : 	Signal invocation hint, see GSignalInvocationHint.
	-- return_accu : 	Accumulator to collect callback return values in, this is the return value of the current signal emission.
	-- handler_return : 	A GValue holding the return value of the signal handler.
	-- data : 	Callback data that was specified when creating the signal.
	-- Returns : 	The accumulator function returns whether the signal emission should be aborted. Returning FALSE means to abort the current emission and TRUE is returned for continuation.
	-- GSignalCMarshaller

	-- typedef GClosureMarshal			 GSignalCMarshaller;

	-- This is the signature of marshaller functions, required to marshall arrays of parameter values to signal emissions into C language callback invocations. It is merely an alias to GClosureMarshal since the GClosure mechanism takes over responsibility of actual function invocation for the signal system.
	-- GSignalEmissionHook ()

	-- gboolean    (*GSignalEmissionHook)          (GSignalInvocationHint *ihint,
	--                                              guint n_param_values,
	--                                              const GValue *param_values,
	--                                              gpointer data);

	-- A simple function pointer to get invoked when the signal is emitted. This allows you to tie a hook to the signal type, so that it will trap all emissions of that signal, from any object.

	-- You may not attach these to signals created with the G_SIGNAL_NO_HOOKS flag.
	-- ihint : 	Signal invocation hint, see GSignalInvocationHint.
	-- n_param_values : 	the number of parameters to the function, including the instance on which the signal was emitted.
	-- param_values : 	the instance on which the signal was emitted, followed by the parameters of the emission.
	-- data : 	user data associated with the hook.
	-- Returns : 	whether it wants to stay connected. If it returns FALSE, the signal hook is disconnected (and destroyed).

	
	-- G_SIGNAL_TYPE_STATIC_SCOPE

	-- #define	G_SIGNAL_TYPE_STATIC_SCOPE (G_TYPE_FLAG_RESERVED_ID_BIT)

	-- This macro flags signal argument types for which the signal system may assume that instances thereof remain persistent across all signal emissions they are used in. This is only useful for non ref-counted, value-copy types.

	-- To flag a signal argument in this way, add | G_SIGNAL_TYPE_STATIC_SCOPE to the corresponding argument of g_signal_new().

	--     g_signal_new ("size_request",
	-- 		  G_TYPE_FROM_CLASS (gobject_class),
	-- 		  G_SIGNAL_RUN_FIRST,
	-- 		  G_STRUCT_OFFSET (GtkWidgetClass, size_request),
	-- 		  NULL, NULL,
	-- 		  _gtk_marshal_VOID__BOXED,
	-- 		  G_TYPE_NONE, 1,
	-- 		  GTK_TYPE_REQUISITION | G_SIGNAL_TYPE_STATIC_SCOPE);

	-- G_SIGNAL_MATCH_MASK

	-- #define G_SIGNAL_MATCH_MASK  0x3f

	-- A mask for all GSignalMatchType bits.
	-- G_SIGNAL_FLAGS_MASK

	-- #define G_SIGNAL_FLAGS_MASK  0x7f

	-- A mask for all GSignalFlags bits.


	-- NOTE: g_signal_new is unwrappeble since variadic. g_signal_newv is
	-- wrapped and provides the same functionality
feature {} -- Creation
	
	make (a_gobject: G_OBJECT; some_flags: INTEGER;
			a_return_type: INTEGER; parameters_types: ARRAY[INTEGER]) is
			-- Creates a new signal. This is usually done in the
			-- GObject's class initializer at C level.

			-- A signal name consists of segments consisting of ASCII
			-- letters and digits, separated by either the '-' or '_'
			-- character. The first character of a signal name must be a
			-- letter. Names which violate these rules lead to undefined
			-- behaviour of the GSignal system.

			-- When registering a signal and looking up a signal, either
			-- separator can be used, but they cannot be mixed.
		
			-- Note: Class-level closure and accumulator are currently not implemented;
		require
			valid_gobject: a_gobject /= Void
			valid_flags: are_valid_signal_flags (some_flags)
			valid_return_type: 
		do
			-- guint g_signal_newv (const gchar *signal_name, Type itype,
			-- GSignalFlags signal_flags, GClosure *class_closure,
			-- GSignalAccumulator accumulator, gpointer accu_data,
			-- GSignalCMarshaller c_marshaller, GType return_type, guint
			-- n_params, GType *param_types);
			
			-- Creates a new signal. (This is usually done in the class initializer.)

			-- A signal name consists of segments consisting of ASCII
			-- letters and digits, separated by either the '-' or '_'
			-- character. The first character of a signal name must be a
			-- letter. Names which violate these rules lead to undefined
			-- behaviour of the GSignal system.

			-- When registering a signal and looking up a signal, either separator can be used, but they cannot be mixed.
			-- signal_name : 	the name for the signal
			-- itype : 	the type this signal pertains to. It will also pertain to types which are derived from this type.
			-- signal_flags : 	a combination of GSignalFlags specifying detail of when the default handler is to be invoked. You should at least specify G_SIGNAL_RUN_FIRST or G_SIGNAL_RUN_LAST.
			-- class_closure : 	The closure to invoke on signal emission.
			-- accumulator : 	the accumulator for this signal; may be NULL.
			-- accu_data : 	user data for the accumulator.
			-- c_marshaller : 	the function to translate arrays of parameter values to signal emissions into C language callback invocations.
			-- return_type : 	the type of return value, or G_TYPE_NONE for a signal without a return value.
			-- n_params : 	the length of param_types.
			-- param_types : 	an array types, one for each parameter.
			-- Returns : 	the signal id
			
			-- signal_id := g_signal_newv (a_name.to_external, a_gobject.type,
			not_yet_implemented
		end
	
	-- g_signal_new_valist is unwrappable since it uses va_list
		
		
	-- g_signal_list_ids ()
		
	-- guint*      g_signal_list_ids               (GType itype,
	--                                              guint *n_ids);

	-- Lists the signals by id that a certain instance or interface type created. Further information about the signals can be acquired through g_signal_query().
	-- itype : 	Instance or interface type.
	-- n_ids : 	Location to store the number of signal ids for itype.
	-- Returns : 	Newly allocated array of signal IDs.
	-- g_signal_emit ()

	-- void        g_signal_emit                   (gpointer instance,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              ...);

	-- Emits a signal.

	-- Note that g_signal_emit() resets the return value to the default if no handlers are connected, in contrast to g_signal_emitv().
	-- instance : 	the instance the signal is being emitted on.
	-- signal_id : 	the signal id
	-- detail : 	the detail
	-- ... : 	parameters to be passed to the signal, followed by a location for the return value. If the return type of the signal is G_TYPE_NONE, the return value location can be omitted.
	-- g_signal_emit_by_name ()

	-- void        g_signal_emit_by_name           (gpointer instance,
	--                                              const gchar *detailed_signal,
	--                                              ...);

	-- Emits a signal.

	-- Note that g_signal_emit_by_name() resets the return value to the default if no handlers are connected, in contrast to g_signal_emitv().
	-- instance : 	the instance the signal is being emitted on.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- ... : 	parameters to be passed to the signal, followed by a location for the return value. If the return type of the signal is G_TYPE_NONE, the return value location can be omitted.
	-- g_signal_emitv ()

	-- void        g_signal_emitv                  (const GValue *instance_and_params,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              GValue *return_value);

	-- Emits a signal.

	-- Note that g_signal_emitv() doesn't change return_value if no handlers are connected, in contrast to g_signal_emit() and g_signal_emit_valist().
	-- instance_and_params : 	argument list for the signal emission. The first element in the array is a GValue for the instance the signal is being emitted on. The rest are any arguments to be passed to the signal.
	-- signal_id : 	the signal id
	-- detail : 	the detail
	-- return_value : 	Location to store the return value of the signal emission.
	-- g_signal_emit_valist ()

	-- void        g_signal_emit_valist            (gpointer instance,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              va_list var_args);

	-- Emits a signal.

	-- Note that g_signal_emit_valist() resets the return value to the default if no handlers are connected, in contrast to g_signal_emitv().
	-- instance : 	the instance the signal is being emitted on.
	-- signal_id : 	the signal id
	-- detail : 	the detail
	-- var_args : 	a list of parameters to be passed to the signal, followed by a location for the return value. If the return type of the signal is G_TYPE_NONE, the return value location can be omitted.
	
	-- Note: g_signal_connect() wrapped in G_SIGNALS
	
	-- g_signal_connect_after()

	-- #define     g_signal_connect_after(instance, detailed_signal, c_handler, data)

	-- Connects a GCallback function to a signal for a particular object.

	-- The handler will be called after the default handler of the signal.
	-- instance : 	the instance to connect to.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- c_handler : 	the GCallback to connect.
	-- data : 	data to pass to c_handler calls.
	-- Returns : 	the handler id
	-- g_signal_connect_swapped()

	-- #define     g_signal_connect_swapped(instance, detailed_signal, c_handler, data)

	-- Connects a GCallback function to a signal for a particular object.

	-- The instance on which the signal is emitted and data will be swapped when calling the handler.
	-- instance : 	the instance to connect to.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- c_handler : 	the GCallback to connect.
	-- data : 	data to pass to c_handler calls.
	-- Returns : 	the handler id
	-- g_signal_connect_object ()

	-- gulong      g_signal_connect_object         (gpointer instance,
	--                                              const gchar *detailed_signal,
	--                                              GCallback c_handler,
	--                                              gpointer gobject,
	--                                              GConnectFlags connect_flags);

	-- This is similar to g_signal_connect_data(), but uses a closure which ensures that the gobject stays alive during the call to c_handler by temporarily adding a reference count to gobject.

	-- Note that there is a bug in GObject that makes this function much less useful than it might seem otherwise. Once gobject is disposed, the callback will no longer be called, but, the signal handler is not currently disconnected. If the instance is itself being freed at the same time than this doesn't matter, since the signal will automatically be removed, but if instance persists, then the signal handler will leak. You should not remove the signal yourself because in a future versions of GObject, the handler will automatically be disconnected.

	-- It's possible to work around this problem in a way that will continue to work with future versions of GObject by checking that the signal handler is still connected before disconnected it:

	--  if (g_signal_handler_is_connected (instance, id))
	--    g_signal_handler_disconnect (instance, id);

	-- instance : 	the instance to connect to.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- c_handler : 	the GCallback to connect.
	-- gobject : 	the object to pass as data to c_handler.
	-- connect_flags : 	a combination of GConnnectFlags.
	-- Returns : 	the handler id.
	-- enum GConnectFlags

	-- typedef enum
	-- {
	--   G_CONNECT_AFTER	= 1 < < 0,
	--   G_CONNECT_SWAPPED	= 1 < < 1
	-- } GConnectFlags;

	-- The connection flags are used to specify the behaviour of a signal's connection.
	-- G_CONNECT_AFTER 	whether the handler should be called before or after the default handler of the signal.
	-- G_CONNECT_SWAPPED 	whether the instance and data should be swapped when calling the handler.

	
	-- g_signal_connect_data ()

	-- gulong      g_signal_connect_data           (gpointer instance,
	--                                              const gchar *detailed_signal,
	--                                              GCallback c_handler,
	--                                              gpointer data,
	--                                              GClosureNotify destroy_data,
	--                                              GConnectFlags connect_flags);

	-- Connects a GCallback function to a signal for a particular object. Similar to g_signal_connect(), but allows to provide a GDestroyNotify for the data which will be called when the signal handler is disconnected and no longer used. Specify connect_flags if you need ..._after() pr ..._swapped() variants of this function.
	-- instance : 	the instance to connect to.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- c_handler : 	the GCallback to connect.
	-- data : 	data to pass to c_handler calls.
	-- destroy_data : 	a GDestroyNotify for data.
	-- connect_flags : 	a combination of GConnectFlags.
	-- Returns : 	the handler id
	-- g_signal_connect_closure ()

	-- gulong      g_signal_connect_closure        (gpointer instance,
	--                                              const gchar *detailed_signal,
	--                                              GClosure *closure,
	--                                              gboolean after);

	-- Connects a closure to a signal for a particular object.
	-- instance : 	the instance to connect to.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- closure : 	the closure to connect.
	-- after : 	whether the handler should be called before or after the default handler of the signal.
	-- Returns : 	the handler id
	-- g_signal_connect_closure_by_id ()

	-- gulong      g_signal_connect_closure_by_id  (gpointer instance,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              GClosure *closure,
	--                                              gboolean after);

	-- Connects a closure to a signal for a particular object.
	-- instance : 	the instance to connect to.
	-- signal_id : 	the id of the signal.
	-- detail : 	the detail.
	-- closure : 	the closure to connect.
	-- after : 	whether the handler should be called before or after the default handler of the signal.
	-- Returns : 	the handler id
	-- g_signal_handler_block ()

	-- void        g_signal_handler_block          (gpointer instance,
	--                                              gulong handler_id);

	-- Blocks a handler of an instance so it will not be called during any signal emissions unless it is unblocked again. Thus "blocking" a signal handler means to temporarily deactive it, a signal handler has to be unblocked exactly the same amount of times it has been blocked before to become active again.

	-- The handler_id has to be a valid signal handler id, connected to a signal of instance.
	-- instance : 	The instance to block the signal handler of.
	-- handler_id : 	Handler id of the handler to be blocked.
	-- g_signal_handler_unblock ()

	-- void        g_signal_handler_unblock        (gpointer instance,
	--                                              gulong handler_id);

	-- Undoes the effect of a previous g_signal_handler_block() call. A blocked handler is skipped during signal emissions and will not be invoked, unblocking it (for exactly the amount of times it has been blocked before) reverts its "blocked" state, so the handler will be recognized by the signal system and is called upon future or currently ongoing signal emissions (since the order in which handlers are called during signal emissions is deterministic, whether the unblocked handler in question is called as part of a currently ongoing emission depends on how far that emission has proceeded yet).

	-- The handler_id has to be a valid id of a signal handler that is connected to a signal of instance and is currently blocked.
	-- instance : 	The instance to unblock the signal handler of.
	-- handler_id : 	Handler id of the handler to be unblocked.
	-- g_signal_handler_disconnect ()

	-- void        g_signal_handler_disconnect     (gpointer instance,
	--                                              gulong handler_id);

	-- Disconnects a handler from an instance so it will not be called during any future or currently ongoing emissions of the signal it has been connected to. The handler_id becomes invalid and may be reused.

	-- The handler_id has to be a valid signal handler id, connected to a signal of instance.
	-- instance : 	The instance to remove the signal handler from.
	-- handler_id : 	Handler id of the handler to be disconnected.
	-- g_signal_handler_find ()

	-- gulong      g_signal_handler_find           (gpointer instance,
	--                                              GSignalMatchType mask,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              GClosure *closure,
	--                                              gpointer func,
	--                                              gpointer data);

	-- Finds the first signal handler that matches certain selection criteria. The criteria mask is passed as an OR-ed combination of GSignalMatchType flags, and the criteria values are passed as arguments. The match mask has to be non-0 for successful matches. If no handler was found, 0 is returned.
	-- instance : 	The instance owning the signal handler to be found.
	-- mask : 	Mask indicating which of signal_id, detail, closure, func and/or data the handler has to match.
	-- signal_id : 	Signal the handler has to be connected to.
	-- detail : 	Signal detail the handler has to be connected to.
	-- closure : 	The closure the handler will invoke.
	-- func : 	The C closure callback of the handler (useless for non-C closures).
	-- data : 	The closure data of the handler's closure.
	-- Returns : 	A valid non-0 signal handler id for a successful match.
	-- g_signal_handlers_block_matched ()

	-- guint       g_signal_handlers_block_matched (gpointer instance,
	--                                              GSignalMatchType mask,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              GClosure *closure,
	--                                              gpointer func,
	--                                              gpointer data);

	-- Blocks all handlers on an instance that match a certain selection criteria. The criteria mask is passed as an OR-ed combination of GSignalMatchType flags, and the criteria values are passed as arguments. Passing at least one of the G_SIGNAL_MATCH_CLOSURE, G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA match flags is required for successful matches. If no handlers were found, 0 is returned, the number of blocked handlers otherwise.
	-- instance : 	The instance to block handlers from.
	-- mask : 	Mask indicating which of signal_id, detail, closure, func and/or data the handlers have to match.
	-- signal_id : 	Signal the handlers have to be connected to.
	-- detail : 	Signal detail the handlers have to be connected to.
	-- closure : 	The closure the handlers will invoke.
	-- func : 	The C closure callback of the handlers (useless for non-C closures).
	-- data : 	The closure data of the handlers' closures.
	-- Returns : 	The amount of handlers that got blocked.
	-- g_signal_handlers_unblock_matched ()

	-- guint       g_signal_handlers_unblock_matched
	--                                             (gpointer instance,
	--                                              GSignalMatchType mask,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              GClosure *closure,
	--                                              gpointer func,
	--                                              gpointer data);

	-- Unblocks all handlers on an instance that match a certain selection criteria. The criteria mask is passed as an OR-ed combination of GSignalMatchType flags, and the criteria values are passed as arguments. Passing at least one of the G_SIGNAL_MATCH_CLOSURE, G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA match flags is required for successful matches. If no handlers were found, 0 is returned, the number of unblocked handlers otherwise. The match criteria should not apply to any handlers that are not currently blocked.
	-- instance : 	The instance to unblock handlers from.
	-- mask : 	Mask indicating which of signal_id, detail, closure, func and/or data the handlers have to match.
	-- signal_id : 	Signal the handlers have to be connected to.
	-- detail : 	Signal detail the handlers have to be connected to.
	-- closure : 	The closure the handlers will invoke.
	-- func : 	The C closure callback of the handlers (useless for non-C closures).
	-- data : 	The closure data of the handlers' closures.
	-- Returns : 	The amount of handlers that got unblocked.
	-- g_signal_handlers_disconnect_matched ()

	-- guint       g_signal_handlers_disconnect_matched
	--                                             (gpointer instance,
	--                                              GSignalMatchType mask,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              GClosure *closure,
	--                                              gpointer func,
	--                                              gpointer data);

	-- Disconnects all handlers on an instance that match a certain selection criteria. The criteria mask is passed as an OR-ed combination of GSignalMatchType flags, and the criteria values are passed as arguments. Passing at least one of the G_SIGNAL_MATCH_CLOSURE, G_SIGNAL_MATCH_FUNC or G_SIGNAL_MATCH_DATA match flags is required for successful matches. If no handlers were found, 0 is returned, the number of disconnected handlers otherwise.
	-- instance : 	The instance to remove handlers from.
	-- mask : 	Mask indicating which of signal_id, detail, closure, func and/or data the handlers have to match.
	-- signal_id : 	Signal the handlers have to be connected to.
	-- detail : 	Signal detail the handlers have to be connected to.
	-- closure : 	The closure the handlers will invoke.
	-- func : 	The C closure callback of the handlers (useless for non-C closures).
	-- data : 	The closure data of the handlers' closures.
	-- Returns : 	The amount of handlers that got disconnected.
	-- g_signal_handler_is_connected ()

	-- gboolean    g_signal_handler_is_connected   (gpointer instance,
	--                                              gulong handler_id);

	-- Returns whether handler_id is the id of a handler connected to instance.
	-- instance : 	The instance where a signal handler is sought.
	-- handler_id : 	the handler id.
	-- Returns : 	whether handler_id identifies a handler connected to instance.
	-- g_signal_handlers_block_by_func()

	-- #define     g_signal_handlers_block_by_func(instance, func, data)

	-- Blocks all handlers on an instance that match func and data.
	-- instance : 	The instance to block handlers from.
	-- func : 	The C closure callback of the handlers (useless for non-C closures).
	-- data : 	The closure data of the handlers' closures.
	-- Returns : 	The number of handlers that got blocked.
	-- g_signal_handlers_unblock_by_func()

	-- #define     g_signal_handlers_unblock_by_func(instance, func, data)

	-- Unblocks all handlers on an instance that match func and data.
	-- instance : 	The instance to unblock handlers from.
	-- func : 	The C closure callback of the handlers (useless for non-C closures).
	-- data : 	The closure data of the handlers' closures.
	-- Returns : 	The number of handlers that got unblocked.
	-- g_signal_handlers_disconnect_by_func()

	-- #define     g_signal_handlers_disconnect_by_func(instance, func, data)

	-- Disconnects all handlers on an instance that match func and data.
	-- instance : 	The instance to remove handlers from.
	-- func : 	The C closure callback of the handlers (useless for non-C closures).
	-- data : 	The closure data of the handlers' closures.
	-- Returns : 	The number of handlers that got disconnected.
	-- g_signal_has_handler_pending ()

	-- gboolean    g_signal_has_handler_pending    (gpointer instance,
	--                                              guint signal_id,
	--                                              GQuark detail,
	--                                              gboolean may_be_blocked);

	-- Returns whether there are any handlers connected to instance for the given signal id and detail.

	-- One example of when you might use this is when the arguments to the signal are difficult to compute. A class implementor may opt to not emit the signal if no one is attached anyway, thus saving the cost of building the arguments.
	-- instance : 	the object whose signal handlers are sought.
	-- signal_id : 	the signal id.
	-- detail : 	the detail.
	-- may_be_blocked : 	whether blocked handlers should count as match.
	-- Returns : 	TRUE if a handler is connected to the signal, FALSE otherwise.
	-- g_signal_stop_emission ()

	-- void        g_signal_stop_emission          (gpointer instance,
	--                                              guint signal_id,
	--                                              GQuark detail);

	-- Stops a signal's current emission.

	-- This will prevent the default method from running, if the signal was G_SIGNAL_RUN_LAST and you connected normally (i.e. without the "after" flag).

	-- Prints a warning if used on a signal which isn't being emitted.
	-- instance : 	the object whose signal handlers you wish to stop.
	-- signal_id : 	the signal identifier, as returned by g_signal_lookup().
	-- detail : 	the detail which the signal was emitted with.
	-- g_signal_override_class_closure ()

	-- void        g_signal_override_class_closure (guint signal_id,
	--                                              GType instance_type,
	--                                              GClosure *class_closure);

	-- Overrides the class closure (i.e. the default handler) for the given signal for emissions on instances of instance_type. instance_type must be derived from the type to which the signal belongs.
	-- signal_id : 	the signal id
	-- instance_type : 	the instance type on which to override the class closure for the signal.
	-- class_closure : 	the closure.
	-- g_signal_chain_from_overridden ()

	-- void        g_signal_chain_from_overridden  (const GValue *instance_and_params,
	--                                              GValue *return_value);

	-- Calls the original class closure of a signal. This function should only be called from an overridden class closure; see g_signal_override_class_closure().
	-- instance_and_params : 	the argument list of the signal emission. The first element in the array is a GValue for the instance the signal is being emitted on. The rest are any arguments to be passed to the signal.
	-- return_value : 	Location for the return value.
	-- g_signal_add_emission_hook ()

	-- gulong      g_signal_add_emission_hook      (guint signal_id,
	--                                              GQuark detail,
	--                                              GSignalEmissionHook hook_func,
	--                                              gpointer hook_data,
	--                                              GDestroyNotify data_destroy);

	-- Adds an emission hook for a signal, which will get called for any emission of that signal, independent of the instance. This is possible only for signals which don't have G_SIGNAL_NO_HOOKS flag set.
	-- signal_id : 	the signal identifier, as returned by g_signal_lookup().
	-- detail : 	the detail on which to call the hook.
	-- hook_func : 	a GSignalEmissionHook function.
	-- hook_data : 	user data for hook_func.
	-- data_destroy : 	a GDestroyNotify for hook_data.
	-- Returns : 	the hook id, for later use with g_signal_remove_emission_hook().
	-- g_signal_remove_emission_hook ()

	-- void        g_signal_remove_emission_hook   (guint signal_id,
	--                                              gulong hook_id);

	-- Deletes an emission hook.
	-- signal_id : 	the id of the signal
	-- hook_id : 	the id of the emission hook, as returned by g_signal_add_emission_hook()
	-- g_signal_parse_name ()

	-- gboolean    g_signal_parse_name             (const gchar *detailed_signal,
	--                                              GType itype,
	--                                              guint *signal_id_p,
	--                                              GQuark *detail_p,
	--                                              gboolean force_detail_quark);

	-- Internal function to parse a signal name into its signal_id and detail quark.
	-- detailed_signal : 	a string of the form "signal-name::detail".
	-- itype : 	The interface/instance type that introduced "signal-name".
	-- signal_id_p : 	Location to store the signal id.
	-- detail_p : 	Location to store the detail quark.
	-- force_detail_quark : 	TRUE forces creation of a GQuark for the detail.
	-- Returns : 	Whether the signal name could successfully be parsed and signal_id_p and detail_p contain valid return values.
	-- g_signal_get_invocation_hint ()

	-- GSignalInvocationHint* g_signal_get_invocation_hint
	--                                             (gpointer instance);

	-- Returns the invocation hint of the innermost signal emission of instance.
	-- instance : 	the instance to query
	-- Returns : 	the invocation hint of the innermost signal emission.
	-- g_signal_type_cclosure_new ()

	-- GClosure*   g_signal_type_cclosure_new      (GType itype,
	--                                              guint struct_offset);

	-- Creates a new closure which invokes the function found at the offset struct_offset in the class structure of the interface or classed type identified by itype.
	-- itype : 	the GType identifier of an interface or classed type
	-- struct_offset : 	the offset of the member function of itype's class structure which is to be invoked by the new closure
	-- Returns : 	a new GCClosure
	-- g_signal_accumulator_true_handled ()

	-- gboolean    g_signal_accumulator_true_handled
	--                                             (GSignalInvocationHint *ihint,
	--                                              GValue *return_accu,
	--                                              const GValue *handler_return,
	--                                              gpointer dummy);

	-- A predefined GSignalAccumulator for signals that return a boolean values. The behavior that this accumulator gives is that a return of TRUE stops the signal emission: no further callbacks will be invoked, while a return of FALSE allows the emission to coninue. The idea here is that a TRUE return indicates that the callback handled the signal, and no further handling is needed.
	-- ihint : 	standard GSignalAccumulator parameter
	-- return_accu : 	standard GSignalAccumulator parameter
	-- handler_return : 	standard GSignalAccumulator parameter
	-- dummy : 	standard GSignalAccumulator parameter
	-- Returns : 	standard GSignalAccumulator result

	-- Since 2.4

	-- [11] Although signals can deal with any kind of instantiatable type, i'm referring to those types as "object types" in the following, simply because that is the context most users will encounter signals in.

end


