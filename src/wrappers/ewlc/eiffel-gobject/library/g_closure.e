note
	description: "	Closures - Functions as first-class objects."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_CLOSURE
	-- A GClosure represents a callback supplied by the programmer. It
	-- will generally comprise a function of some kind and a marshaller
	-- used to call it. It is the reponsibility of the marshaller to
	-- convert the arguments for the invocation from GValues into a
	-- suitable form, perform the callback on the converted arguments,
	-- and transform the return value back into a GValue.

	-- In the case of C programs, a closure usually just holds a
	-- pointer to a function and maybe a data argument, and the
	-- marshaller converts between GValue and native C types. The
	-- GObject library provides the GCClosure type for this
	-- purpose. Bindings for other languages need marshallers which
	-- convert between GValues and suitable representations in the
	-- runtime of the language in order to use functions written in
	-- that languages as callbacks.

	-- Within GObject, closures play an important role in the
	-- implementation of signals. When a signal is registered, the
	-- c_marshaller argument to g_signal_new() specifies the default C
	-- marshaller for any closure which is connected to this
	-- signal. GObject provides a number of C marshallers for this
	-- purpose, see the g_cclosure_marshal_*() functions. Additional C
	-- marshallers can be generated with the glib-genmarshal
	-- utility. Closures can be explicitly connected to signals with
	-- g_signal_connect_closure(), but it usually more convenient to
	-- let GObject create a closure automatically by using one of the
	-- g_signal_connect_*() functions which take a callback
	-- function/user data pair.
			
	-- Using closures has a number of important advantages over a
	-- simple callback function/data pointer combination:
			
	-- o Closures allow the callee to get the types of the callback
	--   parameters, which means that language bindings don't have to
	--   write individual glue for each callback type.
			
	-- o The reference counting of GClosure makes it easy to handle
	--   reentrancy right; if a callback is removed while it is being
	--   invoked, the closure and it's parameters won't be freed until
	--   the invocation finishes.
	
	-- o g_closure_invalidate() and invalidation notifiers allow
	--   callbacks to be automatically removed when the objects they
	--   point to go away.

inherit
	C_STRUCT

