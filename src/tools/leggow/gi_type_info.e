class GI_TYPE_INFO 
    -- GI_Type_Info is a representation of a type as seen by the Glib-Object Introspection infrastructure. You can retrieve a type info from an argument (see GIArgInfo), a functions return value
--    (see GIFunctionInfo), a field (see GIFieldInfo), a property (see GIPropertyInfo), a constant (see GIConstantInfo) or
--    for a union discriminator (see GIUnionInfo).
-- 
--    A type can either be a of a basic type which is a standard C primitive type or an interface type. For interface types
--    you need to call g_type_info_get_interface() to get a reference to the base info for that interface.
-- 
inherit 
	GI_BASE_INFO
	GI_INFO_FACTORY

insert GITYPEINFO_EXTERNALS

create{GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Wrapper
	emit_wrapper is
		do
			("GI_type: #(1)%N" # name).print_on(std_output)
		end

	eiffel_wrapper: ABSTRACT_STRING is
		do
			Result := "-- GI_TYPE_INFO.eiffel_wrapper not_yet_implemented"
		end

    suffix: STRING is "_TYPE"

feature {ANY}

-- 
--   enum GIArrayType
-- 
--  typedef enum {
--    GI_ARRAY_TYPE_C,
--    GI_ARRAY_TYPE_ARRAY,
--    GI_ARRAY_TYPE_PTR_ARRAY,
--    GI_ARRAY_TYPE_BYTE_ARRAY
--  } GIArrayType;
-- 
--    The type of array in a GITypeInfo.
-- 
--    GI_ARRAY_TYPE_C          a C array, char[] for instance
--    GI_ARRAY_TYPE_ARRAY      a GArray array
--    GI_ARRAY_TYPE_PTR_ARRAY  a GPtrArray array
--    GI_ARRAY_TYPE_BYTE_ARRAY a GByteArray array
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   GITypeInfo
-- 
--  typedef GIBaseInfo GITypeInfo;
-- 
--    Represents type information, direction, transfer etc.
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   enum GITypeTag
-- 
--  typedef enum {
--    /* Basic types */
--    GI_TYPE_TAG_VOID      =  0,
--    GI_TYPE_TAG_BOOLEAN   =  1,
--    GI_TYPE_TAG_INT8      =  2,
--    GI_TYPE_TAG_UINT8     =  3,
--    GI_TYPE_TAG_INT16     =  4,
--    GI_TYPE_TAG_UINT16    =  5,
--    GI_TYPE_TAG_INT32     =  6,
--    GI_TYPE_TAG_UINT32    =  7,
--    GI_TYPE_TAG_INT64     =  8,
--    GI_TYPE_TAG_UINT64    =  9,
--    GI_TYPE_TAG_FLOAT     = 10,
--    GI_TYPE_TAG_DOUBLE    = 11,
--    GI_TYPE_TAG_GTYPE     = 12,
--    GI_TYPE_TAG_UTF8      = 13,
--    GI_TYPE_TAG_FILENAME  = 14,
--    /* Non-basic types; compare with G_TYPE_TAG_IS_BASIC */
--    GI_TYPE_TAG_ARRAY     = 15,
--    GI_TYPE_TAG_INTERFACE = 16,
--    GI_TYPE_TAG_GLIST     = 17,
--    GI_TYPE_TAG_GSLIST    = 18,
--    GI_TYPE_TAG_GHASH     = 19,
--    GI_TYPE_TAG_ERROR     = 20,
--    /* Another basic type */
--    GI_TYPE_TAG_UNICHAR   = 21
--    /* Note - there is only room currently for 32 tags.
--     * See docs/typelib-format.txt SimpleTypeBlob definition */
--  } GITypeTag;
-- 
--    The type tag of a GITypeInfo.
-- 
--    GI_TYPE_TAG_VOID      void
--    GI_TYPE_TAG_BOOLEAN   boolean
--    GI_TYPE_TAG_INT8      8-bit signed integer
--    GI_TYPE_TAG_UINT8     8-bit unsigned integer
--    GI_TYPE_TAG_INT16     16-bit signed integer
--    GI_TYPE_TAG_UINT16    16-bit unsigned integer
--    GI_TYPE_TAG_INT32     32-bit signed integer
--    GI_TYPE_TAG_UINT32    32-bit unsigned integer
--    GI_TYPE_TAG_INT64     64-bit signed integer
--    GI_TYPE_TAG_UINT64    64-bit unsigned integer
--    GI_TYPE_TAG_FLOAT     float
--    GI_TYPE_TAG_DOUBLE    double floating point
--    GI_TYPE_TAG_GTYPE     a GType
--    GI_TYPE_TAG_UTF8      a UTF-8 encoded string
--    GI_TYPE_TAG_FILENAME  a filename, encoded in the same encoding as the native filesystem is using.
--    GI_TYPE_TAG_ARRAY     an array
--    GI_TYPE_TAG_INTERFACE an extended interface object
--    GI_TYPE_TAG_GLIST     a GList
--    GI_TYPE_TAG_GSLIST    a GSList
--    GI_TYPE_TAG_GHASH     a GHashTable
--    GI_TYPE_TAG_ERROR     a GError
--    GI_TYPE_TAG_UNICHAR   Unicode character
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
--   G_TYPE_TAG_IS_BASIC()
-- 
--  #define G_TYPE_TAG_IS_BASIC(tag) (tag < GI_TYPE_TAG_ARRAY || tag == GI_TYPE_TAG_UNICHAR)
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
	tag_to_string (a_tag: GITYPE_TAG_ENUM): FIXED_STRING is
		-- A a string representation of `a_tag' type 
		do
			create Result.from_external(g_type_tag_to_string(a_tag.value))
		end
    
	is_pointer: BOOLEAN is
        -- Is the type passed by reference? Usually in C libraries references are implemented using pointer
    do
        Result:=g_type_info_is_pointer(handle).to_boolean
    end
    
    tag: GITYPE_TAG_ENUM is
        -- The type tag for the type. See GITypeTag for a list of type tags.
    do
        Result.set(g_type_info_get_tag(handle))
	end

-- TODO: What's the usage of  g_type_info_get_param_type () ??
-- 
--  GITypeInfo *        g_type_info_get_param_type          (GITypeInfo *info,
--                                                           gint n);
-- 
--    Obtain the parameter type n.
-- 
--    info :    a GITypeInfo
--    n :       index of the parameter
--    Returns : the param type info. [transfer full]
-- 
	
	interface: GI_BASE_INFO is
		-- Full informations about the referenced type. THis applies only to
		-- types which have GI_TYPE_TAG_INTERFACE such as GObjects and boxed
		-- values.
		-- You can then inspect the type of the returned GIBaseInfo to further
		-- query whether it is a concrete GObject, a GInterface, a structure,
		-- etc. using  the `type' query or ?= operator.

		-- Void when Current is neither a GObject or a boxed value.
		local res: POINTER
		do
			res := g_type_info_get_interface (handle) -- Note: full transfer
			if res.is_not_null then
				Result := wrapper(res)
			end
		end

	array_length: INTEGER is
		-- The array length of the type. The type tag must be a GI_TYPE_TAG_ARRAY or -1 will returned.
		do
			Result := g_type_info_get_array_length(handle)
		end

	fixed_array_size: INTEGER is
		--    Obtain the fixed array size of the type. The type tag must be a GI_TYPE_TAG_ARRAY or -1 will returned.
		do
			Result := g_type_info_get_array_fixed_size (handle)
		end

	is_zero_terminated: BOOLEAN is	
		--  Is the last element of the array NULL? The type tag must be a GI_TYPE_TAG_ARRAY or FALSE will returned.
	do
		Result:= g_type_info_is_zero_terminated (handle).to_boolean
	end
--   g_type_info_get_array_type ()
-- 
--  GIArrayType         g_type_info_get_array_type          (GITypeInfo *info);
-- 
--    Obtain the array type for this type. See GIArrayType for a list of possible values. If the type tag of this type is not
--    array, -1 will be returned.
-- 
--    info :    a GITypeInfo
--    Returns : the array type or -1
-- 
end -- class GI_TYPE_INFO

-- Copyright (C) 2013-2017: , 2016 Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
