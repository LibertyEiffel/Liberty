class GI_INTERFACE_INFO 
	-- A GObject Introspection metadata structure representing an interface

	-- An interface (or actually, an GInterface as this library deals with
	-- GOBject) has methods, fields, properties, signals, interfaces,
	-- constants, virtual functions and prerequisites.

inherit 
	GI_CLASS redefine emit_wrapper end
	GI_REGISTERED_TYPE_INFO

insert 
	GIINTERFACEINFO_EXTERNALS
	GI_INFO_FACTORY

create{GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Wrapper
	emit_wrapper is
		do
			("GI_interface: #(1)%N" # name).print_on(std_output)
		end

	eiffel_wrapper: ABSTRACT_STRING is
		do
            -- Result could be a STRING like 
            -- create {STRING} Result.with_capacity(2048) 
            -- Or we could just issue Result:="" and let string manage all the additions.
            -- Actually since most -- it would be interesting to benchmark it
            Result := once "deferred class " 
            | class_name
            | once "%N -- Wrapper for " | name 
            | once "%N -- Automatically made by Liberty Eiffel Generator of GObject Wrappers%N"
            | prerequisites_wrapper 
            | properties_wrapper
            | methods_wrapper
            | signals_wrapper
            | virtual_functions_wrapper
            | constants_wrapper
            | once "end -- class " | class_name
		end

    suffix: STRING is "_INTERFACE"

    prerequisites_wrapper: STRING 
    local pi: PREREQUISITES_ITERATOR
    do
        -- Any GObject prerequisite is turned into a proper parent-heir relation in Eiffel
        Result := once "inherit %N"
        from pi:=prerequisites_iter; pi.start until pi.is_off loop
            Result.append(once "%T")
            Result.append(pi.item.class_name) 
            pi.next
        end
        Result.append(once "%N")
    end

    properties_wrapper: STRING 
    local a_partial_result: STRING -- In order to ease some pressure from the compiler a differently named reference to the accumulator result of this query is passed to the agent.
    do
        a_partial_result := once "feature {ANY} -- Properties"
        properties_iter.for_each (agent (a_property: GI_PROPERTY_INFO) do
            a_partial_result.append(a_property.eiffel_wrapper)
        end)
        Result := a_partial_result
        -- could also be implemented like:
        -- from pi:=properties_iter; pi.start until pi.is_off loop
        --  Result.append(pi.item.eiffel_wrapper)
        --  pi.next
        -- end
            
    end

    methods_wrapper: STRING 
    do
        Result := once "feature {ANY} -- Methods"
    end

    signals_wrapper: STRING 
    do
        Result := once "feature {ANY} -- Signals"
    end

    virtual_functions_wrapper: STRING 
    do
        Result := once "feature {ANY} -- Deferred features (virtual functions)"
    end

    constants_wrapper: STRING 
    do
        Result := once "feature {ANY} -- Constants"
    end

feature {ANY} -- Interface prerequisites
	prerequisites_lower: INTEGER is 0
	prerequisites_upper: INTEGER is do Result:=prerequisites_count-1 end

	prerequisites_count: INTEGER is
		-- The number of prerequisites for this interface type. A prerequisites
		-- is another interface that needs to be implemented for interface,
		-- similar to an base class for GObjects. 

		-- The Eiffel programmer when reads these things smiles: oh poor C
		-- programmers they don't know multiple, repeated inheritance can be
		-- done and be doe usefully....

		do
			Result := g_interface_info_get_n_prerequisites(handle)
		ensure positive: Result >=0
		end

	prerequisite (i: INTEGER): GI_BASE_INFO is
		-- The interface type prerequisites at index `i'.
	require valid_index: i.in_range(prerequisites_lower,prerequisites_upper)
	do
		Result := wrapper(g_interface_info_get_prerequisite( handle,i))
		-- g_interface_info_get_prerequisite Returns : the prerequisites as a
		-- GIBaseInfo. Free the struct by calling g_base_info_unref() when
		-- done. [transfer full]
	ensure Result /=Void
	end

	prerequisites_iter: PREREQUISITES_ITERATOR is
		do
			Result.from_interface(Current)
		end

feature {ANY} -- Properties
	properties_count: INTEGER is
		-- the number of properties that this interface type has. 
	do
		Result := g_interface_info_get_n_properties(handle)
	end
  
	property (i: INTEGER): GI_PROPERTY_INFO is
		-- the interface type property at index `i'. 
	do
		create Result.from_external_pointer(g_interface_info_get_property(handle,i))
		-- g_interface_info_get_property Returns : the GIPropertyInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end
   
feature {ANY} -- Methods
	methods_count: INTEGER is
		-- the number of methods that this interface type has.
		do
			Result := g_interface_info_get_n_methods(handle)
		end

	method (n: INTEGER): GI_FUNCTION_INFO is
		-- the interface type method at index `n'.
	do
		create Result.from_external_pointer(g_interface_info_get_method(handle,n)) 
		-- g_interface_info_get_method  Returns : the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

	find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO is
		-- The method of the interface type with `a_name'. Void if there's no method available with that name.
	local res: POINTER
	do
		res := g_interface_info_find_method(handle, a_name.to_external) 
		if res.is_not_null then 
			create Result.from_external_pointer(res)
			-- g_interface_info_find_method Returns : the GIFunctionInfo or
			-- NULL if none found. Free the struct by calling
			-- g_base_info_unref() when done. [transfer
		end 
	end
   
feature {ANY} -- Signals
	signals_count: INTEGER is
		-- the number of signals that this interface type has.
		do
			Result := g_interface_info_get_n_signals(handle)
		end

	signal (n: INTEGER): GI_SIGNAL_INFO is
		-- The an interface type signal at index n.
	do
		create Result.from_external_pointer(g_interface_info_get_signal(handle,n))
	end

	find_signal (a_name: ABSTRACT_STRING): GI_SIGNAL_INFO is
		-- The information for the signal with `a_name'. Void if no such a signal exists.
	local res: POINTER
	do
		res := g_interface_info_find_signal(handle,a_name.to_external)
		if res.is_not_null then
			create Result.from_external_pointer(res)
		end
	end

feature {ANY} -- Virtual functions 
	virtual_functions_count: INTEGER is 
		-- the number of virtual functions that this interface type has. 
	do
		Result := g_interface_info_get_n_vfuncs(handle)
	end

	virtual_function (n: INTEGER): GI_VFUNC_INFO is
		-- The interface type virtual function at index `n'.
	do
		create Result.from_external_pointer(g_interface_info_get_vfunc(handle,n)) --Note: ownership fully transferred
	end

	find_virtual_function (a_name: ABSTRACT_STRING): GI_VFUNC_INFO is
		-- The virtual function with `a_name'. Void if such a functon does not exist.
	local res: POINTER
	do
		res := g_interface_info_find_vfunc(handle,a_name.to_external) -- Note: ownership fully transferred
		if res.is_not_null then
			create Result.from_external_pointer(res)
		end 
	end

feature {ANY} -- Constants
	constants_count: INTEGER is
		-- the number of constants that this interface type has.
	do
		Result := g_interface_info_get_n_constants(handle)
	end

	constant (n: INTEGER): GI_CONSTANT_INFO is
		-- The interface type constant at index n.
	do
		create Result.from_external_pointer(g_interface_info_get_constant(handle,n)) -- Note: ownership fully transferred
	end

-- TODO: if necessary or useful  g_interface_info_get_iface_struct ()
-- 
--  GIStructInfo *      g_interface_info_get_iface_struct   (GIInterfaceInfo *info);
-- 
--    Returns the layout C structure associated with this GInterface.
-- 
--    info :    a GIInterfaceInfo
--    Returns : the GIStructInfo or NULL. Free it with g_base_info_unref() when done. [transfer full]
end 

-- Copyright (C) 2013-2022: , 2016 Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
