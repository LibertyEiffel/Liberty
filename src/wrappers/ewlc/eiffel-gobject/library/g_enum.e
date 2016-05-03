note
	description: "Enumeration type."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class G_ENUM
	-- TODO: unfinished

	-- The GLib type system provides fundamental types for enumeration
	-- and flags types. (Flags types are like enumerations, but allow
	-- their values to be combined by bitwise or). A registered
	-- enumeration or flags type associates a name and a nickname with
	-- each allowed value, and the methods g_enum_get_value_by_name(),
	-- g_enum_get_value_by_nick(), g_flags_get_value_by_name() and
	-- g_flags_get_value_by_nick() can look up values by their name or
	-- nickname. When an enumeration or flags type is registered with
	-- the GLib type system, it can be used as value type for object
	-- properties, using g_param_spec_enum() or g_param_spec_flags().
							
	-- GObject ships with a utility called glib-mkenums that can
	-- construct suitable type registration functions from C
	-- enumeration definitions.
	
inherit C_STRUCT
	
insert G_ENUM_EXTERNALS
	
-- creation from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GEnum)"
		end

feature -- TODO: typedef struct {
--   GTypeClass  g_type_class;

--   gint	      minimum;
--   gint	      maximum;
--   guint	      n_values;
--   GEnumValue *values;
-- } GEnumClass;

-- The class of an enumeration type holds information about its possible values.
-- GTypeClass g_type_class; 	the parent class
-- gint minimum; 	the smallest possible value.
-- gint maximum; 	the largest possible value.
-- guint n_values; 	the number of possible values.
-- GEnumValue *values; 	an array of GEnumValue structs describing the individual values.
feature {ANY}
	value (an_index: INTEGER): G_ENUM_VALUE is
			-- the GEnumValue for `an_index' value. Void if `an_index' 
			-- is not a member of the enumeration
		local ptr: POINTER
		do
			ptr := g_enum_get_value (handle,an_index)
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	value_by_name (a_name: STRING): G_ENUM_VALUE is
			-- the GEnumValue with `a_name', or Void if the enumeration
			-- doesn' t have a member with that name
		local ptr: POINTER
		do
			ptr := g_enum_get_value_by_name (handle, a_name.to_external)
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	value_by_nick (a_name: STRING): G_ENUM_VALUE is
			-- the GEnumValue with nickname `a_nick', or Void if the
			-- enumeration doesn' t have a member with that nickname.
		local ptr: POINTER
do
			ptr := g_enum_get_value_by_nick (handle, a_name.to_external)
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end
 
	-- TODO: Eiffelize g_enum_register_static and glib_mkenums 
	-- related tools.

	-- TODO: wrap g_enum_complete_type_info ()

	-- void        g_enum_complete_type_info       (GType g_enum_type,
	-- 															GTypeInfo *info,
	-- 															const GEnumValue *const_values);

	-- This function is meant to be called from the complete_type_info() function of a GTypePlugin implementation, as in the following example:

	-- static void
	-- my_enum_complete_type_info (GTypePlugin     *plugin,
	-- 									 GType            g_type,
	-- 									 GTypeInfo       *info,
	-- 									 GTypeValueTable *value_table)
	-- {
	--   static const GEnumValue values[] = {
	-- 	{ MY_ENUM_FOO, "MY_ENUM_FOO", "foo" },
	-- 	{ MY_ENUM_BAR, "MY_ENUM_BAR", "bar" },
	-- 	{ 0, NULL, NULL }
	--   };  
	
	--   g_enum_complete_type_info (type, info, values);  
	-- }

	-- g_enum_type : 	the type identifier of the type being completed
	-- info : 	the GTypeInfo struct to be filled in
	-- const_values : 	An array of GEnumValue structs for the possible enumeration values. The array is terminated by a struct with all members being 0.
end
