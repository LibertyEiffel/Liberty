deferred class GI_BASE_INFO
   -- A base class for all metadata types in GOBject Introspection repository.
   --
   --    Example: Getting the Button of the Gtk typelib
   --   
   --    local button_info: GI_BASE_INFO
   --    1 button_info := {GI_REPOSITORY}.find_by_name("Gtk", "Button");
   --    2 ... use button_info ...
   --

inherit
   OPAQUE_TYPE
      -- redefine is_equal end
   REFERENCE_COUNTED
      -- redefine is_equal end

insert
   GIBASEINFO_EXTERNALS
   GITYPEINFO_EXTERNALS

feature {WRAPPER_HANDLER} -- Memory handling
   ref
      local
         ptr: POINTER
      do
         ptr := g_base_info_ref(handle)
      end

   unref
      do
         g_base_info_unref(handle)
      end

feature {ANY}
   type: GIINFO_TYPE_ENUM
         -- The type of info
      do
         Result.set(g_base_info_get_type(handle))
         -- Remember that _ENUM types are usually expanded
      end

   name: FIXED_STRING
         -- The name of the info. What the name represents depends on the GIInfoType of the info. For instance forGIFunctionInfo it is the name of the function.
         -- May be void.
      local
         ptr: POINTER
      do
         ptr := g_base_info_get_name(handle)
         if ptr.is_not_null then
            create Result.from_external(ptr)
         end
      end

   namespace: FIXED_STRING
         -- The namespace of info.
      do
         create Result.from_external(g_base_info_get_namespace(handle))
      ensure
         not_void: Result /= Void
      end

   is_deprecated: BOOLEAN
         -- Does the info type represents a metadata which is deprecated?
      do
         Result := g_base_info_is_deprecated(handle).to_boolean
      end

   attrib (a_name: ABSTRACT_STRING): FIXED_STRING
         -- An arbitrary attribute associated with this node identified by
         -- `a_name' a freeform string naming an attribute
         -- Void when no such attribute exists
      local
         ptr: POINTER
      do
         ptr := g_base_info_get_attribute(handle, a_name.to_external)
         if ptr.is_not_null then
            create Result.from_external(ptr)
         end
      end
      -- TODO: wrap g_base_info_iterate_attributes () may require turning GI_ATTRIBUTE_ITER into an expanded external type
      --
      --  gboolean            g_base_info_iterate_attributes      (GIBaseInfo *info,
      --                                                           GIAttributeIter *iterator,
      --                                                           char **name,
      --                                                           char **value);
      --
      --    Iterate over all attributes associated with this node. The iterator structure is typically stack allocated, and must
      --    have its first member initialized to NULL.
      --
      --    Both the name and value should be treated as constants and must not be freed.
      --
      --    Example 3. Iterating over attributes
      --
      --     1 void
      --     2 print_attributes (GIBaseInfo *info)
      --     3 {
      --     4   GIAttributeIter iter = { 0, };
      --     5   char *name;
      --     6   char *value;
      --     7   while (g_base_info_iterate_attributes (info, &iter, &name, &value))
      --     8     {
      --     9       g_print ("attribute name: %s value: %s", name, value);
      --    10     }
      --    11 }
      --
      --    info :     a GIBaseInfo
      --    iterator : a GIAttributeIter structure, must be initialized; see below
      --    name :     Returned name, must not be freed. [out][transfer none]
      --    value :    Returned name, must not be freed. [out][transfer none]
      --    Returns :  TRUE if there are more attributes
      --

   container: GI_BASE_INFO
         -- The container of the info. The container is the parent GIBaseInfo.
         -- For instance, the parent of a GIFunctionInfo is an GIObjectInfo or
         -- GIInterfaceInfo.
      do
         not_yet_implemented
         -- as a naive
         -- Result := wrapper (g_base_info_get_container(handle)
         -- would not do. Infact the ownership of the returned pointer is retained by the C library.
      end

feature {}
   -- Unwrapped
   --   g_base_info_get_typelib ()
   --
   --  GITypelib *         g_base_info_get_typelib             (GIBaseInfo *info);
   --
   --    Obtain the typelib this info belongs to
   --
   --    info :    a GIBaseInfo
   --    Returns : the typelib. [transfer none]
   -- is_equal (another: GI_BASE_INFO): BOOLEAN
   -- 	--    Compare two GIBaseInfo.
   -- do
   -- 	-- Using pointer comparison is not practical since many functions
   -- 	-- return different instances of GIBaseInfo that refers to the same
   -- 	-- part of the TypeLib; use this function instead to do GIBaseInfo
   -- 	-- comparisons.
   -- 	Result := g_base_info_equal (handle, another.handle).to_boolean
   -- end
   

end -- class GI_BASE_INFO

-- Copyright (C) 2013-2016: Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
