note
	description: "GtkViewport, An adapter which makes widgets scrollable."
	copyright: "[
					Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder
					
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

class GTK_VIEWPORT
	-- GtkViewport — An adapter which makes widgets scrollable
	
inherit GTK_BIN
	-- TODO: GtkViewport implements AtkImplementorIface.

insert GTK_ADJUSTMENT_EXTERNALS -- Needed by dummy_gobject
	
create {ANY} dummy, make, from_external_pointer

feature {} -- Creation
	make (an_orizontal_adjustment, a_vertical_adjustment: GTK_ADJUSTMENT)
			-- Creates a new GtkViewport with the given adjustments.
		require
			orizontal_adjustment_not_void: an_orizontal_adjustment /= Void
			vertical_adjustment_not_void: a_vertical_adjustment /= Void
		do
			from_external_pointer(gtk_viewport_new(an_orizontal_adjustment.handle,
																a_vertical_adjustment.handle))
		end

	-- hadjustment : 	horizontal adjustment.
	-- vadjustment : 	vertical adjustment.
	-- Returns : 	a new GtkViewport.
	-- gtk_viewport_get_hadjustment ()

	-- GtkAdjustment*      gtk_viewport_get_hadjustment        (GtkViewport *viewport);

	-- Returns the horizontal adjustment of the viewport.

	-- viewport : 	a GtkViewport.
	-- Returns : 	the horizontal adjustment of viewport.
	-- gtk_viewport_get_vadjustment ()

	-- GtkAdjustment*      gtk_viewport_get_vadjustment        (GtkViewport *viewport);

	-- Returns the vertical adjustment of the viewport.

	-- viewport : 	a GtkViewport.
	-- Returns : 	the vertical adjustment of viewport.
	-- gtk_viewport_set_hadjustment ()

	-- void                gtk_viewport_set_hadjustment        (GtkViewport *viewport,
	--                                                          GtkAdjustment *adjustment);

	-- Sets the horizontal adjustment of the viewport.

	-- viewport : 	a GtkViewport.
	-- adjustment : 	a GtkAdjustment.
	-- gtk_viewport_set_vadjustment ()

	-- void                gtk_viewport_set_vadjustment        (GtkViewport *viewport,
	--                                                          GtkAdjustment *adjustment);

	-- Sets the vertical adjustment of the viewport.

	-- viewport : 	a GtkViewport.
	-- adjustment : 	a GtkAdjustment.
	-- gtk_viewport_set_shadow_type ()

	-- void                gtk_viewport_set_shadow_type        (GtkViewport *viewport,
	--                                                          GtkShadowType type);

	-- Sets the shadow type of the viewport.

	-- viewport : 	a GtkViewport.
	-- type : 	the new shadow type.
	-- gtk_viewport_get_shadow_type ()

	-- GtkShadowType       gtk_viewport_get_shadow_type        (GtkViewport *viewport);

	-- Gets the shadow type of the GtkViewport. See gtk_viewport_set_shadow_type().

	-- viewport : 	a GtkViewport
	-- Returns : 	the shadow type
	-- Properties

	--   "hadjustment"              GtkAdjustment         : Read / Write / Construct
	--   "shadow-type"              GtkShadowType         : Read / Write
	--   "vadjustment"              GtkAdjustment         : Read / Write / Construct

	-- Property Details
	-- The "hadjustment" property

	--   "hadjustment"              GtkAdjustment         : Read / Write / Construct

	-- The GtkAdjustment that determines the values of the horizontal position for this viewport.
	-- The "shadow-type" property

	--   "shadow-type"              GtkShadowType         : Read / Write

	-- Determines how the shadowed box around the viewport is drawn.

	-- Default value: GTK_SHADOW_IN
	-- The "vadjustment" property

	--   "vadjustment"              GtkAdjustment         : Read / Write / Construct

	-- The GtkAdjustment that determines the values of the vertical position for this viewport.
	-- Signals

	--   "set-scroll-adjustments"                         : Run Last / Action


	-- Signal Details
	-- The "set-scroll-adjustments" signal

	-- void                user_function                      (GtkViewport   *viewport,
	--                                                         GtkAdjustment *arg1,
	--                                                         GtkAdjustment *arg2,
	--                                                         gpointer       user_data)      : Run Last / Action

	-- viewport : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
feature {} -- External calls
	gtk_viewport_new (a_hadjustment, a_vadjustment: POINTER): POINTER
			-- 	GtkWidget* gtk_viewport_new (GtkAdjustment *hadjustment, GtkAdjustment *vadjustment);
		external "C use <gtk/gtk.h>"
		end

	gtk_viewport_get_hadjustment (a_viewport: POINTER): POINTER
			-- 	GtkAdjustment* gtk_viewport_get_hadjustment (GtkViewport *viewport);
		external "C use <gtk/gtk.h>"
		end

 gtk_viewport_get_vadjustment (a_viewport: POINTER): POINTER
			-- 	GtkAdjustment* gtk_viewport_get_vadjustment (GtkViewport *viewport);
		external "C use <gtk/gtk.h>"
		end

 gtk_viewport_set_hadjustment (a_viewport, a_adjustment: POINTER)
			-- 	void gtk_viewport_set_hadjustment (GtkViewport *viewport, GtkAdjustment *adjustment);
		external "C use <gtk/gtk.h>"
		end

	gtk_viewport_set_vadjustment (a_viewport, a_adjustment: POINTER)
			-- 	void gtk_viewport_set_vadjustment (GtkViewport *viewport, GtkAdjustment *adjustment);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_viewport_set_shadow_type (a_viewport: POINTER; a_gtkshadowtype: INTEGER)
			-- 	void gtk_viewport_set_shadow_type (GtkViewport *viewport, GtkShadowType type);
		external "C use <gtk/gtk.h>"
		end

	gtk_viewport_get_shadow_type (a_viewport: POINTER): INTEGER
			-- 	GtkShadowType gtk_viewport_get_shadow_type (GtkViewport *viewport);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkViewport)"
		end
	dummy_gobject: POINTER
		do
			Result:=(gtk_viewport_new
						(gtk_adjustment_new
						 (0.1, 0.0, 1.0, 0.05, 0.1, 0.2),
						 gtk_adjustment_new
						 (0.1, 0.0, 1.0, 0.05, 0.1, 0.2)))
		end
end -- class GTK_VIEWPORT
