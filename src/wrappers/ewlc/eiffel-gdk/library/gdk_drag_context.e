note
	description: "GdkDragContext structure"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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
	G_OBJECT

insert
	GDK_DRAG_CONTEXT_EXTERNALS
	GDK_DRAG_ACTION

create {ANY} from_external_pointer, secondary_wrapper_from

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkDragContext)"
		end

feature {ANY} -- Operations

	finish (success, delete: BOOLEAN; time: INTEGER)
			-- Informs the drag source that the drop is finished, and
			-- that the data of the drag will no longer be required.
			-- `success': a flag indicating whether the drop was successful
			-- `delete': a flag indicating whether the source should delete the original data. (This should be TRUE for a move)
			-- `time': the timestamp from the "drag_data_drop" signal.
		require
			--time >= 0
		do
			gtk_drag_finish (handle, success.to_integer, delete.to_integer, time)
		end

	status (an_action: INTEGER; time: INTEGER)
			-- Selects one of the actions offered by the drag source.
			
			-- This function is called by the drag destination in
			-- response to gdk_drag_motion() called by the drag source.
			
			-- `an_action': the selected action which will be taken when a drop happens, or 0 to indicate that a drop will not be accepted.
			-- `time': the timestamp for this operation. 
		require
			--time >= 0
			is_valid_gdk_drag_action (an_action)
		do
			gdk_drag_status (handle, an_action, time)
		end

feature {ANY} -- Representation

	parent_instance: G_OBJECT
			-- the parent instance
		local factory: G_OBJECT_EXPANDED_FACTORY[G_OBJECT]
		do
			Result := factory.wrapper(gdk_drag_context_parent_instance (handle))
		end

	protocol: INTEGER is -- GdkDragProtocol
			-- the DND protocol which governs this drag
		do
		end

	is_source: BOOLEAN
			-- true if the context is used on the source side
		do
			Result := gdk_drag_context_is_source (handle).to_boolean
		end

	source_window: GDK_WINDOW
			-- the source of this drag
		local window: POINTER; factory: G_OBJECT_EXPANDED_FACTORY[GDK_WINDOW]
		do
			window := gdk_drag_context_source_window (handle) 
			Result := factory.existant_wrapper(window)
			if Result=Void then
				create Result.from_external_pointer (window)
			end
		end

	dest_window: GDK_WINDOW
			-- the destination window of this drag
		local
			window: POINTER
			factory: G_OBJECT_EXPANDED_FACTORY[GDK_WINDOW]
		do
			window := gdk_drag_context_dest_window (handle)
			Result := factory.existant_wrapper (window)
			if Result=Void then
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

	start_time: INTEGER_64
			-- a timestamp recording the start time of this drag
		do
			Result := gdk_drag_context_start_time (handle)
		end

end -- class GDK_DRAG_CONTEXT