feature {ANY} -- Callback pointer
	callback_pointer: POINTER
					-- The address of the actual Eiffel callback feature
			-- `function'. Even if the body of this feature is common to
			-- all heirs it must be nevertheless made deferred. The
			-- actual body is:

			-- callback_pointer: POINTER is
			--   do
			--     Result := get_callback_pointer ($callback)
			--   ensure Result.is_not_null
			--   end

			-- But callback coulnd't be declared here because it must
			-- follow the actual signature of the corresponding C signal
			-- callback feature. So even this feature must be deferred.
		deferred 
		end
	
	object: G_OBJECT

feature {ANY} -- Creation
	link_to (an_object: like object)
			-- Creates a new closure which invokes 'callback'
			
			-- TODO: add destroy_notify callback support
		require valid_object: an_object /= Void
		do
			debug
				print (generating_type) print(".connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
			-- Note: the following implementation will make the C
			-- GClosure to call Eiffel's `callback' feature of
			-- `Current'. We pass the address of callback and of Current,
			-- which no destroy_callback since the user_data, which is
			-- actually a pointer to Current is handled by the Eiffel
			-- garbage collector.
			object := an_object
			handle := g_cclosure_new_swap (callback_pointer,
											 $object, -- as user_data
											 default_pointer -- i.e.: NULL as destroy callback
											 )
			-- g_cclosure_new_swap creates a new closure which invokes
			-- callback_func with user_data with user_data as the first
			-- parameter. Note: this exchange is necessary to allow us to
			-- directly call Eiffel features, which *require* the address
			-- of Current as the first parameter. Paolo 2006-04-12
			
			-- This is needed to avoid long term GC bugs. The ref is required
			-- To notify that we have an owned reference to the closure.
			-- The sink is to remove the default unowned reference
			-- ** trixx, 20060721
			ref
			sink
			
			-- see also g_cclosure_new that creates a new closure which
			-- invokes callback_func with user_data with user_data as the
			-- last parameter.
			
			-- 	callback_func : the function to invoke 
			-- 	user_data : user data to pass to callback_func 
			-- 	destroy_data : destroy notify to be called when user_data is no longer used 
			-- 	Returns : a new GCClosure 			
		end


	--  g_cclosure_new_object ()
	
	--  GClosure* g_cclosure_new_object (callback_func: POINTER,
	--  an_object: POINTER);
	
	-- A variant of g_cclosure_new() which uses object as user_data and
	-- calls g_object_watch_closure() on object and the created
	-- closure. This function is useful when you have a callback
	-- closely associated with a GObject, and want the callback to no
	-- longer run after the object is is freed.
	
	-- callback_func : the function to invoke object : a GObject
	-- pointer to pass to callback_func Returns : a new GCClosure

	--  g_cclosure_new_object_swap ()
	
	-- GClosure* g_cclosure_new_object_swap (callback_func: POINTER,
	-- an_object: POINTER);
	
	-- A variant of g_cclosure_new_swap() which uses object as
	-- user_data and calls g_object_watch_closure() on object and the
	-- created closure. This function is useful when you have a
	-- callback closely associated with a -- GObject, and want the
	-- callback to no longer run after the object is is freed.
	
	-- callback_func : the function to invoke object : a GObject
	-- pointer to pass to callback_func Returns : a new GCClosure

	--  g_closure_new_object ()
	
	--  GClosure* g_closure_new_object (guint sizeof_closure, an_object: POINTER);
	
	-- 	A variant of g_closure_new_simple() which stores object in the data field of the closure and calls
	-- 	g_object_watch_closure() on object and the created closure. This function is mainly useful when implementing
	-- 	new types of closures.
	
	-- 	sizeof_closure : the size of the structure to allocate, must be at least sizeof (GClosure) 
	-- 	object : a GObject pointer to store in the data field of the newly allocated GClosure 
	-- 	Returns : a newly allocated GClosure 
	
	-- 	--------------------------------------------------------------------------------------------------------
	
feature {ANY} -- Reference counting and memory handling
	ref
		local ptr: POINTER
		do
			ptr := g_closure_ref (handle)
			-- g_closure_ref returns the closure passed in, for
			-- convenience
		end

	unref
			-- Decrements the reference count of a closure after it was
			-- previously incremented by the same caller. If no other
			-- callers are using the closure, then the closure will be
			-- destroyed and freed.
		do
			g_closure_unref (handle)
		end

	sink
			-- Takes over the initial ownership of a closure. Each
			-- closure is initially created in afloating state, which
			-- means that the initial reference count is not owned by any
			-- caller. 'sink' checks to see if the object is still
			-- floating, and if so, unsets the floating state and
			-- decreases the reference count

			-- TODO: Eiffelize the rest of the documentation of this
			-- feature which include a C example. Paolo 2006-04-12
		do
			g_closure_sink (handle)
			-- 	Takes over the initial ownership of a closure. Each
			-- 	closure is initially created in afloating state, which
			-- 	means that the initial reference count is not owned by
			-- 	any caller. g_closure_sink() checks to see if the
			-- 	object is still floating, and if so, unsets the
			-- 	floating state and decreases the reference count. If
			-- 	the closure is not floating, g_closure_sink() does
			-- 	nothing. The reason for the existance of the floating
			-- 	state -- is to prevent cumbersome code sequences like:

			--  closure = g_cclosure_new (cb_func, cb_data);
			--  g_source_set_closure (source, closure);
			--  g_closure_unref (closure); /* XXX GObject doesn't really need this */

			-- 	Because g_source_set_closure() (and similar functions)
			-- 	take ownership of the initial reference count, if it --
			-- 	is unowned, we instead can write:

			--  g_source_set_closure (source, g_cclosure_new (cb_func, cb_data));

			-- 	Generally, this function is used together with
			-- 	g_closure_ref(). Ane example of storing a closure for
			-- 	later -- notification looks like:

			--  static GClosure *notify_closure = NULL;
			--  void
			--  foo_notify_set_closure (a_closure: POINTER)
			--  {
			-- 	if (notify_closure)
			-- 	g_closure_unref (notify_closure);
			-- 	notify_closure = closure;
			-- 	if (notify_closure)
			-- 	{
			-- 		 g_closure_ref (notify_closure);
			-- 		 g_closure_sink (notify_closure);
			-- 	}
			--  }
			
			-- 	Because g_closure_sink() may decrement the reference count of a closure (if it hasn't been called on closure
			-- 	yet) just like g_closure_unref(), g_closure_ref() should be called prior to this function.

			-- 	closure : GClosure to decrement the initial reference count on, if it's still being held 
		end

	dispose
		do
			-- Note: memory handling is done by gobject
			unref
			handle:=default_pointer
		end

feature {ANY} -- Invoking

	invoke (some_parameters: G_VALUE_ARRAY): G_VALUE
			-- Invokes the closure, i.e. executes the callback
			-- represented by the closure.

			-- Heirs of G_CLOSURE which will implements callback for more
			-- specific closures. Note: the previous could be wrong. 
			-- Paolo 2006-04-26
		require valid_parameters: some_parameters /= Void
		do
			create Result.make 
			g_closure_invoke (handle, Result.handle,
									some_parameters.count, some_parameters.to_external,
									default_pointer -- invocation_hint : a context-dependent invocation hint
									)
			-- closure : a GClosure return_value : a GValue to store the
			-- return value. May be NULL if the callback of closure
			-- doesn't return a value.  n_param_values : the length of
			-- the param_values array param_values : an array of GValues
			-- holding the arguments on which to invoke the callback of
			-- closure --

		end


-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_invalidate ()

--  void g_closure_invalidate (a_closure: POINTER);

-- 	Sets a flag on the closure to indicate that it's calling environment has become invalid, and thus causes any
-- 	future invocations of g_closure_invoke() on this closure to be ignored. Also, invalidation notifiers
-- 	installed on the closure will be called at this point. Note that unless you are holding a reference to the
-- 	closure yourself, the invalidation notifiers may unref the closure and cause it to be destroyed, so if you
-- 	need to access the closure after calling g_closure_invalidate(), make sure that you've previously called
-- 	g_closure_ref().

-- 	Note that g_closure_invalidate() will also be called when the reference count of a closure drops to zero
-- 	(unless it has already been invalidated before).

-- 	closure : GClosure to invalidate 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_add_finalize_notifier ()

--  void g_closure_add_finalize_notifier (a_closure: POINTER, notify_data: POINTER, notify_func: POINTER);

-- 	Registers a finalization notifier which will be called when the reference count of closure goes down to 0.
-- 	Multiple finalization notifiers on a single closure are invoked in unspecified order. If a single call to
-- 	g_closure_unref() results in the closure being both invalidated and finalized, then the invalidate notifiers
-- 	will be run before the finalize notifiers.

-- 	closure : a GClosure 
-- 	notify_data : data to pass to notify_func 
-- 	notify_func : the callback function to register 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_add_invalidate_notifier ()

--  void g_closure_add_invalidate_notifier
-- 															(a_closure: POINTER, notify_data: POINTER, notify_func: POINTER);

-- 	Registers an invalidation notifier which will be called when the closure is invalidated with
-- 	g_closure_invalidate(). Invalidation notifiers are invoked before finalization notifiers, in an unspecified
-- 	order.

-- 	closure : a GClosure 
-- 	notify_data : data to pass to notify_func 
-- 	notify_func : the callback function to register 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_remove_finalize_notifier ()

--  void g_closure_remove_finalize_notifier
-- 															(a_closure: POINTER, notify_data: POINTER, notify_func: POINTER);

-- 	Removes a finalization notifier. Notifiers are automatically removed after they are run.

-- 	closure : a GClosure 
-- 	notify_data : data which was passed to g_closure_add_finalize_notifier() when registering notify_func 
-- 	notify_func : the callback function to remove 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_remove_invalidate_notifier ()

--  void g_closure_remove_invalidate_notifier
-- 															(a_closure: POINTER, notify_data: POINTER, notify_func: POINTER);

-- 	Removes a invalidation notifier. Notifiers are automatically removed after they are run.

-- 	closure : a GClosure 
-- 	notify_data : data which was passed to g_closure_add_invalidate_notifier() when registering notify_func 
-- 	notify_func : the callback function to remove 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_new_simple ()

--  GClosure* g_closure_new_simple (guint sizeof_closure, data: POINTER);

-- 	Allocates a struct of the given size and initializes the initial part as a GClosure. This function is mainly
-- 	useful when implementing new types of closures.

--  typedef struct _MyClosure MyClosure;
--  struct _MyClosure
--  {
-- 	GClosure closure;
-- 	/* extra data goes here */
--  };
	

--  static void
--  my_closure_finalize (notify_data: POINTER, a_closure: POINTER)
--  {
-- 	MyClosure *my_closure = (MyClosure *)closure;

-- 	/* free extra data here */
--  }

--  MyClosure *my_closure_new (data: POINTER)
--  {
-- 	a_closure: POINTER;
-- 	MyClosure *my_closure;
 
-- 	closure = g_closure_new_simple (sizeof (MyClosure), data);
-- 	my_closure = (MyClosure *) closure;

-- 	/ initialize extra data here */

-- 	g_closure_add_finalize_notifier (closure, notify_data, my_closure_finalize);
-- 	return my_closure;
--  }

-- 	sizeof_closure : the size of the structure to allocate, must be at least sizeof (GClosure) 
-- 	data : data to store in the data field of the newly allocated GClosure 
-- 	Returns : a newly allocated GClosure 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_set_marshal ()

--  void g_closure_set_marshal (a_closure: POINTER, GClosureMarshal marshal);

-- 	Sets the marshaller of closure. The marshal_data provides a way for a meta marshaller to provide additional
-- 	information to the marshaller. (See g_closure_set_meta_marshal().) For GObject's C predefined marshallers
-- 	(the g_cclosure_marshal_*() functions), what it provides is a callback function to use instead of
-- 	closure->callback.

-- 	closure : a GClosure 
-- 	marshal : a GClosureMarshal function 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_add_marshal_guards ()

--  void g_closure_add_marshal_guards (a_closure: POINTER, pre_marshal_data: POINTER, pre_marshal_notify: POINTER, post_marshal_data: POINTER, post_marshal_notify: POINTER);

-- 	Adds a pair of notifiers which get invoked before and after the closure callback, respectively. This is
-- 	typically used to protect the extra arguments for the duration of the callback. See g_object_watch_closure()
-- 	for an example of marshal guards.

-- 	closure : a GClosure 
-- 	pre_marshal_data : data to pass to pre_marshal_notify 
-- 	pre_marshal_notify : a function to call before the closure callback 
-- 	post_marshal_data : data to pass to post_marshal_notify 
-- 	post_marshal_notify : a function to call after the closure callback 

-- 	--------------------------------------------------------------------------------------------------------

--  g_closure_set_meta_marshal ()

--  void g_closure_set_meta_marshal (a_closure: POINTER, marshal_data: POINTER, GClosureMarshal meta_marshal);

-- 	Sets the meta marshaller of closure. A meta marshaller wraps closure->marshal and modifies the way it is
-- 	called in some fashion. The most common use of this facility is for C callbacks. The same marshallers
-- 	(generated by glib-genmarshal) are used everywhere, but the way that we get the callback function differs.
-- 	In most cases we want to use closure->callback, but in other cases we want to use use some different
-- 	technique to retrieve the callbakc function.

-- 	For example, class closures for signals (see g_signal_type_cclosure_new()) retrieve the callback function
-- 	from a fixed offset in the class structure. The meta marshaller retrieves the right callback and passes it
-- 	to the marshaller as the marshal_data argument.

-- 	closure : a GClosure 
-- 	marshal_data : context-depend
-- 	ent data to pass to meta_marshal 
-- 	meta_marshal : a GClosureMarshal function 

-- 	--------------------------------------------------------------------------------------------------------

--  g_source_set_closure ()

--  void g_source_set_closure (GSource *source, a_closure: POINTER);

-- 	Set the callback for a source as a GClosure.

-- 	If the source is not one of the standard GLib types, the closure_callback and closure_marshal fields of the
-- 	GSourceFuncs structure must have been filled in with pointers to appropriate functions.

-- 	source : the source 
-- 	closure : a GClosure 

-- 	--------------------------------------------------------------------------------------------------------

--  G_TYPE_IO_CHANNEL

--  #define G_TYPE_IO_CHANNEL (g_io_channel_get_type ())

-- 	The GType for GIOChannel.

-- 	--------------------------------------------------------------------------------------------------------

--  G_TYPE_IO_CONDITION

--  #define G_TYPE_IO_CONDITION (g_io_condition_get_type ())

-- 	The GType for GIOCondition.

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__VOID ()

--  void g_cclosure_marshal_VOID__VOID (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gpointer
-- 	user_data).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 1 
-- 	param_values : a GValue array holding only the instance 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__BOOLEAN ()

--  void g_cclosure_marshal_VOID__BOOLEAN
-- 															(a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gboolean arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gboolean parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__CHAR ()

--  void g_cclosure_marshal_VOID__CHAR (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gchar arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gchar parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__UCHAR ()

--  void g_cclosure_marshal_VOID__UCHAR (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, guchar arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the guchar parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__INT ()

--  void g_cclosure_marshal_VOID__INT (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gint arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gint parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__UINT ()

--  void g_cclosure_marshal_VOID__UINT (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, guint arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the guint parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__LONG ()

--  void g_cclosure_marshal_VOID__LONG (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, glong arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the glong parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__ULONG ()

--  void g_cclosure_marshal_VOID__ULONG (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gulong arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gulong parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__ENUM ()

--  void g_cclosure_marshal_VOID__ENUM (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gint arg1, user_data: POINTER) where the gint parameter denotes an enumeration type..

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the enumeration parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__FLAGS ()

--  void g_cclosure_marshal_VOID__FLAGS (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gint arg1, user_data: POINTER) where the gint parameter denotes a flags type denotes a flags type.

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the flags parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__FLOAT ()

--  void g_cclosure_marshal_VOID__FLOAT (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gfloat arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gfloat parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__DOUBLE ()

--  void g_cclosure_marshal_VOID__DOUBLE (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, gdouble arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gdouble parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__STRING ()

--  void g_cclosure_marshal_VOID__STRING (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, const gchar *arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the gchar* parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__PARAM ()

--  void g_cclosure_marshal_VOID__PARAM (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, GParamSpec *arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the GParamSpec* parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__BOXED ()

--  void g_cclosure_marshal_VOID__BOXED (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, GBoxed *arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the GBoxed* parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__POINTER ()

--  void g_cclosure_marshal_VOID__POINTER
-- 															(a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, arg: POINTER1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the parameter: POINTER 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__OBJECT ()

--  void g_cclosure_marshal_VOID__OBJECT (a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, GOBject *arg1, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding the instance and the GObject* parameter 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_STRING__OBJECT_POINTER ()

--  void g_cclosure_marshal_STRING__OBJECT_POINTER
-- 															(a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, GObject *arg1, arg: POINTER2, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 3 
-- 	param_values : a GValue array holding instance, arg1 and arg2 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_VOID__UINT_POINTER ()

--  void g_cclosure_marshal_VOID__UINT_POINTER
-- 															(a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type void (*callback) (instance: POINTER, guint arg1, arg: POINTER2, user_data: POINTER).

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : ignored 
-- 	n_param_values : 3 
-- 	param_values : a GValue array holding instance, arg1 and arg2 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_BOOLEAN__FLAGS ()

--  void g_cclosure_marshal_BOOLEAN__FLAGS
-- 															(a_closure: POINTER, GValue *return_value, guint n_param_values, const GValue *param_values, invocation_hint: POINTER, marshal_data: POINTER);

-- 	A marshaller for a GCClosure with a callback of type gboolean (*callback) (instance: POINTER, gint arg1, user_data: POINTER) where the gint parameter denotes a flags type.

-- 	closure : the GClosure to which the marshaller belongs 
-- 	return_value : a GValue which can store the returned gboolean 
-- 	n_param_values : 2 
-- 	param_values : a GValue array holding instance and arg1 
-- 	invocation_hint : the invocation hint given as the the last argument to g_closure_invoke() 
-- 	marshal_data : additional data specified when registering the marshaller 

-- 	--------------------------------------------------------------------------------------------------------

--  g_cclosure_marshal_BOOL__FLAGS

--  #define g_cclosure_marshal_BOOL__FLAGS

-- 	Another name for g_cclosure_marshal_BOOLEAN__FLAGS().
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib-object.h>"
		alias "sizeof(GCLosure)"
		end

feature {} -- Externals

	g_closure_needs_marshal (a_closure: POINTER): INTEGER
			-- Returns TRUE if a GClosureMarshal marshaller has not yet been
			-- set on closure. See g_closure_set_marshal().
		external "C macro use <glib-object.h>"
		alias "G_CLOSURE_NEEDS_MARSHAL (*($a_closure))"
		end
	
	g_closure_n_notifiers (a_closure: POINTER): INTEGER
			-- Returns the total number of notifiers connected with the
			-- closure cl. The count includes the meta marshaller, the
			-- finalize and invalidate notifiers and the marshal
			-- guards. Note that each guard counts as two notifiers. See
			-- g_closure_set_meta_marshal,
			-- g_closure_add_finalize_notifier,
			-- g_closure_add_invalidate_notifier and
			-- g_closure_add_marshal_guards.
		external "C macro use <glib-object.h>"
		alias "G_CLOSURE_N_NOTIFIERS"
		end

	g_cclosure_swap_data (a_cclosure: POINTER): INTEGER
			-- Returns (a gboolean, i.e. an int) whether the user data of
			-- the GCClosure should be passed as the first parameter to
			-- the callback. See g_cclosure_new_swap.

		external "C macro use <glib-object.h>"
		alias "G_CCLOSURE_SWAP_DATA"
		end
	
	-- void (*GCallback) (void);

	-- The type used for callback functions in structure definitions
	-- and function signatures. This doesn't mean that all callback
	-- functions must take no parameters and return void. The required
	-- signature of a callback function is determined by the context in
	-- which is used (e.g. the signal to which it is connected). Use
	-- G_CALLBACK() to cast the callback function to a GCallback.

	g_type_closure: INTEGER
			-- The GType for GClosure.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_CLOSURE"
		end
	
	--void (*GClosureMarshal) (GClosure *closure, GValue *return_value,
	--guint n_param_values, const GValue *param_values, gpointer
	--invocation_hint, gpointer marshal_data);

	--void (*GClosureNotify) (gpointer data, GClosure *closure);
	
	g_cclosure_new (callback_func, user_data, destroy_data: POINTER): POINTER is -- GClosure
		external "C use <glib-object.h>"
		end
	
	g_cclosure_new_swap (callback_func, user_data, destroy_data: POINTER): POINTER is -- GClosure
		external "C use <glib-object.h>"
		end
	
	g_cclosure_new_object (callback_func, an_object: POINTER): POINTER is -- GClosure
		external "C use <glib-object.h>"
		end
	
	g_cclosure_new_object_swap (callback_func, an_object: POINTER): POINTER is -- GClosure
		external "C use <glib-object.h>"
		end

	g_closure_new_object (sizeof_closure: INTEGER; an_object: POINTER): POINTER is -- GClosure
		-- Note: sizeof_closure is a guint/NATURAL
		external "C use <glib-object.h>"
		end

	g_closure_ref (a_closure: POINTER): POINTER is -- GClosure
		external "C use <glib-object.h>"
		end
	
	g_closure_sink (a_closure: POINTER)
		external "C use <glib-object.h>"
		end

	g_closure_unref (a_closure: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_invoke (a_closure, a_return_value: POINTER; n_param_values: INTEGER; const_gvalue_param_values, invocation_hint: POINTER)
		 -- Note: n_param_values is guint, i.e. a NATURAL
		external "C use <glib-object.h>"
		end
	
	g_closure_invalidate (a_closure: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_add_finalize_notifier (a_closure, notify_data, notify_func: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_add_invalidate_notifier (a_closure, notify_data, notify_func: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_remove_finalize_notifier (a_closure, notify_data, notify_func: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_remove_invalidate_notifier (a_closure, notify_data, notify_func: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_new_simple (sizeof_closure: INTEGER; data: POINTER): POINTER is -- GClosure
		-- Note sizeof_closure is a guint/NATURAL
		external "C use <glib-object.h>"
		end
	
	g_closure_set_marshal (a_closure, a_marshal: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_add_marshal_guards (a_closure, pre_marshal_data, pre_marshal_notify, post_marshal_data, post_marshal_notify: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_closure_set_meta_marshal (a_closure, marshal_data, meta_marshal: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_source_set_closure (a_gsource, a_closure: POINTER)
		external "C use <glib-object.h>"
		end
	
	g_type_io_channel
		external "C macro use <glib-object.h>"
		alias "G_TYPE_IO_CHANNEL"
		end

	g_type_io_condition
		external "C macro use <glib-object.h>"
		alias "G_TYPE_IO_CONDITION"
		end
	

	g_cclosure_marshal_void__void (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											 const_gvalue_param_values, invocation_hint, marshal_data: POINTER)
		-- Note: n_param_values is a guint/NATURAL
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__VOID"
		end
	
	g_cclosure_marshal_void__boolean	(a_closure, a_return_value: POINTER; n_param_values: INTEGER;
												 const_gvalue_param_values, invocation_hint, marshal_data: POINTER)
		-- Note: n_param_values is a guint/NATURAL
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__BOOLEAN"
		end
	
	g_cclosure_marshal_void__char (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											 const_gvalue_param_values, invocation_hint, marshal_data: POINTER)
		-- Note: n_param_values is a guint/NATURAL
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__CHAR"
		end

	g_cclosure_marshal_void__uchar (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											  const_gvalue_param_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__UCHAR"
		end
	
	g_cclosure_marshal_void__int (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__INT"
		end
	
	g_cclosure_marshal_void__uint (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											 const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__UINT"
		end
	
	g_cclosure_marshal_void__long (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											 const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__LONG"
		end
	
	g_cclosure_marshal_void__ulong (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											  const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__ULONG"
		end

	g_cclosure_marshal_void__enum (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											 const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__ENUM"
		end

	g_cclosure_marshal_void__flags (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											  const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__FLAGS"
		end

	g_cclosure_marshal_void__float (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											  const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__FLOAT"
		end

	g_cclosure_marshal_void__double (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
												const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__DOUBLE"
		end

	g_cclosure_marshal_void__string (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
												const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__STRING"
		end

	g_cclosure_marshal_void__param (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											  const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__PARAM"
		end
	
	g_cclosure_marshal_void__boxed (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
											  const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__BOXED"
		end

	g_cclosure_marshal_void__pointer	(a_closure, a_return_value: POINTER; n_param_values: INTEGER;
												 const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__POINTER"
		end
	
	g_cclosure_marshal_void__object (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
												const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__OBJECT"
		end
	
	g_cclosure_marshal_string__object_pointer (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
															 const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_STRING__OBJECT_POINTER"
		end
	
	g_cclosure_marshal_void__uint_pointer (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
														const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_VOID__UINT_POINTER"
		end

	g_cclosure_marshal_boolean__flags (a_closure, a_return_value: POINTER; n_param_values: INTEGER;
												  const_gvalueparam_values, invocation_hint, marshal_data: POINTER)
		external "C use <glib-object.h>"
		alias "g_cclosure_marshal_BOOLEAN__FLAGS"
		end


feature {}-- GClosure struct 
	-- typedef struct { volatile guint in_marshal : 1; volatile guint
	-- is_invalid : 1; } GClosure;

	-- A GClosure represents a callback supplied by the programmer.

	-- volatile guint in_marshal : 1; Indicates whether the closure is
	-- currently being invoked with g_closure_invoke()
	
	-- volatile guint is_invalid : 1; Indicates whether the closure has
	-- been invalidated by g_closure_invalidate()
	
	get_gstruct_in_marshal (a_gclosure: POINTER): INTEGER
		external "C struct get in_marshal use <glib-object.h>"
		end
	
	get_gstruct_is_invalid (a_gclosure: POINTER): INTEGER
		external "C struct get is_invalid use <glib-object.h>"
		end
	
feature {ANY} -- GCClosure struct
	-- typedef struct { GClosure closure; callback: POINTER; }
	-- GCClosure;
	
	-- A GCClosure is a specialization of GClosure for C function
	-- callbacks.
	
	-- GClosure closure; the GClosure 
	-- callback: POINTER; the callback function 

	--  GClosureMarshal ()

	--  void (*GClosureMarshal) (a_closure: POINTER, GValue
	--  *return_value, guint n_param_values, const GValue
	--  *param_values, invocation_hint: POINTER, marshal_data:
	--  POINTER);

	-- The type used for marshaller functions.
	
	-- closure : the GClosure to which the marshaller belongs

	-- return_value : a GValue to store the return value. May be NULL
	-- if the callback of closure doesn't return -- a value.

	-- n_param_values : the length of the param_values array

	-- param_values : an array of GValues holding the arguments on
	-- which to invoke the callback of closure

	-- invocation_hint : the invocation hint given as the the last
	-- argument to g_closure_invoke()

	-- marshal_data : additional data specified when registering the
	-- marshaller, see g_closure_set_marshal() and
	-- g_closure_set_meta_marshal()

	-- GClosureNotify ()

	-- void (*GClosureNotify) (data: POINTER, a_closure: POINTER);

	-- The type used for the various notification callbacks which can be registered on closures.

	-- data : data specified when registering the notification 
	-- callback 

	-- closure : the GClosure on which the notification is emitted
end
