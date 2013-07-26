deferred class GI_CALLABLE_INFO
   -- GICallableInfo — Struct representing a callable entity; currently a
   -- function (GI_FUNCTION_INFO), virtual function, (GI_VFUNC_INFO) or
   -- callback (GI_CALLBACK_INFO).  A callable has a list of arguments
   -- (GIArgInfo), a return type, direction and a flag which decides if it
   -- returns null.

inherit
   GI_BASE_INFO
   TRAVERSABLE[GI_ARG_INFO]
   undefine copy, is_equal, out_in_tagged_out_memory
      end

insert
   GICALLABLEINFO_EXTERNALS

feature {ANY}
   return_type: GI_TYPE_INFO is
         -- the return type of a callable item.
      do
         -- Implementation note: Free the struct by calling g_base_info_unref() when done. [transfer full]
         create Result.from_external_pointer(g_callable_info_get_return_type(handle))
      end

   caller_owns: BOOLEAN is
         -- DOes the caller owns the return value of this callable?
         -- Note: the library actually uses a GITransfer enum which contains a
         -- list of possible transfer values but it just use TRUE if the caller
         -- owns the return value, FALSE otherwise.
      do
         Result := g_callable_info_get_caller_owns(handle).to_boolean
      end

   may_return_null: BOOLEAN is
         -- Can Current callable return a NULL value?
      do
         Result := g_callable_info_may_return_null(handle).to_boolean
      end

   return_attribute (a_name: ABSTRACT_STRING): FIXED_STRING is
         -- An arbitrary attribute associated with the return value, named with the freeform string `a_name'.
         -- Void if no such attribute exists
      require
         a_name /= Void
         not a_name.is_empty
      local
         res: POINTER
      do
         res := g_callable_info_get_return_attribute(handle, a_name.to_external)
         if res.is_not_null then
            create Result.from_external(res)
         end
      end
      -- TODO:  g_callable_info_iterate_return_attributes ()
      -- gboolean            g_callable_info_iterate_return_attributes
      --                                                         (GICallableInfo *info,
      --                                                          GIAttributeIter *iterator,
      --                                                          char **name,
      --                                                          char **value);
      --
      --   Iterate over all attributes associated with the return value. The iterator structure is typically stack allocated, and
      --   must have its first member initialized to NULL.
      --
      --   Both the name and value should be treated as constants and must not be freed.
      --
      --   See g_base_info_iterate_attributes() for an example of how to use a similar API.
      --
      --   info :     a GICallableInfo
      --   iterator : a GIAttributeIter structure, must be initialized; see below
      --   name :     Returned name, must not be freed. [out][transfer none]
      --   value :    Returned name, must not be freed. [out][transfer none]
      --   Returns :  TRUE if there are more attributes
      --

feature {ANY} -- Indexing over arguments
   lower: INTEGER is 0

   upper: INTEGER is
      do
         Result := count - 1
      end

   count: INTEGER is
      do
         Result := g_callable_info_get_n_args(handle)
         -- Obtain the number of arguments (both IN and OUT) for this callable.
      end

   is_empty: BOOLEAN is
      do
         Result := count = 0
      end

   item (i: INTEGER): GI_ARG_INFO is
      do
         create Result.from_external_pointer(g_callable_info_get_arg(handle, i))
         -- Obtain information about a particular argument of this callable. Full ownership transfer full.
      end

	new_iterator: ITERATOR[GI_ARG_INFO] is
	do
		create {ITERATOR_OVER_ARGUMENTS} Result.from_callable(Current)
	end

	first: GI_ARG_INFO is do Result := item(lower) end
	last: GI_ARG_INFO is do Result := item(upper) end

feature {} -- Unwrapperd 

	--   g_callable_info_load_return_type and g_callable_info_load_arg () should not be necessary neither useful in Eiffel.

end -- class GI_CALLABLE_INFO
