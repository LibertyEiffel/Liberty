note
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
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_MAIN_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- external calls

	gtk_set_locale: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_disable_setlocale
		external "C use <gtk/gtk.h>"
		end

-- PangoLanguage* gtk_get_default_language     (void)is
--		external "C use <gtk/gtk.h>"
--	end

-- gboolean    gtk_parse_args                  (int *argc,                                              char ***argv)is
--		external "C use <gtk/gtk.h>"
--	end

	gtk_init (argc, argv: POINTER)
		-- (int *argc, char ***argv)
		external "C use <gtk/gtk.h>"
		end

	gtk_init_check (argc,argv: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

-- gboolean    gtk_init_with_args              (int *argc,
--                                              char ***argv,
--                                              char *parameter_string,
--                                              GOptionEntry *entries,
--                                              char *translation_domain,
--                                              GError **error)is
--		external "C use <gtk/gtk.h>"
--	end

-- GOptionGroup* gtk_get_option_group          (gboolean open_default_display)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_exit                        (gint error_code)is
--		external "C use <gtk/gtk.h>"
--	end

	gtk_events_pending: INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_main
		external "C use <gtk/gtk.h>"
		end

	gtk_main_level: INTEGER
		-- TODO: obsolete "gtk_main_level: INTEGER shall be NATURAL"
		external "C use <gtk/gtk.h>"
		ensure Result>=0
		end

	gtk_main_quit
		external "C use <gtk/gtk.h>"
		end

	gtk_main_iteration_external: INTEGER
		external "C use <gtk/gtk.h>"
		alias "gtk_main_iteration"
		end

	gtk_main_iteration_do (blocking: INTEGER): INTEGER
			-- Runs a single iteration of the mainloop. If no events are
			-- available either return or block dependent on the value of
			-- blocking.  blocking : TRUE if you want GTK+ to block if no
			-- events are pending.  Returns : TRUE if gtk_main_quit() has
			-- been called for the innermost mainloop.
		external "C use <gtk/gtk.h>"
		end

-- void        gtk_main_do_event               (GdkEvent *event)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        (*GtkModuleInitFunc)            (gint *argc,
--                                              gchar ***argv)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        (*GtkModuleDisplayInitFunc)     (GdkDisplay *display)is
--		external "C use <gtk/gtk.h>"
--	end


-- gboolean    gtk_true                        (void)is
--		external "C use <gtk/gtk.h>"
--	end

-- gboolean    gtk_false                       (void)is
--		external "C use <gtk/gtk.h>"
--	end


-- void        gtk_grab_add                    (GtkWidget *widget)is
--		external "C use <gtk/gtk.h>"
--	end

-- GtkWidget*  gtk_grab_get_current            (void)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_grab_remove                 (GtkWidget *widget)is
--		external "C use <gtk/gtk.h>"
--	end


-- void        gtk_init_add                    (GtkFunction function,
--                                              gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_quit_add_destroy            (guint main_level,
--                                              GtkObject *object)is
--		external "C use <gtk/gtk.h>"
--	end

-- guint       gtk_quit_add                    (guint main_level,
--                                              GtkFunction function,
--                                              gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end

-- guint       gtk_quit_add_full               (guint main_level,
--                                              GtkFunction function,
--                                              GtkCallbackMarshal marshal,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_quit_remove                 (guint quit_handler_id)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_quit_remove_by_data         (gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end


-- guint       gtk_timeout_add_full            (guint32 interval,
--                                              GtkFunction function,
--                                              GtkCallbackMarshal marshal,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy)is
--		external "C use <gtk/gtk.h>"
--	end

-- guint       gtk_timeout_add                 (guint32 interval,
--                                              GtkFunction function,
--                                              gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_timeout_remove              (guint timeout_handler_id)is
--		external "C use <gtk/gtk.h>"
--	end


-- guint       gtk_idle_add                    (GtkFunction function,
--                                              gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end

-- guint       gtk_idle_add_priority           (gint priority,
--                                              GtkFunction function,
--                                              gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end

-- guint       gtk_idle_add_full               (gint priority,
--                                              GtkFunction function,
--                                              GtkCallbackMarshal marshal,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_idle_remove                 (guint idle_handler_id)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_idle_remove_by_data         (gpointer data)is
--		external "C use <gtk/gtk.h>"
--	end


-- guint       gtk_input_add_full              (gint source,
--                                              GdkInputCondition condition,
--                                              GdkInputFunction function,
--                                              GtkCallbackMarshal marshal,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_input_remove                (guint input_handler_id)is
--		external "C use <gtk/gtk.h>"
--	end


-- #define     GTK_PRIORITY_REDRAW
-- #define     GTK_PRIORITY_RESIZE
-- #define     GTK_PRIORITY_HIGH
-- #define     GTK_PRIORITY_INTERNAL
-- #define     GTK_PRIORITY_DEFAULT
-- #define     GTK_PRIORITY_LOW

-- guint       gtk_key_snooper_install         (GtkKeySnoopFunc snooper,
--                                              gpointer func_data)is
--		external "C use <gtk/gtk.h>"
--	end

-- gint        (*GtkKeySnoopFunc)              (GtkWidget *grab_widget,
--                                              GdkEventKey *event,
--                                              gpointer func_data)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_key_snooper_remove          (guint snooper_handler_id)is
--		external "C use <gtk/gtk.h>"
--	end


-- GdkEvent*   gtk_get_current_event           (void)is
--		external "C use <gtk/gtk.h>"
--	end

-- guint32     gtk_get_current_event_time      (void)is
--		external "C use <gtk/gtk.h>"
--	end

-- gboolean    gtk_get_current_event_state     (GdkModifierType *state)is
--		external "C use <gtk/gtk.h>"
--	end

-- GtkWidget*  gtk_get_event_widget            (GdkEvent *event)is
--		external "C use <gtk/gtk.h>"
--	end

-- void        gtk_propagate_event             (GtkWidget *widget,
--                                              GdkEvent *event)is
--		external "C use <gtk/gtk.h>"
--	end
end
