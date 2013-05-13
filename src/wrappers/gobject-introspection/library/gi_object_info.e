class GI_OBJECT_INFO
   -- A GObject Introspection metadata representing a GObject
   
   -- GIObjectInfo represents a GObject. This doesn't represent a specific
   -- instance of a GObject, instead this represent the object type (eg class).

   -- A GObject has methods, fields, properties, signals, interfaces, constants
   -- and virtual functions.

inherit 
	GI_REGISTERED_TYPE_INFO
	INDEXABLE[GI_INTERFACE_INFO]
		rename 
			lower as interface_lower
			upper as interface_upper
			count as interface_count
			is_empty as has_no_interfaces
			valid_index as valid_interfacei_index
			item as interface
			first as first_interface
			last as last_interface
			do_all as interface_do_all 
			for_all as for_all_interfaces
			exists as interface_exists
			aggregate as aggregate_interfaces
			out_in_tagged_out_memory as interface_out_in_tagged_out_memory
		end
		INDEXABLE[GI_FIELD_INFO]
		rename 
			lower as field_lower
			upper as field_upper
			count as field_count
			is_empty as has_no_fields
			valid_index as valid_field_index
			item as field 
			first as first_field
			last as last_field
			do_all as field_do_all 
			for_all as for_all_fields
			exists as field_exists
			aggregate as aggregate_fields
			out_in_tagged_out_memory as field_out_in_tagged_out_memory
		end
		INDEXABLE[GI_PROPERTY_INFO]
		rename 
			lower as perperty_lower
			upper as perperty_upper
			count as perperty_count
			is_empty as perperty_is_empty
			valid_index as perperty_valid_index
			item as perperty_item 
			first as perperty_first
			last as perperty_last
			do_all as perperty_do_all 
			for_all as perperty_for_all
			exists as perperty_exists
			aggregate as perperty_aggregate
			out_in_tagged_out_memory as perperty_out_in_tagged_out_memory
		end
		INDEXABLE[GI_FUNCTION_INFO]
		rename 
			lower as method_lower
			upper as method_upper
			count as method_count
			is_empty as has_no_methods
			valid_index as valid_method_index
			item as method 
			first as first_method
			last as last_method
			do_all as method_do_all 
			for_all as for_all_methods
			exists as method_exists
			aggregate as method_aggregate
			out_in_tagged_out_memory as method_out_in_tagged_out_memory
		end
		INDEXABLE[GI_SIGNAL_INFO]
		rename 
			lower as signal_lower
			upper as signal_upper
			count as signal_count
			is_empty as has_no_signals
			valid_index as valid_signal_index
			item as signal
			first as first_signal
			last as last_signal
			do_all as signal_do_all 
			for_all as for_all_signals
			exists as signal_exists
			aggregate as signal_aggregate
			out_in_tagged_out_memory as signal_out_in_tagged_out_memory
		end
		INDEXABLE[GI_VFUNC_INFO]
		rename 
			lower as virtual_function_lower
			upper as virtual_function_upper
			count as virtual_function_count
			is_empty as has_no_virtual_functions
			valid_index as valid_virtual_function_index
			item as virtual_function 
			first as first_virtual_function
			last as last_virtual_function
			do_all as virtual_function_do_all 
			for_all as for_all_virtual_functions
			exists as virtual_function_exists
			aggregate as virtual_function_aggregate
			out_in_tagged_out_memory as virtual_function_out_in_tagged_out_memory
		end
		INDEXABLE[GI_CONSTANT_INFO]
		rename 
			lower as constant_lower
			upper as constant_upper
			count as constant_count
			is_empty as has_no_constants
			valid_index as valid_constant_index
			item as constant
			first as first_constant
			last as last_constant
			do_all as constant_do_all 
			for_all as for_all_constants
			exists as constant_exists
			aggregate as constant_aggregate
			out_in_tagged_out_memory as constant_out_in_tagged_out_memory
		end

insert 
	GIOBJECTINFO_EXTERNALS

creation from_external_pointer

feature 
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
	interface_lower: INTEGER 
