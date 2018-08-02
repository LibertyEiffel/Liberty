class GI_VFUNC_INFO
	-- A GObject introspection metadata representing a virtual function

	-- A virtual function is a property belonging to either a GIObjectInfo or a
	-- GIInterfaceInfo and it is akin to an Eiffel deferred feature.

inherit 
	GI_CALLABLE_INFO

insert 
	GIVFUNCINFO_EXTERNALS

create{GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY}
	emit_wrapper is
		do
			("GI_vfunc: #(1)%N" # name).print_on(std_output)
		end

	eiffel_wrapper: ABSTRACT_STRING is
		do
		    Result := "-- GI_VFUNC_INFO.eiffel_wrapper not_yet_implemented"
		end

    suffix: STRING is "_VIRTUAL_FUNCTION"
		
feature {ANY}
	flags: GIVFUNC_INFO_FLAGS_ENUM is
		-- The flags for this virtual function info. Possible flag values are
		
		--   GI_VFUNC_MUST_CHAIN_UP     chains up to the parent type
		--   GI_VFUNC_MUST_OVERRIDE     overrides
		--   GI_VFUNC_MUST_NOT_OVERRIDE does not override
		--   GI_VFUNC_THROWS            Includes a GError
	do
		Result.set(g_vfunc_info_get_flags (handle))
	end

	offset: INTEGER is
		-- Obtain the offset of the function pointer in the class struct. The value 0xFFFF indicates that the struct offset is unknown.
	do
		Result:=g_vfunc_info_get_offset(handle)
	end 

 	signal: GI_SIGNAL_INFO is
		-- the signal for the virtual function if one is set. The signal comes
		-- from the object or interface to which this virtual function belongs.
		-- Can be Void
	local p: POINTER
	do
		p := g_vfunc_info_get_signal(handle)
		-- g_vfunc_info_get_signal returns : the signal or NULL if none set. [transfer full]
		if p.is_not_null then
			create Result.from_external_pointer(handle)
		end
	end
   
	invoker: GI_FUNCTION_INFO is
		-- The invoker method associated to Current virtual function. Can be
		-- Void as not all virtuals will have invokers.  An invoker method is a
		-- C entry  point.
	local p: POINTER
	do
		p := g_vfunc_info_get_invoker(handle)
		-- g_vfunc_info_get_invoker returns : the GIVFuncInfo or NULL. Free it with g_base_info_unref() when done. [transfer full]
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end
   
end -- class GI_VFUNC_INFO

-- Copyright (C) 2013-2018: Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
