note
	description: "A widget which is not displayed."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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

deferred class GTK_INVISIBLE
	-- GtkInvisible — A widget which is not displayed
	
	-- The GtkInvisible widget is used internally in GTK+, and is
	-- probably not very useful for application developers.
	
	-- It is used for reliable pointer grabs and selection handling in
	-- the code for drag-and-drop.

	-- inherit
	-- 	(SHARED_?)C_STRUCT

	-- insert
	-- 	FOO_EXTERNALS

	-- creation make, from_external_pointer

	-- feature {} -- Creation
	-- Prev 	Up 	Home 	GTK+ Reference Manual 	Next
	-- Top  |  Description  |  Object Hierarchy  |  Implemented Interfaces  |  Properties
	-- GtkInvisible


	
	-- Synopsis

	-- #include <gtk/gtk.h>


	--             GtkInvisible;
	-- GtkWidget*  gtk_invisible_new               (void);
	-- GtkWidget*  gtk_invisible_new_for_screen    (GdkScreen *screen);
	-- void        gtk_invisible_set_screen        (GtkInvisible *invisible,
	--                                              GdkScreen *screen);
	-- GdkScreen*  gtk_invisible_get_screen        (GtkInvisible *invisible);



	-- Object Hierarchy

	--   GObject
	--    +----GInitiallyUnowned
	--          +----GtkObject
	--                +----GtkWidget
	--                      +----GtkInvisible

	-- Implemented Interfaces

	-- GtkInvisible implements AtkImplementorIface.
	-- Properties

	--   "screen"               GdkScreen             : Read / Write

	-- Details
	-- GtkInvisible

	-- typedef struct _GtkInvisible GtkInvisible;

	-- The GtkInvisible struct contains no public fields.
	-- gtk_invisible_new ()

	-- GtkWidget*  gtk_invisible_new               (void);

	-- Creates a new GtkInvisible.

	-- Returns : 	a new GtkInvisible.
	-- gtk_invisible_new_for_screen ()

	-- GtkWidget*  gtk_invisible_new_for_screen    (GdkScreen *screen);

	-- Creates a new GtkInvisible object for a specified screen

	-- screen : 	a GdkScreen which identifies on which the new GtkInvisible will be created.
	-- Returns : 	a newly created GtkInvisible object

	-- Since 2.2
	-- gtk_invisible_set_screen ()

	-- void        gtk_invisible_set_screen        (GtkInvisible *invisible,
	--                                              GdkScreen *screen);

	-- Sets the GdkScreen where the GtkInvisible object will be displayed.

	-- invisible : 	a GtkInvisible.
	-- screen : 	a GdkScreen.

	-- Since 2.2
	-- gtk_invisible_get_screen ()

	-- GdkScreen*  gtk_invisible_get_screen        (GtkInvisible *invisible);

	-- Returns the GdkScreen object associated with invisible

	-- invisible : 	a GtkInvisible.
	-- Returns : 	the associated GdkScreen.

	-- Since 2.2
	-- Property Details
	-- The "screen" property

	--   "screen"               GdkScreen             : Read / Write

	-- The screen where this window will be displayed.
end -- class GTK_INVISIBLE