interface_upper
interface_count
has_no_interfaces
valid_interfacei_index
interface
first_interface
last_interface
interface_do_all 
for_all_interfaces
interface_exists
aggregate_interfaces
interface_out_in_tagged_out_memory
	interfaces_count: INTEGER is
		-- Obtain the number of interfaces that this object type has.
	do
		Result := g_object_info_get_n_interfaces(handle)
	end

	interface (n: INTEGER): GI_INTERFACE_INFO is

 GIInterfaceInfo *   g_object_info_get_interface         (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type interface at index n.

   info :    a GIObjectInfo
   n :       index of interface to get
   Returns : the GIInterfaceInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_n_fields ()

 gint                g_object_info_get_n_fields          (GIObjectInfo *info);

   Obtain the number of fields that this object type has.

   info :    a GIObjectInfo
   Returns : number of fields

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_field ()

 GIFieldInfo *       g_object_info_get_field             (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type field at index n.

   info :    a GIObjectInfo
   n :       index of field to get
   Returns : the GIFieldInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_n_properties ()

 gint                g_object_info_get_n_properties      (GIObjectInfo *info);

   Obtain the number of properties that this object type has.

   info :    a GIObjectInfo
   Returns : number of properties

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_property ()

 GIPropertyInfo *    g_object_info_get_property          (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type property at index n.

   info :    a GIObjectInfo
   n :       index of property to get
   Returns : the GIPropertyInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_n_methods ()

 gint                g_object_info_get_n_methods         (GIObjectInfo *info);

   Obtain the number of methods that this object type has.

   info :    a GIObjectInfo
   Returns : number of methods

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_method ()

 GIFunctionInfo *    g_object_info_get_method            (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type method at index n.

   info :    a GIObjectInfo
   n :       index of method to get
   Returns : the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_find_method ()

 GIFunctionInfo *    g_object_info_find_method           (GIObjectInfo *info,
                                                          const gchar *name);

   Obtain a method of the object type given a name. NULL will be returned if there's no method available with that name.

   info :    a GIObjectInfo
   name :    name of method to obtain
   Returns : the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_n_signals ()

 gint                g_object_info_get_n_signals         (GIObjectInfo *info);

   Obtain the number of signals that this object type has.

   info :    a GIObjectInfo
   Returns : number of signals

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_signal ()

 GISignalInfo *      g_object_info_get_signal            (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type signal at index n.

   info :    a GIObjectInfo
   n :       index of signal to get
   Returns : the GISignalInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_n_vfuncs ()

 gint                g_object_info_get_n_vfuncs          (GIObjectInfo *info);

   Obtain the number of virtual functions that this object type has.

   info :    a GIObjectInfo
   Returns : number of virtual functions

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_vfunc ()

 GIVFuncInfo *       g_object_info_get_vfunc             (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type virtual function at index n.

   info :    a GIObjectInfo
   n :       index of virtual function to get
   Returns : the GIVFuncInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_n_constants ()

 gint                g_object_info_get_n_constants       (GIObjectInfo *info);

   Obtain the number of constants that this object type has.

   info :    a GIObjectInfo
   Returns : number of constants

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_constant ()

 GIConstantInfo *    g_object_info_get_constant          (GIObjectInfo *info,
                                                          gint n);

   Obtain an object type constant at index n.

   info :    a GIObjectInfo
   n :       index of constant to get
   Returns : the GIConstantInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_class_struct ()

 GIStructInfo *      g_object_info_get_class_struct      (GIObjectInfo *info);

   Every GObject has two structures; an instance structure and a class structure. This function returns the metadata for
   the class structure.

   info :    a GIObjectInfo
   Returns : the GIStructInfo or NULL. Free with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_find_vfunc ()

 GIVFuncInfo *       g_object_info_find_vfunc            (GIObjectInfo *info,
                                                          const gchar *name);

   Locate a virtual function slot with name name. Note that the namespace for virtuals is distinct from that of methods;
   there may or may not be a concrete method associated for a virtual. If there is one, it may be retrieved using
   g_vfunc_info_get_invoker(), otherwise NULL will be returned. See the documentation for g_vfunc_info_get_invoker() for
   more information on invoking virtuals.

   info :    a GIObjectInfo
   name :    The name of a virtual function to find.
   Returns : the GIVFuncInfo, or NULL. Free it with g_base_info_unref() when done. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_unref_function ()

 const char *        g_object_info_get_unref_function    (GIObjectInfo *info);

   Obtain the symbol name of the function that should be called to unref this object type. It's mainly used fundamental
   types. The type signature for the symbol is GIObjectInfoUnrefFunction, to fetch the function pointer see
   g_object_info_get_unref_function().

   info :    a GIObjectInfo
   Returns : the symbol or NULL

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_unref_function_pointer ()

 GIObjectInfoUnrefFunction g_object_info_get_unref_function_pointer
                                                         (GIObjectInfo *info);

   Obtain a pointer to a function which can be used to decrease the reference count an instance of this object type. This
   takes derivation into account and will reversely traverse the base classes of this type, starting at the top type.

   info :    a GIObjectInfo
   Returns : the function pointer or NULL

   -----------------------------------------------------------------------------------------------------------------------

  g_object_info_get_ref_function ()

 const char *        g_object_info_get_ref_function      (GIObjectInfo *info);

   Obtain the symbol name of the function that should be called to ref this object type. It's mainly used fundamental
   types. The type signature for the symbol is GIObjectInfoRefFunction, to fetch the function pointer see
   g_object_info_get_ref_function().

   info :    a GIObjectInfo
   Returns : the symbol or NULL

feature {} -- Implementation
	stored_type_name: like type_name
	stored_type_init: like type_init

feature {} -- Unwrapped 

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
