note
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
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_OBJECT
	-- GtkObject is the base class for all widgets, and for a few
	-- non-widget objects such as GtkAdjustment. GtkObject predates
	-- GObject; non-widgets that derive from GtkObject rather than
	-- GObject do so for backward compatibility reasons.
	
	-- The most interesting difference between GtkObject and GObject is
	-- the "floating" reference count. A GObject is created with a
	-- reference count of 1, owned by the creator of the GObject. (The
	-- owner of a reference is the code section that has the right to
	-- call g_object_unref() in order to remove that reference.) A
	-- GtkObject is created with a reference count of 1 also, but it
	-- isn't owned by anyone; calling g_object_unref() on the
	-- newly-created GtkObject is incorrect. Instead, the initial
	-- reference count of a GtkObject is "floating". The floating
	-- reference can be removed by anyone at any time, by calling
	-- gtk_object_sink(). gtk_object_sink() does nothing if an object
	-- is already sunk (has no floating reference).

	-- When you add a widget to its parent container, the parent
	-- container will do this:
	
	-- child_widget.ref; child_widget.sink

	-- This means that the container now owns a reference to the child
	-- widget (since it called `ref'), and the child widget has no
	-- floating reference.

	-- The purpose of the floating reference is to keep the child
	-- widget alive until you add it to a parent container:
	
	-- create button.make -- button has one floating reference to keep
	-- it alive container.add(button) -- button has one non-floating
	-- reference owned by the container

	-- GtkWindow is a special case, because GTK+ itself will ref/sink
	-- it on creation. That is, after calling `make,' the GtkWindow
	-- will have one reference which is owned by GTK+, and no floating
	-- references.

	-- One more factor comes into play: the "destroy" signal, emitted
	-- by the `destroy' method. The "destroy" signal asks all code
	-- owning a reference to an object to release said reference. So,
	-- for example, if you call `destroy' on a GtkWindow, GTK+ will
	-- release the reference count that it owns; if you call `destroy'
	-- on a GtkButton, then the button will be removed from its parent
	-- container and the parent container will release its reference to
	-- the button. Because these references are released, calling
	-- `destroy' should result in freeing all memory associated with an
	-- object, unless some buggy code fails to release its references
	-- in response to the "destroy" signal. Freeing memory (referred to
	-- as finalization only happens if the reference count reaches
	-- zero.

	-- Some simple rules for handling GtkObject:

	-- * Never call `unref' unless you have previously called `ref'
	--   even if you created the GtkObject. (Note: this is not true for
	--   GObject; for GObject, the creator of the object owns a
	--   reference.)

	-- * Call `destroy' to get rid of most objects in most cases. In
	--   particular, widgets are almost always destroyed in this way.

	-- * Because of the floating reference count, you don't need to
	--   worry about reference counting for widgets and toplevel
	--   windows, unless you explicitly call `ref' yourself.

inherit
	G_OBJECT
		-- undefine make
		redefine store_eiffel_wrapper
		end

insert
	GTK -- that provides the gtk singleton.
	GTK_OBJECT_EXTERNALS

feature {ANY}
	sink
			-- Removes the floating reference from a GtkObject, if it exists;
			-- otherwise does nothing. See the GtkObject overview documentation at
			-- the top of the page.
		do
			gtk_object_sink (handle)
		end

	destroy
			-- Emits the "destroy" signal notifying all reference holders that they
			-- should release the GtkObject. See the overview documentation at the
			-- top of the page for more details.  The memory for the object itself
			-- won't be deleted until its reference count actually drops to 0;
			-- destroy merely asks reference holders to release their references,
			-- it does not free the object.
		do
			gtk_object_destroy (handle)
		end

	store_eiffel_wrapper
		do
			Precursor
			ref -- This takes care of sinking the object and/or adding a reference
		end

feature {ANY} -- Signals
	-- The "destroy" signal

	-- void user_function (GtkObject *object, gpointer user_data);

	-- Signals that all holders of a reference to the GtkObject should
	-- release the reference that they hold. May result in finalization
	-- of the object if all references are released.
	
	-- object : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.

	connect_to_destroy_signal,
	connect_agent_to_destroy_signal (a_procedure: PROCEDURE[TUPLE[GTK_OBJECT]])
			-- Connect `a_procedure' but invokes the fixed
			-- `destroy_callback' special feature."
		local destroy_callback: DESTROY_CALLBACK
		do
			create destroy_callback.make
			destroy_callback.connect (Current, a_procedure)
			-- The above is just a shorter version of 
			-- create destroy_callback.make
			-- destroy_callback.connect (Current, a_procedure)
		end
	
	-- TODO: implement a enable_on_destroy and on_destroy

	enable_on_destroy
			-- Connects "destroy" signal to `on_destroy' feature.
		do
			connect (Current, destroy_signal_name, $on_destroy)
		end

	on_destroy
			-- Called on destroy signals. Redefine it in your heir classes
		do
		end

feature {} -- Signal names
	destroy_signal_name: STRING is "destroy"

invariant
		gtk_initialized: gtk.is_initialized
end
