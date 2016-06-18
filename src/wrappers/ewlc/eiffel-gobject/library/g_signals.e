note
	description: "Utility functions dealing with g_signals"

	
deferred class G_SIGNALS
inherit
	WRAPPER_HANDLER
		undefine null_or end

insert G_SIGNAL_EXTERNALS
feature {ANY}

	query (an_id: INTEGER): G_SIGNAL_QUERY
			-- Queries the signal system for in-depth information about a
			-- specific signal. This function will fill in a
			-- user-provided structure to hold signal-specific
			-- information. If an invalid signal id is passed in, the
			-- signal_id member of the GSignalQuery is 0.

			-- `an_id': The signal id of the signal to query information
			-- for.
		do
			create Result.allocate
			-- Note: TODO: signal_id is guint therefore an_id shall be NATURAL
			g_signal_query (an_id, Result.handle)
		end
	
	lookup (a_name: STRING; a_type: INTEGER): INTEGER
			-- identifying integer of signal `a_name' emitted by objects
			-- with type number `a_type`. Emitting the signal by number
			-- is somewhat faster than using the name each time.
		
			-- Also tries the ancestors of the given type.

			-- It is 0 if no signal was found.
		do
			Result:=g_signal_lookup (a_name.to_external,a_type)
		ensure positive: Result>=0
		end


	get_signal_name (an_id: INTEGER): STRING
			-- Name of the signal with identifier equals to `an_id'. Two
			-- different signals may have the same name, if they have
			-- differing types.
		require valid_id: an_id>0
		local ptr: POINTER
		do
			ptr:=g_signal_name (an_id)
			if ptr.is_not_null
			then create Result.from_external_copy (ptr)
			else Result:=Void -- Note: Redundant, but more clear
			end
		end

	connect (an_object: G_OBJECT;
				a_signal_name: STRING;
				a_function_pointer: POINTER)
			-- Directly connect `a_function' to the signal named
			-- `a_signal_name' for `an_object' (i.e. when `an_object'
			-- emits `a_signal_name' `a_function_pointer' will be called)

			-- Note: this function must be always called in this way:
			-- connect(Current,"my-signal",$a_feature_of_current). If you
			-- need a more flexible approach you can use CALLBACKs.
		require
			valid_object: an_object /= Void
			valid_signal_name: a_signal_name /= Void
			valid_function: a_function_pointer.is_not_null
		local an_id: INTEGER
		do
			-- The handler will be called before the default handler of the signal.
			-- instance : 	the instance to connect to.
			-- detailed_signal : 	a string of the form "signal-name::detail".
			-- c_handler : 	the GCallback to connect.
			-- data : 	data to pass to c_handler calls.
			-- Returns : 	the handler id
			an_id := g_signal_connect_swapped (an_object.handle,a_signal_name.to_external,
														  a_function_pointer, an_object.to_pointer)
			-- g_signal_connect_swapped is necessary because SmartEiffel
			-- expect a pointer to an Eiffel object as first parameter of
			-- each function.
			debug 
				print ("connect("+an_object.to_pointer.to_string+
						 ", `"+a_signal_name+"', "+
						 a_function_pointer.to_string+")%N")
			end
		end

	stop_by_name (instance: G_OBJECT; name: STRING)
			-- Stops a signal's current emission.
			-- like `stop' except it will look up the signal id for you.
			-- `instance': the object whose signal handlers you wish to stop.
			-- `name': a string of the form "signal-name::detail".
		require
			instance /= Void
			name /= Void
		do
			g_signal_stop_emission_by_name (instance.handle, name.to_external)
		end

end
