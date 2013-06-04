class GI_OBJECT_INFO
   -- A GObject Introspection metadata representing a GObject
   
   -- GIObjectInfo represents a GObject. This doesn't represent a specific
   -- instance of a GObject, instead this represent the object type (eg class).

   -- A GObject has methods, fields, properties, signals, interfaces, constants
   -- and virtual functions. Therefore it is indexable over each one of those. 

   -- "Oh thy power of multiple inheritance. Oh thy joy of having multiple
   -- parents! How sad are thy languages not having all those! "
   --    from the "Hymn to the perfectest programming language"

inherit 
	GI_REGISTERED_TYPE_INFO
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_INTERFACE_INFO]
		rename 
			lower as interface_lower,
			upper as interface_upper,
			count as interface_count,
			is_empty as has_no_interfaces,
			valid_index as valid_interface_index,
			item as interface,
			first as first_interface,
			last as last_interface,
			do_all as interface_do_all, 
			for_all as for_all_interfaces,
			exists as interface_exists,
			aggregate as aggregate_interfaces
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_FIELD_INFO]
		rename 
			lower as field_lower,
			upper as field_upper,
			count as field_count,
			is_empty as has_no_fields,
			valid_index as valid_field_index,
			item as field,
			first as first_field,
			last as last_field,
			do_all as field_do_all, 
			for_all as for_all_fields,
			exists as field_exists,
			aggregate as aggregate_fields
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_PROPERTY_INFO] 
		rename 
			lower as property_lower,
			upper as property_upper,
			count as property_count,
			is_empty as property_is_empty,
			valid_index as property_valid_index,
			item as property_item,
			first as property_first,
			last as property_last,
			do_all as property_do_all, 
			for_all as property_for_all,
			exists as property_exists,
			aggregate as property_aggregate
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_FUNCTION_INFO]
		rename 
			lower as method_lower,
			upper as method_upper,
			count as method_count,
			is_empty as has_no_methods,
			valid_index as valid_method_index,
			item as method,
			first as first_method,
			last as last_method,
			do_all as method_do_all, 
			for_all as for_all_methods,
			exists as method_exists,
			aggregate as method_aggregate
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_SIGNAL_INFO]
		rename 
			lower as signal_lower,
			upper as signal_upper,
			count as signal_count,
			is_empty as has_no_signals,
			valid_index as valid_signal_index,
			item as signal,
			first as first_signal,
			last as last_signal,
			do_all as signal_do_all, 
			for_all as for_all_signals,
			exists as signal_exists,
			aggregate as signal_aggregate
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_VFUNC_INFO]
		rename 
			lower as virtual_function_lower,
			upper as virtual_function_upper,
			count as virtual_function_count,
			is_empty as has_no_virtual_functions,
			valid_index as valid_virtual_function_index,
			item as virtual_function,
			first as first_virtual_function,
			last as last_virtual_function,
			do_all as virtual_function_do_all, 
			for_all as for_all_virtual_functions,
			exists as virtual_function_exists,
			aggregate as virtual_function_aggregate
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

	INDEXABLE[GI_CONSTANT_INFO]
		rename 
			lower as constant_lower,
			upper as constant_upper,
			count as constant_count,
			is_empty as has_no_constants,
			valid_index as valid_constant_index,
			item as constant,
			first as first_constant,
			last as last_constant,
			do_all as constant_do_all, 
			for_all as for_all_constants,
			exists as constant_exists,
			aggregate as constant_aggregate
			undefine copy, is_equal
		redefine out_in_tagged_out_memory
		end

insert 
	GIOBJECTINFO_EXTERNALS
		redefine out_in_tagged_out_memory
		end

