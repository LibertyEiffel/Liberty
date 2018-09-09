note
	description: "GtkArrow: Displays an arrow."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

class GTK_ARROW
	-- GtkArrow should be used to draw simple arrows that need to point
	-- in one of the four cardinal directions (up, down, left, or
	-- right). The style of the arrow can be one of shadow in, shadow
	-- out, etched in, or etched out. Note that these directions and
	-- style types may be ammended in versions of Gtk to come.
	
	-- GtkArrow will fill any space alloted to it, but since it is
	-- inherited from GtkMisc, it can be padded and/or aligned, to fill
	-- exactly the space the programmer desires.

	-- Arrows are created with a call to `make'. The direction or style
	-- of an arrow can be changed after creation by using `set'.
	
inherit GTK_MISC
	--   GtkArrow implements AtkImplementorIface.
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_type, a_shadow: INTEGER)
			--   Creates a new arrow widget.
		require
			valid_type: is_valid_gtk_arrow_type (a_type)
			valid_shadow: is_valid_gtk_shadow_type (a_shadow)
		do
			from_external_pointer(gtk_arrow_new(a_type, a_shadow))
		end
feature {ANY}
	set(a_type, a_shadow: INTEGER)
			--   Sets the direction and style of the GtkArrow.
		require
			valid_type: is_valid_gtk_arrow_type (a_type)
			valid_shadow: is_valid_gtk_shadow_type (a_shadow)
		do
			gtk_arrow_set(handle,a_type,a_shadow)
		end
	
feature {ANY} -- TODO: Property Details
	--
	--  The "arrow-type" property
	--
	--   "arrow-type"           GtkArrowType          : Read / Write
	--
	--   The direction the arrow should point.
	--
	--   Default value: GTK_ARROW_RIGHT
	--
	--   --------------------------------------------------------------------------
	--
	--  The "shadow-type" property
	--
	--   "shadow-type"          GtkShadowType         : Read / Write
	--
	--   Appearance of the shadow surrounding the arrow.
	--
	--   Default value: GTK_SHADOW_OUT
	--
	--See Also
	--
	--   gtk_paint_arrow() the function used internally to paint the arrow.

feature {} -- External calls
	gtk_arrow_new (an_arrow_type, a_shadow_type: INTEGER): POINTER
			-- GtkWidget* gtk_arrow_new (GtkArrowType arrow_type,
			-- GtkShadowType shadow_type);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_arrow_set (an_arrow: POINTER; an_arrow_type, a_shadow_type: INTEGER)
	-- void gtk_arrow_set (GtkArrow *arrow, GtkArrowType arrow_type, GtkShadowType shadow_type);
		external "C  use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkArrow)"
		end
end -- class GTK_ARROW
