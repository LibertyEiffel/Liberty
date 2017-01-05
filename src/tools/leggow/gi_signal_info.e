class GI_SIGNAL_INFO
	-- A GObject metadata object representing a signal

	-- GI_SIGNAL_INFO represents a signal. It's a sub-struct of GICallableInfo
	-- and contains a set of flags and a class closure.  See GICallableInfo for
	-- information on how to retreive arguments and other metadata from the
	-- signal.

inherit GI_CALLABLE_INFO

insert GISIGNALINFO_EXTERNALS

create{GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY}
	emit_wrapper is
		do
			("GI_CLASS: #(1)%N" # name).print_on(std_output)
		end

	eiffel_wrapper: ABSTRACT_STRING is
		do
            Result := "unimplemented wrapper for GI_SIGNAL_INFO"
		end

    suffix: STRING is "_SIGNAL"
		
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

-- Copyright (C) 2013-2017: Paolo Redaelli <paolo.redaelli@gmail.com>
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
	