creation {GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY}
	type_name: FIXED_STRING is
		--  the name of the objects class/type.
	do
		if stored_type_name=Void then
			create stored_type_name.from_external(g_object_info_get_type_name(handle))
		end
		Result := stored_type_name
	ensure Result/=Void
	end 

	type_init: FIXED_STRING is 
		-- The name of the function which when called will return the GType
		-- function for which this object type is registered.
	do
		if stored_type_init=Void then
			create stored_type_init.from_external(g_object_info_get_type_init(handle))
		end
		Result:=stored_type_init
	ensure Result/=Void
	end 

	is_deferred: BOOLEAN is
		-- Is the object type is an abstract type? An abstract type cannot be
		-- instantiated. Abstract types is the name of Eiffel's deferred
		-- classes in C/C++/GObject.
	do
		Result:=g_object_info_get_abstract(handle).to_boolean
	end

 	is_fundamental: BOOLEAN is
		-- Obtain if the object type is of a fundamental type which is not
		-- G_TYPE_OBJECT. This is mostly for supporting GstMiniObject.
	do
		Result := g_object_info_get_fundamental(handle)
	end 

	parent: GI_OBJECT_INFO is
		-- the parent of the object type.
	do
		create Result.from_external_pointer(g_object_info_get_parent(handle))
		-- g_object_info_get_parent ireturns : the GIObjectInfo. Free the
		-- struct by calling g_base_info_unref() when done. [transfer full]
	ensure Result/=Void
	end

feature {ANY} -- Interfaces
	interface_lower: INTEGER is 0

	interface_upper: INTEGER is
		do
			Result := interface_count-1
		end

	interfaces_count: INTEGER is
		-- Obtain the number of interfaces that this object type has.
	do
		Result := g_object_info_get_n_interfaces(handle)
	end

	has_no_interfaces: BOOLEAN is
		do
			Result := interfaces_count = 0
		end

	first_interface: GI_INTERFACE_INFO is
		do
			Result := interface(interface_lower)
		end

	last_interface: GI_INTERFACE_INFO is
		do
			Result := interface(interface_upper)
		end

	interface (n: INTEGER): GI_INTERFACE_INFO is
		-- The interface with index `n'
		do
			create Result.from_external_pointer(g_object_info_get_interface(handle,n))
			-- g_object_info_get_interface returns : the GIInterfaceInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
		ensure Result/=Void
		end

feature {ANY} -- Fields
	field_lower: INTEGER is 0
	field_upper: INTEGER is do Result := field_count-1 end
	field_count: INTEGER is
		-- The number of fields that this object type has.
	do
		Result := g_object_info_get_n_fields(handle)
	ensure not_negative: Result>=0
	end

	field (n: INTEGER): GI_FIELD_INFO is 
		-- The field object at index n.
	do
		create Result.from_external_pointer(g_object_info_get_field(handle,n))
		-- g_object_info_get_field returns the GIFieldInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

feature {ANY} -- Properties
	property_lower: INTEGER is 0
	property_upper: INTEGER is do Result:=property_count-1 end

	property_count: INTEGER is
		--the number of properties that this object type has. 
	do
		Result:=g_object_info_get_n_properties(handle)
	ensure Result>=0 
	end

	property (n: INTEGER): GI_PROPERTY_INFO is
		-- The property at index `n'.
	do
		create Result.from_external_pointer(g_object_info_get_property(handle,n))
		-- g_object_info_get_property info returns : the GIPropertyInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

feature {ANY} -- Methods
	method_lower: INTEGER is 0
	method_upper: INTEGER is do Result := method_count-1 end
	method_count: INTEGER is
		-- The number of methods Current object has
	do
		Result := g_object_info_get_n_methods (handle)
	end

  	method (n: INTEGER): GI_FUNCTION_INFO is
		-- The method object at index `n'
	do
		create Result.from_external_pointer(g_object_info_get_method(handle,n))
   		-- returns  the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

	find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO is
		-- The method with `a_name'. Void if no method exists with that name
	require 
		not_void_name: a_name/=Void
		not_empty_name: not a_name.is_empty
	local p: POINTER
	do
		p := g_object_info_find_method(handle,a_name.to_external) 
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end 
		-- g_object_info_find_method returns a GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

