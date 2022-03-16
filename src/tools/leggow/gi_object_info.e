class GI_OBJECT_INFO
   -- A GObject Introspection metadata representing a GObject
   
   -- GIObjectInfo represents a GObject. This doesn't represent a specific
   -- instance of a GObject, instead this represent the object type (eg class).

   -- A GObject has methods, fields, properties, signals, interfaces, constants
   -- and virtual functions. So it would be an indexable over each one of
   -- those; given the limited field of usage of such library it is not make a
   -- full heir of TRAVERSABLE but it indeed provides iterating and accessing
   -- facilities without full inheritance.

inherit 
	GI_CLASS -- providing properties access

	GI_REGISTERED_TYPE_INFO
		redefine 
			type_name,
			type_init,
			out_in_tagged_out_memory
		end

insert 
	GIOBJECTINFO_EXTERNALS
		redefine out_in_tagged_out_memory
		end

create {GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Wrapper
	emit_wrapper 
		--
    local w: ABSTRACT_STRING; pi: PROPERTIES_ITER
    do
       -- std_error.put_line("GI_OBJECT_INFO.emit_wrapper #(1)" # & Current ) 
       --std_error. log.trace.put_line("GI_OBJECT_INFO.emit_wrapper #(1)" # & Current ) 
       -- TODO: add prefix support
        create path.make_from_string(eiffel_class_name(name,once ".e").as_lower)
        create output.connect_to(path.to_string)
        log.info.put_line("Wrapping object #(1) in #(2)" # name # &path)
        if is_deferred then output.put_string(once "deferred class ")
        else output.put_string(once "class ")
        end
        output.put_line(class_name) 
        output.put_line("%T-- #(1) %N" # generator )
        append_create_clause 
        append_properties
        append_methods
        append_fields
        append_signals
        append_virtual_functions
        append_constants
        
        output.put_string(once "%Nend -- class ")
        output.put_line(class_name)
        output.disconnect
    end

   append_properties 
      do
         log.info.put_line("Class #(1) starting properties" # name)
         output.put_line(once "%N%Nfeature {ANY} -- Properties")
         -- properties_iter.for_each(agent (x: GI_PROPERTY_INFO) do print(once "foo!%N") end) --append_property(res,?)) 
         -- from pi:=properties_iter; pi.start
         -- until not pi.is_off
         -- loop
         --    log.info.put_line("#(1) property  #(2)" # name # pi.item.name)
         --    append_property(pi.item)
         --    pi.next
         -- end
         log.info.put_line("Class #(1) ended properties" # name)
      end


   append_methods 
       -- Append all methods to `output'.
    local getters,setters: STRING
    do
       log.info.put_line("Class #(1) starting methods" # name)
       getters := "feature {ANY} -- Properties%N"
       setters := "feature {ANY} -- Setting properties%N"

       output.put_line(once "%Nfeature {ANY} -- Methods%N")
       methods_iter.for_each(agent append_method(?,getters,setters))
       output.put_string(getters)
       output.put_string(setters)
    end

   append_fields
     require 
      output/=Void 
         output.is_connected
      do
        output.put_line(once "%Nfeature {ANY} -- Fields")
      end

   append_signals
   require 
      output/=Void 
         output.is_connected
      do
         output.put_line(once "%Nfeature {ANY} -- Signals")
      end

   append_virtual_functions
   require 
      output/=Void 
      output.is_connected
      do
        output.put_line(once "%Nfeature {ANY} -- Virtual functions")
      end

   append_constants
   require 
      output/=Void 
         output.is_connected
      do
        output.put_line(once "%Nfeature {ANY} -- Constants")
      end


	eiffel_wrapper: STRING is
		do
           Result:="-- TODO: eiffel wrapper should not be available in classes but only for methods and the like"
        end

    suffix: STRING is ""

feature {} -- Implementation of eiffel wrapper agents
  append_method (a_method: GI_FUNCTION_INFO; some_getters, some_setters: STRING) 
      -- When `a_method' is a getter append its query to `getters'
      -- When `a_method' is a setter appends its command to `setters' 
      -- When `a_method' is a constructor appends its creation commands to `constructurs'
      -- In any case output the low level into `externals'
    require 
      a_method /= Void
      some_getters /= Void
      some_setters /= Void
   local 
      its_property: GI_PROPERTY_INFO
      its_vfunc: GI_VFUNC_INFO
      is_getter, is_setter, is_constructor: BOOLEAN
   do
         -- Methods includes plain methods, constructors, getters and setters.
         -- It seems that flags for setters and getters are not set up correctly. So this command discover tries to discover it accessing `property' and `vfunc'
         its_property := a_method.property
         its_vfunc := a_method.vfunc
         is_getter := (its_property/=Void and a_method.name.has_prefix(once "get_"))
         is_setter := (its_property/=Void and a_method.name.has_prefix(once "set_"))
         is_constructor := a_method.flags.is_is_constructor
         log.info.put_line("Method '#(1)' (flags: #(2): getter #(3) setter #(4) method #(5) constructor #(6))" 
         # a_method.feature_name # &(a_method.flags.value) 
         # &(is_getter) 
         # &(is_setter) 
         # &(a_method.flags.is_is_method) 
         # &(is_constructor))
         if a_method.is_deprecated then
            log.info.put_line("Skipping deprecated method #(1)" # a_method.feature_name)
         elseif a_method.flags.is_is_getter then
            log.info.put_line("Getter method #(1)" # a_method.feature_name)
            some_getters.append("[
            #(1): #(2)
               -- #(3) (query feature, aka getter)
            external "plug_in"
            alias "{
               location: "."
               module_name: "plugin"
               feature_name: "#(3)"
            }"
            end
            ]" 
            # a_method.property.name 
            # a_method.return_type.eiffel_wrapper
            # a_method.symbol)
         elseif a_method.flags.is_is_setter then
            log.info.put_line("Setter method #(1)" # a_method.feature_name)
            some_setters.append("[
            #(1) (a_value: #(2))
               -- #(3) (setting command)
            external "plug_in"
               alias "{
               location: "."
               module_name: "plugin"
               feature_name: "#(4)"
               }"
            end
            ]" 
            # a_method.property.name 
            # "TODO_SETTER_TYPE"
            # a_method.class_name # a_method.symbol)
         elseif a_method.flags.is_is_method or a_method.flags.is_is_constructor then
            log.info.put_line("Method or constructor #(1)" # a_method.feature_name)
            output.put_line(a_method.eiffel_wrapper)
         end
      end

feature {ANY} 
   append_create_clause 
      -- Append the creations clause, i.e.e "create {ANY}" plus a list of the constructor feature names, each separated by a comma to output
   require
      output /= Void
      output.is_connected
   do
      if not constructors.is_empty then
         output.put_string(once "%Ncreate {ANY} ")
         constructors.lower.loop_up_to(constructors.upper-1,
         agent (i: INTEGER) do
            output.put_string (constructors.item(i).feature_name)
            output.put_string (once ", ")
         end)
         output.put_line(constructors.last.feature_name)
      else
         output.put_line(once "-- No creation features")
      end

   end
    constructors: COLLECTION[GI_FUNCTION_INFO] 
        -- The constructors of Current GI_OBJECT_INFO
    do
        if cached_constructors=Void then compute_constructors end
        Result := cached_constructors 
    end

feature {} -- Implementation
   output: TEXT_FILE_WRITE
   path: POSIX_PATH_NAME
feature {ANY}
	type_name: FIXED_STRING is
		--  the name of the objects class/type.
	do
		if stored_type_name=Void then
			create stored_type_name.from_external(g_object_info_get_type_name(handle))
		end
		Result := stored_type_name
	end 

	type_init: FIXED_STRING is 
		-- The name of the function which when called will return the GType
		-- function for which this object type is registered.
	do
		if stored_type_init=Void then
			create stored_type_init.from_external(g_object_info_get_type_init(handle))
		end
		Result:=stored_type_init
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
		Result := g_object_info_get_fundamental(handle).to_boolean
	end 

	parent: GI_OBJECT_INFO is
		-- the parent of the object type.
	do
		create Result.from_external_pointer(g_object_info_get_parent(handle))
		-- g_object_info_get_parent ireturns : the GIObjectInfo. Free the
		-- struct by calling g_base_info_unref() when done. [transfer full]
	ensure Result/=Void
	end

feature {ANY} -- Properties
	properties_count: INTEGER is
		--the number of properties that this object type has. 
	do
		Result:=g_object_info_get_n_properties(handle)
	end

	property (n: INTEGER): GI_PROPERTY_INFO is
		-- The property at index `n'.
	do
		create Result.from_external_pointer(g_object_info_get_property(handle,n))
		-- g_object_info_get_property info returns : the GIPropertyInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

feature {ANY} -- Methods
	methods_count: INTEGER is
		-- The number of methods Current object has
	do
		Result := g_object_info_get_n_methods (handle)
	end

  	method (n: INTEGER): GI_FUNCTION_INFO is
		-- The method object at index `n'
	do
		create Result.from_external_pointer(g_object_info_get_method(handle,n))
   		-- returns  the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

	find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO is
		-- The method with `a_name'. Void if no method exists with that name
	local p: POINTER
	do
		p := g_object_info_find_method(handle,a_name.to_external) 
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end 
		-- g_object_info_find_method returns a GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

feature {ANY} -- Fields
	fields_lower: INTEGER is 0
	fields_upper: INTEGER is do Result := fields_count-1 end
	fields_count: INTEGER is
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

    fields_iter: FIELDS_ITER is 
		-- Expanded iterator over fields	
	do 
		Result.set_class(Current)
	end


feature {ANY} -- Signals
	signals_count: INTEGER is
		-- the number of signals that this object type has.
	do
		Result := g_object_info_get_n_signals(handle)
	end
	signal (n: INTEGER): GI_SIGNAL_INFO is
		-- The signal at index `n'
	do
		create Result.from_external_pointer(g_object_info_get_signal(handle,n)) 
		-- g_object_info_get_signa lReturns : the GISignalInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end 
   
	find_signal (a_name: ABSTRACT_STRING): GI_SIGNAL_INFO is
		do
			not_yet_implemented
		end

feature {ANY} -- Interfaces
	interfaces_lower: INTEGER is 0

	interfaces_upper: INTEGER is
		do
			Result := interfaces_count-1
		end

	interfaces_count: INTEGER is
		-- Obtain the number of interfaces that this object type has.
	do
		Result := g_object_info_get_n_interfaces(handle)
	end

	interface (n: INTEGER): GI_INTERFACE_INFO is
		-- The interface with index `n'
		do
			create Result.from_external_pointer(g_object_info_get_interface(handle,n))
			-- g_object_info_get_interface returns : the GIInterfaceInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
		ensure Result/=Void
		end

	interfaces_iter: INTERFACES_ITER is
		-- Expanded iterator over interfaces
	do
		Result.set_object(Current)
	end

feature {ANY} -- Virtual functions
	virtual_functions_count: INTEGER is
		-- the number of virtual functions that this object type has.
		do
			Result :=  g_object_info_get_n_vfuncs(handle)
		end

	virtual_function (n: INTEGER): GI_VFUNC_INFO is
		-- The virtual function at index `n'.
	do
		create Result.from_external_pointer(g_object_info_get_vfunc(handle,n))
		-- g_object_info_get_vfunc returns the GIVFuncInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
	end

	find_virtual_function (a_name: ABSTRACT_STRING): GI_VFUNC_INFO is
		-- The virtual function slot with `a_name'. Note that the namespace for
		-- virtuals is distinct from that of methods; there may or may not be a
		-- concrete method associated for a virtual. If there is one, it may be
		-- retrieved using Result.invoker otherwise Void will be returned. See
		-- GI_VFUNC_INFO the more information on invoking virtuals.
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
	constants_count: INTEGER is
		-- the number of constants that this object type has
	do
		Result:=g_object_info_get_n_constants (handle)
	end

	constant (n: INTEGER): GI_CONSTANT_INFO is
		-- The constant at index `n'
	do
		create Result.from_external_pointer(g_object_info_get_constant(handle,n))
		-- g_object_info_get_constant returns the GIConstantInfo. Free the
		-- struct by calling g_base_info_unref() when done. [transfer full]
	end

feature {ANY}
	out_in_tagged_out_memory is
	do
		tagged_out_memory.append("GI_OBJECT_INFO #(1) n.prop #(2)" # type_name # & properties_count)
	end

feature {} -- Implementation
	stored_type_name: like type_name
	stored_type_init: like type_init
    cached_constructors: LINKED_LIST[GI_FUNCTION_INFO]

    compute_constructors 
    local mi: METHODS_ITER
    do
        create cached_constructors
        from mi := methods_iter; mi.start; until mi.is_off 
        loop
            if mi.item.flags.is_is_constructor then
                cached_constructors.add_last(mi.item)
            end
            mi.next
        end
    ensure not_void: cached_constructors/=Void
    end

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

-- Copyright (C) 2013-2022: Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
