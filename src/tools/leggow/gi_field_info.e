class GI_FIELD_INFO
	-- A GObject Introspection metadata representing a field of a structure or of a union.

inherit GI_BASE_INFO

insert GIFIELDINFO_EXTERNALS

create {GI_INFO_FACTORY, GI_OBJECT_INFO, GI_STRUCT_INFO, GI_UNION_INFO} from_external_pointer

feature {ANY} -- Wrapper
	emit_wrapper is
		do
			("GI_field: #(1)%N" # name).print_on(std_output)
		end

	eiffel_wrapper: ABSTRACT_STRING is
		do
			Result := " -- GI_FIELD_INFO not_yet_implemented"
		end

    suffix: STRING is ""


feature {ANY} --
	is_readable: BOOLEAN is
		do
			Result := flags.is_readable
		end

	is_writable: BOOLEAN is
		do
			Result:= flags.is_writable
		end

	flags: GIFIELD_INFO_FLAGS_ENUM is 
		do
			Result.set(g_field_info_get_flags(handle))
		end

	size: INTEGER is
		-- the size in bits of the field. this is how much space you need to allocate to store the field.
	do
		Result := g_field_info_get_size(handle)
	ensure non_negative: Result>=0
	end
			
	offset: INTEGER is
		-- the offset in bits of the field member, this is relative to the
		-- beginning of the struct or union.
	do
		Result := g_field_info_get_offset(handle)
	ensure Result>=0
	end 

  	field_type: GI_TYPE_INFO is
		-- the type of a field as a GITypeInfo.
	do
		create Result.from_external_pointer(g_field_info_get_type(handle))
		-- g_field_info_get_type returns the GITypeInfo. Free the struct by
		-- calling g_base_info_unref() when done. [transfer full]
	ensure not_void: Result/=Void
	end

feature {} -- Unwrapped
-- 	g_field_info_get_field ()
-- 
--  gboolean            g_field_info_get_field              (GIFieldInfo *field_info,
--                                                           gpointer mem,
--                                                           GIArgument *value);
-- 
--    Reads a field identified by a GFieldInfo from a C structure or union. This only handles fields of simple C types. It will fail for a field
--    of a composite type like a nested structure or union even if that is actually readable.
-- 
--    field_info : a GIFieldInfo
--    mem :        pointer to a block of memory representing a C structure or union
--    value :      a GIArgument into which to store the value retrieved
--    Returns :    TRUE if reading the field succeeded, otherwise FALSE
-- 
--    ------------------------------------------------------------------------------------------------------------------------------------------
-- 
--   g_field_info_set_field ()
-- 
--  gboolean            g_field_info_set_field              (GIFieldInfo *field_info,
--                                                           gpointer mem,
--                                                           const GIArgument *value);
-- 
--    Writes a field identified by a GFieldInfo to a C structure or union. This only handles fields of simple C types. It will fail for a field
--    of a composite type like a nested structure or union even if that is actually writable. Note also that that it will refuse to write fields
--    where memory management would by required. A field with a type such as 'char *' must be set with a setter function.
-- 
--    field_info : a GIFieldInfo
--    mem :        pointer to a block of memory representing a C structure or union
--    value :      a GIArgument holding the value to store
--    Returns :    TRUE if writing the field succeeded, otherwise FALSE
end -- class GI_FIELD_INFO

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
	