feature {ANY} -- Signals
	signal_lower: INTEGER is 0
	signal_upper: INTEGER is 
	do
		Result := signal_count-1
	end

	signal_count: INTEGER is
		-- the number of signals that this object type has.
	do
		Result := g_object_info_get_n_signals(handle)
	ensure non_negative: Result>=0
	end

	signal (n: INTEGER): GI_SIGNAL_INFO is
		-- The signal at index `n'
	do
		create Result.from_external_pointer(g_object_info_get_signal(handle,n)) 
		-- g_object_info_get_signa lReturns : the GISignalInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end 
   
feature {ANY} -- Virtual functions
	virtual_function_lower: INTEGER is 0
	virtual_function_upper: INTEGER is
		do
			Result := virtual_function_count-1
		end
	
	virtual_function_count: INTEGER is
		-- the number of virtual functions that this object type has.
		do
			Result :=  g_object_info_get_n_vfuncs(handle)
		ensure not_negative: Result >= 0
		end

	virtual_function (n: INTEGER): GI_VFUNC_INFO is
		-- The virtual function at index `n'.
	do
		create Result.from_external_pointer(g_object_info_get_vfunc(handle,n))
		-- g_object_info_get_vfunc returns the GIVFuncInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

	find_virtual_function (a_name: ABSTRACT_STRING): GI_VFUNC_INFO is
		-- The virtual function slot with `a_name'. Note that the namespace for
		-- virtuals is distinct from that of methods; there may or may not be a
		-- concrete method associated for a virtual. If there is one, it may be
		-- retrieved using Result.invoker otherwise Void will be returned. See
		-- GI_VFUNC_INFO the more information on invoking virtuals.
	require 
		not_void: a_name/=Void
		not_empty: not a_name.is_empty
	local p:POINTER
	do
		p := g_object_info_find_vfunc (handle, a_name.to_external)
		-- g_object_info_find_vfunc returns : the GIVFuncInfo, or NULL. Free it
		-- with g_base_info_unref() when done. [transfer full]
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end
   
feature {ANY} -- Constants
	constant_lower: INTEGER is 0
	constant_upper: INTEGER is
		do
			Result := constant_count-1
		end

	constant_count: INTEGER is
		-- the number of constants that this object type has
	do
		Result:=g_object_info_get_n_constants (handle)
	ensure Result>=0
	end

	constant (n: INTEGER): GI_CONSTANT_INFO is
		-- The constant at index `n'
	do
		create Result.from_external_pointer(g_object_info_get_constant(handle,n))
		-- g_object_info_get_constant returns the GIConstantInfo. Free the
		-- struct by calling g_base_info_unref() when done. [transfer full]
	ensure Result/=Void
	end

feature {ANY}
	out_in_tagged_out_memory is
	do
		not_yet_implemented
	end

feature {} -- Implementation
	stored_type_name: like type_name
	stored_type_init: like type_init

feature {} -- Unwrapped 
-- g_object_info_get_unref_function ()
-- 
--  const char *        g_object_info_get_unref_function    (GIObjectInfo *info);
-- 
--    Obtain the symbol name of the function that should be called to unref this object type. It's mainly used fundamental
--    types. The type signature for the symbol is GIObjectInfoUnrefFunction, to fetch the function pointer see
--    g_object_info_get_unref_function().
-- 
--    info :    a GIObjectInfo
--    Returns : the symbol or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   g_object_info_get_unref_function_pointer ()
-- 
--  GIObjectInfoUnrefFunction g_object_info_get_unref_function_pointer
--                                                          (GIObjectInfo *info);
-- 
--    Obtain a pointer to a function which can be used to decrease the reference count an instance of this object type. This
--    takes derivation into account and will reversely traverse the base classes of this type, starting at the top type.
-- 
--    info :    a GIObjectInfo
--    Returns : the function pointer or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   g_object_info_get_ref_function ()
-- 
--  const char *        g_object_info_get_ref_function      (GIObjectInfo *info);
-- 
--    Obtain the symbol name of the function that should be called to ref this object type. It's mainly used fundamental
--    types. The type signature for the symbol is GIObjectInfoRefFunction, to fetch the function pointer see
--    g_object_info_get_ref_function().
-- 
--    info :    a GIObjectInfo
--    Returns : the symbol or NULL
-- 
--   -----------------------------------------------------------------------------------------------------------------------
--
--  g_object_info_get_class_struct ()
--
-- GIStructInfo *      g_object_info_get_class_struct      (GIObjectInfo *info);
--
--   Every GObject has two structures; an instance structure and a class structure. This function returns the metadata for
--   the class structure.
--
--   info :    a GIObjectInfo
--   Returns : the GIStructInfo or NULL. Free with g_base_info_unref() when done. [transfer full]


