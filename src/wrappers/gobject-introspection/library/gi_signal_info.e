class GI_SIGNAL_INFO
	-- A GObject metadata object representing a signal

	-- GI_SIGNAL_INFO represents a signal. It's a sub-struct of GICallableInfo
	-- and contains a set of flags and a class closure.  See GICallableInfo for
	-- information on how to retreive arguments and other metadata from the
	-- signal.

inherit GI_CALLABLE_INFO

insert GISIGNALINFO_EXTERNALS

creation {GI_INFO_FACTORY, WRAPPER} from_external_pointer
	
feature {ANY} 
	flags: GSIGNAL_FLAGS_ENUM is
		-- the flags for this signal info.
		do
			Result.set(g_signal_info_get_flags(handle))
		end 
		
	closure: GI_VFUNC_INFO is
		-- the class closure for this signal if one is set. The class closure
		-- is a virtual function on the type that the signal belongs to. Void
		-- if the signal lacks a closure.
	local p: POINTER
	do
		p := g_signal_info_get_class_closure (handle)
		-- g_signal_info_get_class_closure returns: the class closure or NULL. [transfer full]
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end

	true_stops_emit: BOOLEAN is
		-- Will a signal's True result stop the signal emission? 
		do
			Result := g_signal_info_true_stops_emit(handle).to_boolean
		end 

end -- class GI_SIGNAL_INFO
