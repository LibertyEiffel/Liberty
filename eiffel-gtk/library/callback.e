indexing
	description: "Callback or an object representing a function that can be called"

deferred class CALLBACK
inherit WRAPPER
insert G_SIGNAL_EXTERNAL
feature
	dispose is
		do
			object := Void
		end
feature
	function (an_object,some_data: POINTER): INTEGER is deferred end
	object: G_OBJECT
			-- The object the callback will operate on
	
	connect (an_object: G_OBJECT;
				a_signal_name: STRING;
				a_function_pointer: POINTER) is
			-- Connects `a function' callback to a signal named
			-- `a_signal_name' for `an_object' (i.e. when `an_object'
			-- emits `a_signal_name' `a_function_pointer' will be called)
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
			print ("connect("+an_object.to_pointer.to_string+
					 ", `"+a_signal_name+"', "+
					 a_function_pointer.to_string+")%N")
		end

end
	
