note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GtkSourceView developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "1.8.5"

deferred class GTK_SOURCE_STYLE_SCHEME

inherit SHARED_C_STRUCT
	-- Heir of GInterface

create {ANY} dummy, make, from_external_pointer

feature {ANY} -- Creation
	tag_style (a_style_name: STRING): GTK_SOURCE_TAG_STYLE is
			-- the tag associated with the given style_name in the style scheme.		require style_name_not_void: a_style_name/=Void
		local p: POINTER
		do
			p:=(gtk_source_style_scheme_get_tag_style
				 (handle, a_style_name.to_external))
			if p.is_not_null then
				create Result.from_external_pointer(p)
			end
		end

	name: STRING is
			-- the name of the style scheme.
		do
			create {CONST_STRING}
			Result.from_external_pointer
			(gtk_source_style_scheme_get_name(handle))
		end

	
	--  gtk_source_style_scheme_get_default ()
	--
	-- GtkSourceStyleScheme* gtk_source_style_scheme_get_default
	--                                                         (void);
	--
	--   Gets the default style scheme.
	--
	--   Returns : a GtkSourceStyleScheme.
	--

	--Signals
	--
	--
	--   "style-changed"                                  : Run Last
	--Signal Details
	--
	--  The "style-changed" signal
	--
	-- void                user_function                      (GtkSourceStyleScheme *sourcestylescheme,
	--                                                         gchar                *arg1,
	--                                                         gpointer              user_data)              : Run Last
	--
	--   sourcestylescheme : the object which received the signal.
	--   arg1 :
	--   user_data :         user data set when the signal handler was connected.

feature {} -- Unwrapped
	--  GtkSourceStyleSchemeClass
	--
	-- typedef struct {
	--         GTypeInterface  base_iface;
	--
	--         /* signals */
	--         void                      (* style_changed)     (GtkSourceStyleScheme *scheme,
	--                                                          const gchar          *tag_id);
	--
	--         /* vtable */
	--         const gchar             * (* get_name)          (GtkSourceStyleScheme *scheme);
	--         GtkSourceTagStyle       * (* get_tag_style)     (GtkSourceStyleScheme *scheme,
	--                                                          const gchar          *style_name);
	--         GSList                  * (* get_style_names)   (GtkSourceStyleScheme *scheme);
	--
	--         /* Padding for future expansion */
	--         void (*_gtk_source_reserved1) (void);
	--         void (*_gtk_source_reserved2) (void);
	--         void (*_gtk_source_reserved3) (void);
	--         void (*_gtk_source_reserved4) (void);
	-- } GtkSourceStyleSchemeClass;
	--

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtksourceview/gtksourcestylescheme.h>"
		alias "sizeof(GtkSourceStyleScheme)"
		end

feature {} -- External calls
	-- #include <gtksourceview/gtksourcestylescheme.h>
	gtk_source_style_scheme_get_tag_style (a_scheme, a_style_name: POINTER): POINTER is
			-- GtkSourceTagStyle* gtk_source_style_scheme_get_tag_style
			-- (GtkSourceStyleScheme *scheme, const gchar *style_name);
		external "C use <gtksourceview/gtksourcestylescheme.h>"
		end
		
	gtk_source_style_scheme_get_name (a_scheme: POINTER): POINTER is
			-- const gchar* gtk_source_style_scheme_get_name (GtkSourceStyleScheme
			-- *scheme);
		external "C use <gtksourceview/gtksourcestylescheme.h>"
		end

	gtk_source_style_scheme_get_default: POINTER is
			-- GtkSourceStyleScheme* gtk_source_style_scheme_get_default (void);
		external "C use <gtksourceview/gtksourcestylescheme.h>"
		end
end -- class GTK_SOURCE_STYLE_SCHEME
