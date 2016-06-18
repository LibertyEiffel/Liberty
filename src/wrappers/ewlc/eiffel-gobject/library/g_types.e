note
	description: "The numerical values of fundamental GTypes"
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

deferred class G_TYPES

inherit ANY undefine is_equal, copy end

insert G_TYPE_EXTERNALS
	
feature {} --  numerical values of fundamental GTypes
	-- Note: in libglib 2.9.1 "typedef gulong GType;" (Paolo
	-- 2006-01-07)
	g_type_invalid: INTEGER
			-- An invalid GType, used as error return value in some functions which
			-- return a GType.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_INVALID"
		end
	g_type_none: INTEGER
			-- A fundamental type which is used as a replacement for the C void return type.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_NONE"
		end
	g_type_interface: INTEGER
			-- The fundamental type from which all interfaces are derived.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_INTERFACE"
		end
	g_type_char: INTEGER
			-- The fundamental type corresponding to gchar.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_CHAR"
		end
	g_type_uchar: INTEGER
			-- The fundamental type corresponding to guchar.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_UCHAR"
		end
	g_type_boolean: INTEGER
			-- The fundamental type corresponding to gboolean.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_BOOLEAN"
		end
	g_type_int: INTEGER
			-- The fundamental type corresponding to gint.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_INT"
		end
	g_type_uint: INTEGER
			-- The fundamental type corresponding to guint.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_UINT"
		end
	g_type_long: INTEGER
			-- The fundamental type corresponding to glong.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_LONG"
		end
	g_type_ulong: INTEGER
			-- The fundamental type corresponding to gulong.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_ULONG"
		end
	g_type_int_64: INTEGER
			-- The fundamental type corresponding to gint64.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_INT_64"
		end
	g_type_uint_64: INTEGER
			-- -- The fundamental type corresponding to guint64.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_UINT_64"
		end
	g_type_enum: INTEGER
			-- The fundamental type from which all enumeration types are derived.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_ENUM"
		end

	g_type_flags: INTEGER
			-- The fundamental type from which all flags types are derived.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_FLAGS"
		end
	g_type_float: INTEGER
			-- The fundamental type corresponding to gfloat.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_FLOAT"
		end
	g_type_double: INTEGER
			-- The fundamental type corresponding to gdouble.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_DOUBLE"
		end
	g_type_string: INTEGER
			-- The fundamental type corresponding to nul-terminated C strings.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_STRING"
		end
	g_type_pointer: INTEGER
			-- The fundamental type corresponding to gpointer.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_POINTER"
		end
	g_type_boxed: INTEGER
			-- The fundamental type from which all boxed types are derived.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_BOXED"
		end
	g_type_param: INTEGER
			-- The fundamental type from which all GParamSpec types are derived.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM"
		end
	g_type_object: INTEGER
			-- The fundamental type for GObject.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_OBJECT"
		end

invariant g_type_is_32_bit: g_type.object_size = 4	
end -- class G_TYPES