--   GIObjectInfoGetValueFunction ()
-- 
--  void *              (*GIObjectInfoGetValueFunction)     (const GValue *value);
-- 
--    Extract an object instance out of value
-- 
--    value :   a GValue
--    Returns : the object instance. [transfer full]
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   GIObjectInfoRefFunction ()
-- 
--  void *              (*GIObjectInfoRefFunction)          (void *object);
-- 
--    Increases the reference count of an object instance.
-- 
--    object :  object instance pointer
--    Returns : the object instance. [transfer full]
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   GIObjectInfoSetValueFunction ()
-- 
--  void                (*GIObjectInfoSetValueFunction)     (GValue *value,
--                                                           void *object);
-- 
--    Update value and attach the object instance pointer object to it.
-- 
--    value :  a GValue
--    object : object instance pointer
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   GIObjectInfoUnrefFunction ()
-- 
--  void                (*GIObjectInfoUnrefFunction)        (void *object);
-- 
--    Decreases the reference count of an object instance.
-- 
--    object : object instance pointer
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
-- 
--   g_object_info_get_ref_function_pointer ()
-- 
--  GIObjectInfoRefFunction g_object_info_get_ref_function_pointer
--                                                          (GIObjectInfo *info);
-- 
--    Obtain a pointer to a function which can be used to increase the reference count an instance of this object type. This
--    takes derivation into account and will reversely traverse the base classes of this type, starting at the top type.
-- 
--    info :    a GIObjectInfo
--    Returns : the function pointer or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   g_object_info_get_set_value_function ()
-- 
--  const char *        g_object_info_get_set_value_function
--                                                          (GIObjectInfo *info);
-- 
--    Obtain the symbol name of the function that should be called to convert set a GValue giving an object instance pointer
--    of this object type. I's mainly used fundamental types. The type signature for the symbol is
--    GIObjectInfoSetValueFunction, to fetch the function pointer see g_object_info_get_set_value_function().
-- 
--    info :    a GIObjectInfo
--    Returns : the symbol or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   g_object_info_get_set_value_function_pointer ()
-- 
--  GIObjectInfoSetValueFunction g_object_info_get_set_value_function_pointer
--                                                          (GIObjectInfo *info);
-- 
--    Obtain a pointer to a function which can be used to set a GValue given an instance of this object type. This takes
--    derivation into account and will reversely traverse the base classes of this type, starting at the top type.
-- 
--    info :    a GIObjectInfo
--    Returns : the function pointer or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   g_object_info_get_get_value_function ()
-- 
--  const char *        g_object_info_get_get_value_function
--                                                          (GIObjectInfo *info);
-- 
--    Obtain the symbol name of the function that should be called to convert an object instance pointer of this object type
--    to a GValue. I's mainly used fundamental types. The type signature for the symbol is GIObjectInfoGetValueFunction, to
--    fetch the function pointer see g_object_info_get_get_value_function().
-- 
--    info :    a GIObjectInfo
--    Returns : the symbol or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   g_object_info_get_get_value_function_pointer ()
-- 
--  GIObjectInfoGetValueFunction g_object_info_get_get_value_function_pointer
--                                                          (GIObjectInfo *info);
-- 
--    Obtain a pointer to a function which can be used to extract an instance of this object type out of a GValue. This takes
--    derivation into account and will reversely traverse the base classes of this type, starting at the top type.
-- 
--    info :    a GIObjectInfo
--    Returns : the function pointer or NULL
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
end
