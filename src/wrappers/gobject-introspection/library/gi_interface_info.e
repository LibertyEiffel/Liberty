class GI_INTERFACE_INFO 
	-- A GObject Introspection metadata structure representing an interface

	-- An interface (or actually, an GInterface as this library deals with
	-- GOBject) has methods, fields, properties, signals, interfaces,
	-- constants, virtual functions and prerequisites.

inherit 
	GI_REGISTERED_TYPE_INFO
	-- TODO: an interface is actually indexable over prerequisites, properties,
	-- methods, signales, virtual functions and constants.  Each of them
	-- requires renaming and redefining of pratically all the indexable
	-- interface (lower, upper, valid_index, item, first, last, do_all,
	-- for_all, exists, aggregate out_in_tagged_out_memory, count, is_empty).
	-- Usage will tell if it's worth.

	-- INDEXABLE[GI_BASE_INFO] 
	-- rename
	-- 	lower as prerequisites_lower,
	-- 	upper as prerequisites_upper,
	-- 	count as prerequisites_count
	-- 	item as prerequisites,
	-- 	do_all as do_all_prerequites,
	-- 	for_all as for_all_prerequisites....
	-- end

insert 
	GIINTERFACEINFO_EXTERNALS

creation from_external_pointer

feature -- Prerequisites
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
	require valid_index: i.in_range(0,prerequisites_count-1)
	do
		create Result.from_external_pointer(g_interface_info_get_prerequisite( handle,i))
		-- g_interface_info_get_prerequisite Returns : the prerequisites as a
		-- GIBaseInfo. Free the struct by calling g_base_info_unref() when
		-- done. [transfer full]
	ensure Result /=Void

feature -- Properties
	properties_count: INTEGER is
		-- the number of properties that this interface type has. 
	do
		Result := g_interface_info_get_n_properties(handle)
	end
  
	property (i: INTEGER) is
		-- the interface type property at index `i'. 
	require valid_index: i.in_range(0,properties_count-1)
	do
		create Result.from_external_pointer(g_interface_info_get_property(handle,i)
		-- g_interface_info_get_property Returns : the GIPropertyInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure Result/=Void
	end
   
feature -- Methods
	methods_count: INTEGER is
		-- the number of methods that this interface type has.
		do
			Result := g_interface_info_get_n_methods(handle)
		end

	method (n: INTEGER): GI_FUNCTION_INFO is
		-- the interface type method at index `n'.
	require valid_index: n.in_range(0,methods_count-1)
	do
		create Result.from_external_pointer(g_interface_info_get_method(handle,n)) 
		-- g_interface_info_get_method  Returns : the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure Result/=Void

	find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO is
		-- The method of the interface type with `a_name'. Void if there's no method available with that name.
	require 
		not_void: a_name /= Void
		not_empty: not a_name.is_empty
	local res: POINTER
	do
		res := g_interface_info_find_method(handle, a_name.to_external) 
		if res.is_not_null then 
			create Result.from_external_pointer(res)
			-- g_interface_info_find_method Returns : the GIFunctionInfo or
			-- NULL if none found. Free the struct by calling
			-- g_base_info_unref() when done. [transfer
		end 
   
feature -- Signals
	signals_count: INTEGER is
		-- the number of signals that this interface type has.
		do
			Result := g_interface_info_get_n_signals(handle)
		ensure Result>=0
		end

	signal (n: INTEGER): GI_SIGNAL_INFO is
		-- The an interface type signal at index n.
	require valid_n: n.in_range(0,signals_count-1)
	do
		create Result.from_external_pointer(g_interface_info_get_signal(handle,n)
	ensure Result/=Void
	end

	find_signal (a_name: ABSTRACT_STRING): GI_SIGNAL_INFO is
		-- The information for the signal with `a_name'. Void if no such a signal exists.
	require 
		a_name /= Void
		not a_name.is_empty
	local res: POINTER
	do
		res := g_interface_info_find_signal(handle,a_name.to_external)
		if res.is_not_null then
			create Result.from_external_pointer(res)
		end
	end

feature -- Virtual functions 
	virtual_functions_count: INTEGER is 
		-- the number of virtual functions that this interface type has. 
	do
		Result := g_interface_info_get_n_vfuncs(handle)
	ensure Result>=0
	end

	virtual_function (n: INTEGER): GI_VFUNC_INFO is
		-- The interface type virtual function at index `n'.
	require	valid_index: n.in_range(0,virtual_functions_count)
	do
		create Result.from_external_pointer(g_interface_info_get_vfunc(handle,n)) --Note: ownership fully transferred
	ensure Result/=Void
	end

	find_virtual_function (a_name: ABSTRACT_STRING): GI_VFUNC_INFO is
		-- The virtual function with `a_name'. Void if such a functon does not exist.
	require 
		a_name /= Void
		not a_name.is_empty
	local res: POINTER
	do
		res := g_interface_info_find_vfunc(handle,a_name.to_external) -- Note: ownership fully transferred
		if res.is_not_null then
			create Result.from_external_pointer(res)
		end 

feature -- Constants
	constants_count: INTEGER is
		-- the number of constants that this interface type has.
	do
		Result := g_interface_info_get_n_constants(handle)
	ensure Result>=0
	end

	constant (n: INTEGER): GI_CONSTANT_INFO is
		-- The interface type constant at index n.
	require valid_index: n.in_range(0,constants_count-1)
	do
		create Result.from_external_pointer(g_interface_info_get_constant(handle,n)) -- Note: ownership fully transferred
	ensure Result/=Void
	end

-- TODO: if necessary or useful  g_interface_info_get_iface_struct ()
-- 
--  GIStructInfo *      g_interface_info_get_iface_struct   (GIInterfaceInfo *info);
-- 
--    Returns the layout C structure associated with this GInterface.
-- 
--    info :    a GIInterfaceInfo
--    Returns : the GIStructInfo or NULL. Free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

end 
