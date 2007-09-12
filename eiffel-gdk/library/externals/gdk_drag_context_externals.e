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
	gtk_drag_finish (a_ptr: POINTER; success, delete, time: INTEGER) is
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_context_parent_instance (a_drag_context: POINTER): POINTER is
		external "C inline use <gdk/gdk.h>"
		alias "&(((GdkDragContext*) $a_drag_context)->parent_instance)"
		end

	gdk_drag_context_protocol (a_drag_context: POINTER): POINTER is
		external "C struct GdkDragContext get protocol use <gdk/gdk.h>"
		end

	gdk_drag_context_is_source (a_drag_context: POINTER): INTEGER is
		external "C struct GdkDragContext get is_source use <gdk/gdk.h>"
		end

	gdk_drag_context_source_window (a_drag_context: POINTER): POINTER is
		external "C struct GdkDragContext get source_window use <gdk/gdk.h>"
		end

	gdk_drag_context_dest_window (a_drag_context: POINTER): POINTER is
		external "C struct GdkDragContext get dest_window use <gdk/gdk.h>"
		end

	gdk_drag_context_targets (a_drag_context: POINTER): POINTER is
		external "C struct GdkDragContext get targets use <gdk/gdk.h>"
		end

	gdk_drag_context_actions (a_drag_context: POINTER): INTEGER is
		external "C struct GdkDragContext get actions use <gdk/gdk.h>"
		end

	gdk_drag_context_suggested_action (a_drag_context: POINTER): INTEGER is
		external "C struct GdkDragContext get suggested_action use <gdk/gdk.h>"
		end

	gdk_drag_context_action (a_drag_context: POINTER): INTEGER is
		external "C struct GdkDragContext get action use <gdk/gdk.h>"
		end

	gdk_drag_context_start_time (a_drag_context: POINTER): INTEGER_64 is
		external "C struct GdkDragContext get start_time use <gdk/gdk.h>"
		end

	-- GdkAtom gdk_drag_get_selection (GdkDragContext *context);
	
	gdk_drag_abort (a_drag_context: POINTER; a_time: INTEGER_32) is
			-- void gdk_drag_abort (GdkDragContext *context, guint32 time_);

			-- TODO: use NATURAL_32
		external "C inline use <gdk/gdk.h>"
		alias "gdk_drag_abort($a_drag_context, (guint32) $a_time)"
		end

	gdk_drop_reply (a_drag_context: POINTER; an_ok_bool: INTEGER; a_time: INTEGER_32) is
			-- void gdk_drop_reply (GdkDragContext *context, gboolean ok, guint32 time_);

			-- TODO: use NATURAL_32		
		external "C inline use <gdk/gdk.h>"
		alias "gdk_drop_reply($a_drag_context, $an_ok_bool, (guint32) a_time)"
		end

	gdk_drag_context_new: POINTER is
			-- GdkDragContext* gdk_drag_context_new (void);
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_drop (a_drag_context: POINTER; a_time: INTEGER_32) is
			-- void gdk_drag_drop (GdkDragContext *context, guint32 time_);

			-- TODO: use NATURAL_32
		external "C inline use <gdk/gdk.h>"
		alias "gdk_drag_drop($a_drag_context,(guint32) $a_time)"
		end

	gdk_drag_find_window (a_drag_context, a_drag_window: POINTER; an_x_root, an_y_root: INTEGER; gdk_dest_window_ref, gdk_drag_protocol: POINTER) is
			-- void gdk_drag_find_window (GdkDragContext *context,
			-- GdkWindow *drag_window, gint x_root, gint y_root,
			-- GdkWindow **dest_window, GdkDragProtocol *protocol);
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_find_window_for_screen (a_drag_context, a_gdk_drag_window, a_gdk_screen: POINTER; an_x_root, an_y_root: INTEGER; a_gdkwindow_ref, a_gdkdragprotocol: POINTER) is
			-- void gdk_drag_find_window_for_screen (GdkDragContext *context, GdkWindow *drag_window, GdkScreen *screen, gint x_root, gint y_root, GdkWindow **dest_window, GdkDragProtocol *protocol);
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_context_ref (a_drag_context: POINTER) is
			-- void gdk_drag_context_ref (GdkDragContext *context);
		external "C use <gdk/gdk.h>"
		end
	
	gdk_drag_begin (a_window, some_targets: POINTER): POINTER is
			-- GdkDragContext* gdk_drag_begin (GdkWindow *window, GList
			-- *targets);
		external "C use <gdk/gdk.h>"
		end

	gdk_drag_motion (a_drag_context, a_gdk_window: POINTER; a_protocol, an_x_root, an_y_root, a_suggested_gdk_drag_action, some_gdk_drag_action_possible_actions: INTEGER; a_time: INTEGER): INTEGER is
			-- gboolean gdk_drag_motion (GdkDragContext *context, GdkWindow *dest_window, GdkDragProtocol protocol, gint x_root, gint y_root, GdkDragAction suggested_action, GdkDragAction possible_actions, guint32 time_);

			-- TODO: use NATURAL_32
		external "C alias use <gdk/gdk.h>"
		alias "gdk_drag_motion ($a_drag_context, $a_gdk_window, $a_protocol, $an_x_root, $an_y_root, $a_suggested_gdk_drag_action, $some_gdk_drag_action_possible_actions, (guint32) a_time"
		end

	gdk_drag_get_protocol (a_xid: INTEGER; a_gdk_drag_protocol: POINTER): INTEGER is
			-- guint32 gdk_drag_get_protocol (guint32 xid, GdkDragProtocol *protocol);

			-- TODO: use NATURAL_32
		external "C alias use <gdk/gdk.h>"
		alias "(gint) gdk_drag_get_protocol ((guint32) $a_xid, $a_gdk_drag_protocol)"
		end

	gdk_drag_get_protocol_for_display (a_display: POINTER; a_xid: INTEGER_32; a_protocol: POINTER): INTEGER_32 is
			-- guint32 gdk_drag_get_protocol_for_display (GdkDisplay
			-- *display, guint32 xid, GdkDragProtocol *protocol);

			-- TODO: use NATURAL_32
		external "C alias use <gdk/gdk.h>"
		alias "(gint32) gdk_drag_get_protocol_for_display ($a_display, (guint_32) $a_xid, $a_protocol)"
		end

	-- enum GdkDragProtocol;
	
	gdk_drag_context_unref (a_drag_context: POINTER) is
			-- void gdk_drag_context_unref (GdkDragContext *context);
		external "C use <gdk/gdk.h>"
		end

	-- enum GdkDragAction;
	gdk_drag_status (a_drag_context: POINTER; a_gdk_drag_action: INTEGER; a_time: INTEGER_32) is
			-- void gdk_drag_status (GdkDragContext *context,
			-- GdkDragAction action, guint32 time_);

			-- TODO: use NATURAL_32
		external "C alias use <gdk/gdk.h>"
		alias "gdk_drag_status($a_drag_context, $a_gdk_drag_action, (guint32) $a_time)"
		end

	gdk_drag_drop_succeeded (a_drag_context: POINTER): INTEGER is
			-- gboolean gdk_drag_drop_succeeded (GdkDragContext *context);
		external "C use <gdk/gdk.h>"
		end
end -- class GDK_DRAG_CONTEXT_EXTERNALS
