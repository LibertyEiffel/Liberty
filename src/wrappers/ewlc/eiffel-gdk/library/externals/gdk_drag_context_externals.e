note
	description: "GdkDragContext structure"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GDK_DRAG_CONTEXT_EXTERNALS

inherit ANY undefine is_equal, copy end

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

feature {} -- Representation

	gtk_drag_finish (a_ptr: POINTER; success, delete, time: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_status (a_ptr: POINTER; an_action, time: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_context_parent_instance (a_drag_context: POINTER): POINTER
		external "C inline use <gdk/gdk.h>"
		alias "&(((GdkDragContext*) $a_drag_context)->parent_instance)"
		end

	gdk_drag_context_protocol (a_drag_context: POINTER): POINTER
		external "C struct GdkDragContext get protocol use <gdk/gdk.h>"
		end

	gdk_drag_context_is_source (a_drag_context: POINTER): INTEGER
		external "C struct GdkDragContext get is_source use <gdk/gdk.h>"
		end

	gdk_drag_context_source_window (a_drag_context: POINTER): POINTER
		external "C struct GdkDragContext get source_window use <gdk/gdk.h>"
		end

	gdk_drag_context_dest_window (a_drag_context: POINTER): POINTER
		external "C struct GdkDragContext get dest_window use <gdk/gdk.h>"
		end

	gdk_drag_context_targets (a_drag_context: POINTER): POINTER
		external "C struct GdkDragContext get targets use <gdk/gdk.h>"
		end

	gdk_drag_context_actions (a_drag_context: POINTER): INTEGER
		external "C struct GdkDragContext get actions use <gdk/gdk.h>"
		end

	gdk_drag_context_suggested_action (a_drag_context: POINTER): INTEGER
		external "C struct GdkDragContext get suggested_action use <gdk/gdk.h>"
		end

	gdk_drag_context_action (a_drag_context: POINTER): INTEGER
		external "C struct GdkDragContext get action use <gdk/gdk.h>"
		end

	gdk_drag_context_start_time (a_drag_context: POINTER): INTEGER_64
		external "C struct GdkDragContext get start_time use <gdk/gdk.h>"
		end

end -- class GDK_DRAG_CONTEXT_EXTERNALS
