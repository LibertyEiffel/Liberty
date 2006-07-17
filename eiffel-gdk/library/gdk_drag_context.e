indexing
	description: "GdkDragContext structure"
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

class GDK_DRAG_CONTEXT

	-- GdkDragContext
	
	-- typedef struct {
	--   GObject parent_instance;
	--   GdkDragProtocol protocol;
	--   gboolean is_source;
	--   GdkWindow *source_window;
	--   GdkWindow *dest_window;
	--   GList *targets;
	--   GdkDragAction actions;
	--   GdkDragAction suggested_action;
	--   GdkDragAction action; 
	--   guint32 start_time;
	-- } GdkDragContext;
	-- 

	-- A GdkDragContext holds information about a drag in progress. It
	-- is used on both source and destination sides.

inherit
	SHARED_C_STRUCT
	GDK_DRAG_CONTEXT_EXTERNALS
	GDK_DRAG_ACTION

creation from_external_pointer

feature -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkDragContext)"
		end

feature -- Representation

	parent_instance: G_OBJECT is
			-- the parent instance
		local
			object: POINTER
			retriever: G_RETRIEVER [G_OBJECT]
		do
			object := gdk_drag_context_parent_instance (handle)
			if retriever.has_eiffel_wrapper_stored (object) then
				Result := retriever.retrieve_eiffel_wrapper_from_gobject_pointer (object)
			else -- XXX: check this!
				--create Result.from_external_pointer (object)
			end
		end

	protocol: INTEGER is -- GdkDragProtocol
			-- the DND protocol which governs this drag
		do
		end

	is_source: BOOLEAN is
			-- true if the context is used on the source side
		do
			Result := gdk_drag_context_is_source (handle).to_boolean
		end

	source_window: GDK_WINDOW is
			-- the source of this drag
		local
			window: POINTER
			retriever: G_RETRIEVER [GDK_WINDOW]
		do
			window := gdk_drag_context_source_window (handle)
			if retriever.has_eiffel_wrapper_stored (window) then
				Result := retriever.retrieve_eiffel_wrapper_from_gobject_pointer (window)
			else
				create Result.from_external_pointer (window)
			end
		end

	dest_window: GDK_WINDOW is
			-- the destination window of this drag
		local
			window: POINTER
			retriever: G_RETRIEVER [GDK_WINDOW]
		do
			window := gdk_drag_context_dest_window (handle)
			if retriever.has_eiffel_wrapper_stored (window) then
				Result := retriever.retrieve_eiffel_wrapper_from_gobject_pointer (window)
			else
				create Result.from_external_pointer (window)
			end
		end

--	targets: G_LIST
			-- a list of targets offered by the source

	actions: INTEGER is -- GdkDragAction
			-- a bitmask of actions proposed by the source when suggested_action is GDK_ACTION_ASK
		do
			Result := gdk_drag_context_actions (handle)
		ensure
			is_valid_gdk_drag_action (Result)
		end

	suggested_action: INTEGER is -- GdkDragAction
			-- the action suggested by the source
		do
			Result := gdk_drag_context_suggested_action (handle)
		ensure
			is_valid_gdk_drag_action (Result)
		end

	action: INTEGER is -- GdkDragAction
			-- the action chosen by the destination
		do
			Result := gdk_drag_context_action (handle)
		ensure
			is_valid_gdk_drag_action (Result)
		end

	start_time: INTEGER_64 is
			-- a timestamp recording the start time of this drag
		do
			Result := gdk_drag_context_start_time (handle)
		end

end -- class GDK_DRAG_CONTEXT
