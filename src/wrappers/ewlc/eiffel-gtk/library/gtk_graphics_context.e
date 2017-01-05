note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_GRAPHICS_CONTEXT
	-- Graphics context picked from a shared pool of GdkGC
	-- objects. When a new GdkGC is needed, `make' is called with the
	-- required depth, colormap and GdkGCValues. If a GdkGC with the
	-- required properties already exists then that is returned. If
	-- not, a new GdkGC is created. When the GdkGC is no longer needed,
	-- `dispose' should be called.

inherit C_STRUCT
	
create {ANY} from_external_pointer

feature {} -- Creation
	-- TODO: implement creation

	--  gtk_gc_get ()
	--
	-- GdkGC*      gtk_gc_get                      (gint depth,
	--                                              GdkColormap *colormap,
	--                                              GdkGCValues *values,
	--                                              GdkGCValuesMask values_mask);
	--
	--   Gets a GdkGC with the given depth, colormap and GdkGCValues. If a GdkGC
	--   with the given properties already exists then it is returned, otherwise a
	--   new GdkGC is created. The returned GdkGC should be released with
	--   gtk_gc_release() when it is no longer needed.
	--
	--   depth :       the depth of the GdkGC to create.
	--   colormap :    the GdkColormap (FIXME: I don't know why this is needed).
	--   values :      a GdkGCValues struct containing settings for the GdkGC.
	--   values_mask : a set of flags indicating which of the fields in values has
	--                 been set.
	--   Returns :     a GdkGC.

feature {ANY} 
	dispose
			--   Releases a GdkGC.
		do
			gtk_gc_release(handle)
		end

feature {} -- External calls
	gtk_gc_get (a_depth: INTEGER; a_colormap, some_gc_values: POINTER; somegdkgcvaluesmask: INTEGER): POINTER
			-- GdkGC* gtk_gc_get (gint depth, GdkColormap *colormap,
			-- GdkGCValues *values, GdkGCValuesMask values_mask);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_gc_release (a_gc: POINTER)
			-- void gtk_gc_release (GdkGC *gc);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkGC)"
		end

end -- class  GTK_GRAPHICS_CONTEXT
