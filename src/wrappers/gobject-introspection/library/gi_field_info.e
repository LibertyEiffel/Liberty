class GI_FIELD_INFO
	-- A GObject Introspection metadata representing a struct or a union.

inherit GI_BASE_INFO

insert GIFIELDINFO_EXTERNALS

creation {GI_INFO_FACTORY} from_external_pointer

feature {ANY} --
	is_readable: BOOLEAN is
		do
			Result := flags.is_gi_field_is_readable
		end

	is_writable: BOOLEAN is
		do
			Result:= flags.is_gi_field_is_writable
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

