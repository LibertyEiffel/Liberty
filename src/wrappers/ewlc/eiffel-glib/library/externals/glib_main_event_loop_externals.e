note
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GLIB_MAIN_EVENT_LOOP_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	g_main_loop_new (a_context: POINTER; is_running_bool: INTEGER): POINTER is
			-- GMainLoop* g_main_loop_new (GMainContext *context, gboolean is_running);
		external "C use <glib.h>"
		end

	g_main_loop_ref (a_loop: POINTER): POINTER is
			-- GMainLoop* g_main_loop_ref (GMainLoop *loop);
		external "C use <glib.h>"
		end

	g_main_loop_unref (a_loop: POINTER) is
			-- void g_main_loop_unref (GMainLoop *loop);
		external "C use <glib.h>"
		end

	g_main_loop_run (a_loop: POINTER) is
			-- void g_main_loop_run (GMainLoop *loop);
		external "C use <glib.h>"
		end

	g_main_loop_quit (a_loop: POINTER) is
			-- void g_main_loop_quit (GMainLoop *loop);
		external "C use <glib.h>"
		end

	g_main_loop_is_running (a_loop: POINTER): INTEGER is
			-- gboolean g_main_loop_is_running (GMainLoop *loop);
		external "C use <glib.h>"
		end

	g_main_loop_get_context (a_loop: POINTER): POINTER is
			-- GMainContext* g_main_loop_get_context (GMainLoop *loop);
		external "C use <glib.h>"
		end


	g_main_context_new: POINTER is
			-- GMainContext* g_main_context_new (void);
		external "C use <glib.h>"
		end

	g_main_context_ref (a_context: POINTER): POINTER is
			-- GMainContext* g_main_context_ref (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_unref (a_context: POINTER) is
			-- void g_main_context_unref (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_default: POINTER is
			-- GMainContext* g_main_context_default (void);
		external "C use <glib.h>"
		end

	g_main_context_iteration (a_context: POINTER; may_block_bool: INTEGER): INTEGER is
			-- gboolean g_main_context_iteration (GMainContext *context, gboolean may_block);
		external "C use <glib.h>"
		end

	g_main_context_pending (a_context: POINTER): INTEGER is
			-- gboolean g_main_context_pending (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_find_source_by_id (a_context: POINTER; a_source_id: INTEGER): POINTER is
			-- GSource* g_main_context_find_source_by_id (GMainContext *context, guint 
			-- source_id);

			-- TODO: a_source_id should be NATURAL_32 because
		external "C use <glib.h>"
		end

	g_main_context_find_source_by_user_data (a_context, some_data: POINTER): POINTER is
			-- GSource* g_main_context_find_source_by_user_data (GMainContext *context, gpointer user_data);
		external "C use <glib.h>"
		end

	g_main_context_find_source_by_funcs_user_data (a_context, a_funcs, some_data: POINTER): POINTER is
			-- GSource* g_main_context_find_source_by_funcs_user_data (GMainContext *context, GSourceFuncs *funcs, gpointer user_data);
		external "C use <glib.h>"
		end

	g_main_context_wakeup (a_context: POINTER) is
			-- void g_main_context_wakeup (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_acquire (a_context: POINTER): INTEGER is
			-- gboolean g_main_context_acquire (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_release (a_context: POINTER) is
			-- void g_main_context_release (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_wait (a_context, a_cond, a_mutex: POINTER): INTEGER is
			-- gboolean g_main_context_wait (GMainContext *context, GCond *cond, GMutex *mutex);
		external "C use <glib.h>"
		end

	g_main_context_prepare (a_context, a_priority_ptr: POINTER): INTEGER is
			-- gboolean g_main_context_prepare (GMainContext *context, gint *priority);
		external "C use <glib.h>"
		end
	
	g_main_context_query (a_context: POINTER; a_max_priority: INTEGER; a_timeout_ptr, a_fds: POINTER; a_n_fds: POINTER): INTEGER is
			-- gint g_main_context_query (GMainContext *context, gint
			-- max_priority, gint *timeout_, GPollFD *fds, gint n_fds);
		external "C use <glib.h>"
		end

	g_main_context_check (a_context: POINTER; a_max_priority: INTEGER; a_fds: POINTER; an_n_fds: INTEGER): POINTER is
			-- gint g_main_context_check (GMainContext *context, gint max_priority, GPollFD *fds, gint n_fds);
		external "C use <glib.h>"
		end

	g_main_context_dispatch (a_context: POINTER) is
			-- void g_main_context_dispatch (GMainContext *context);
		external "C use <glib.h>"
		end

	g_main_context_set_poll_func (a_context, a_func: POINTER) is
			-- void g_main_context_set_poll_func (GMainContext *context, GPollFunc func);
		external "C use <glib.h>"
		end

	g_main_context_get_poll_func (a_context: POINTER): POINTER is
			-- GPollFunc g_main_context_get_poll_func (GMainContext *context);
		external "C use <glib.h>"
		end

	-- gint (*GPollFunc) (GPollFD *ufds, guint nfsd, gint timeout_);

	g_main_context_add_poll (a_context, an_fd: POINTER; a_priority: INTEGER) is
			-- void g_main_context_add_poll (GMainContext *context, GPollFD *fd, gint priority);
		external "C use <glib.h>"
		end

	g_main_context_remove_poll (a_context, an_fd: POINTER) is
			-- void g_main_context_remove_poll (GMainContext *context, GPollFD *fd);
		external "C use <glib.h>"
		end

	g_main_depth: INTEGER is
			-- int g_main_depth (void);
		external "C use <glib.h>"
		end

	g_idle_source_new: POINTER is
			-- GSource* g_idle_source_new (void);
		external "C use <glib.h>"
		end

	-- guint g_idle_add (GSourceFunc function, gpointer data);

	g_idle_add_full (a_priority: INTEGER; a_function, some_data, a_gdestroynotify: POINTER): INTEGER is
			-- guint g_idle_add_full (gint priority, GSourceFunc function, gpointer data, GDestroyNotify notify);
		external "C use <glib.h>"
		alias "((gint) g_idle_add_full ($a_priority, $a_function, $some_data, $a_gdestroynotify))"
		end

	g_idle_remove_by_data (some_data: POINTER): INTEGER is
			-- gboolean g_idle_remove_by_data (gpointer data);
		external "C use <glib.h>"
		end

	-- TODO: Find a portable way to wrap "typedef int GPid;" A type
	-- which is used to hold a process identification. On Unix,
	-- processes are identified by a process id (an integer), while
	-- Windows uses process handles (which are pointers).
	
	-- void (*GChildWatchFunc) (GPid pid, gint status, gpointer data);
	
	--	g_child_watch_source_new (GPid pid): POINTER is
	--		-- GSource* g_child_watch_source_new (GPid pid);
	--	external "C use <glib.h>"
	--	end

	-- guint g_child_watch_add (GPid pid, GChildWatchFunc function, gpointer data) is
	--		-- guint g_child_watch_add (GPid pid, GChildWatchFunc function, gpointer data);
	--	external "C use <glib.h>"
	--	end

	--guint g_child_watch_add_full (gint priority, GPid pid, GChildWatchFunc function, gpointer data, GDestroyNotify notify) is
	--		-- guint g_child_watch_add_full (gint priority, GPid pid, GChildWatchFunc function, gpointer data, GDestroyNotify notify);
	--	external "C use <glib.h>"
	--	end

	--  GPollFD;
	
	--  GSource;

	-- void (*GSourceDummyMarshal) (void);
	
	--  GSourceFuncs;
	--  GSourceCallbackFuncs;
	
	g_source_new (a_source_funcs: POINTER; a_struct_size: INTEGER): POINTER is
			-- GSource* g_source_new (GSourceFuncs *source_funcs, guint 
			-- struct_size);

			-- TODO: a_struct_size should be NATURAL because it is a guint
		external "C use <glib.h>"
		alias "g_source_new ($a_source_funcs, (guint) $a_struct_size)"
		end

	g_source_ref (a_source: POINTER): POINTER is
			-- GSource* g_source_ref (GSource *source);
		external "C use <glib.h>"
		end

	g_source_unref (a_source: POINTER) is
			-- void g_source_unref (GSource *source);
		external "C use <glib.h>"
		end

	g_source_attach (a_source, a_g_main_context: POINTER): INTEGER is
			-- guint g_source_attach (GSource *source, GMainContext 
			-- *context);

			-- TODO: g_source_attach Result should be NATURAL
		external "C use <glib.h>"
		alias "((gint) g_source_attach ($a_source, $a_g_main_context))"
		end

	g_source_destroy (a_source: POINTER) is
			-- void g_source_destroy (GSource *source);
		external "C use <glib.h>"
		end

	g_source_set_priority (a_source: POINTER; a_priority: INTEGER) is
			-- void g_source_set_priority (GSource *source, gint priority);
		external "C use <glib.h>"
		end

	g_source_get_priority (a_source: POINTER): INTEGER is
			-- gint g_source_get_priority (GSource *source);
		external "C use <glib.h>"
		end

	g_source_set_can_recurse (a_source: POINTER; can_recurse_bool: INTEGER) is
			-- void g_source_set_can_recurse (GSource *source, gboolean can_recurse);
		external "C use <glib.h>"
		end

	g_source_get_can_recurse (a_source: POINTER): INTEGER is
			-- gboolean g_source_get_can_recurse (GSource *source);
		external "C use <glib.h>"
		end

	g_source_get_id (a_source: POINTER): INTEGER is
			-- guint g_source_get_id (GSource *source);

			-- TODO: g_source_get_id Result should be NATURAL
		external "C inline use <glib.h>"
		alias "((gint) g_source_get_id ($a_source))"
		end

	g_source_get_context (a_source: POINTER): POINTER is
			-- GMainContext* g_source_get_context (GSource *source);
		external "C use <glib.h>"
		end

	g_source_set_callback (a_source, a_source_func, some_data, a_destroy_notify: POINTER) is
			-- void g_source_set_callback (GSource *source, GSourceFunc
			-- func, gpointer data, GDestroyNotify notify);
		external "C use <glib.h>"
		end

	-- gboolean (*GSourceFunc) (gpointer data);
	
	g_source_set_callback_indirect (a_source, a_callback_data, a_gsourcecallbackfuncs: POINTER) is
			-- void g_source_set_callback_indirect (GSource *source,
			-- gpointer callback_data, GSourceCallbackFuncs
			-- *callback_funcs);
		external "C use <glib.h>"
		end

	g_source_add_poll (a_source, an_fd: POINTER) is
			-- void g_source_add_poll (GSource *source, GPollFD *fd);
		external "C use <glib.h>"
		end

	g_source_remove_poll (a_source, an_fd: POINTER) is
			-- void g_source_remove_poll (GSource *source, GPollFD *fd);
		external "C use <glib.h>"
		end

	g_source_get_current_time (a_source, a_timeval: POINTER) is
			-- void g_source_get_current_time (GSource *source, GTimeVal *timeval);
		external "C use <glib.h>"
		end

	-- NOTE: gboolean g_source_remove (guint tag) is already wrapped in
	-- GLIB_MAIN_EVENT_LOOP
 
	g_source_remove_by_funcs_user_data (a_gsourcefuncs, some_user_data: POINTER): INTEGER is
			-- gboolean g_source_remove_by_funcs_user_data (GSourceFuncs *funcs, gpointer user_data);
		external "C use <glib.h>"
		end

	g_source_remove_by_user_data (some_user_data: POINTER): INTEGER is
			-- gboolean g_source_remove_by_user_data (gpointer user_data);
		external "C use <glib.h>"
		end
end
