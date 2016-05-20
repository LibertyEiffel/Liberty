note
	description: "Enum "
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

deferred class GTK_ICON_LOOKUP_FLAGS
	--    Used to specify options for gtk_icon_theme_lookup_icon()
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	are_valid_lookup_flags (some_flags: INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (gtk_icon_lookup_no_svg |
										  gtk_icon_lookup_force_svg |
										  gtk_icon_lookup_use_builtin)).to_boolean
		end

	gtk_icon_lookup_no_svg: INTEGER is
			-- Never return SVG icons, even if gdk-pixbuf supports
			-- them. Cannot be used together with
			-- GTK_ICON_LOOKUP_FORCE_SVG.
		external "C macro <gtk/gtk.h>"
		alias "GTK_ICON_LOOKUP_NO_SVG"
		end
	
	gtk_icon_lookup_force_svg: INTEGER is
			-- Return SVG icons, even if gdk-pixbuf doesn't support
			-- them. Cannot be used together with GTK_ICON_LOOKUP_NO_SVG.
		external "C macro <gtk/gtk.h>"
		alias "GTK_ICON_LOOKUP_FORCE_SVG"
		end
	
	gtk_icon_lookup_use_builtin: INTEGER is
			-- When passed to gtk_icon_theme_lookup_icon() includes
			-- builtin icons as well as files. For a builtin icon,
			-- gtk_icon_info_get_filename() returns NULL and you need to
			-- call gtk_icon_info_get_builtin_pixbuf().
		external "C macro <gtk/gtk.h>"
		alias "GTK_ICON_LOOKUP_USE_BUILTIN"
		end

end
