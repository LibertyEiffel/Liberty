note
	description: "External calls for "
	copyright: "Copyright (C) 2007 Paolo Readelli, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GLIB_COMMANDLINE_OPTION_PARSER_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	G_OPTION_ARG_ENUM
	G_OPTION_FLAGS
	G_OPTION_ERROR
	
feature {} -- External calls

	-- #define     G_OPTION_ERROR

	-- gboolean (*GOptionArgFunc) (const gchar *option_name, const
	-- gchar *value, gpointer data, GError **error);
   
	g_option_context_new (a_parameter_string: POINTER): POINTER is
			-- GOptionContext* g_option_context_new (const gchar
			-- *parameter_string);
		external "C use <glib.h>"
		end
	
	g_option_context_set_summary (a_context, a_summary: POINTER) is
			-- void g_option_context_set_summary (GOptionContext *context, const
			-- gchar *summary);
		external "C use <glib.h>"
		end
		
	g_option_context_get_summary (a_context: POINTER): POINTER is
			--  const gchar* g_option_context_get_summary (GOptionContext
			--  *context);
		external "C use <glib.h>"
		end
	
	g_option_context_set_description (a_context, a_description: POINTER) is
			-- void g_option_context_set_description (GOptionContext *context,
			-- const gchar *description);
		external "C use <glib.h>"
		end
		
	g_option_context_get_description (a_context: POINTER): POINTER is
			-- const gchar* g_option_context_get_description (GOptionContext
			-- *context);
		external "C use <glib.h>"
		end
		
	--  const gchar* (*GTranslateFunc) (const gchar *str, gpointer data);

	g_option_context_set_translate_func (a_context, a_gtranslatefunc, some_data, a_destroy_notify: POINTER) is
			-- void g_option_context_set_translate_func (GOptionContext *context,
			-- GTranslateFunc func, gpointer data, GDestroyNotify destroy_notify);
		external "C use <glib.h>"
		end
		
	g_option_context_set_translation_domain (a_context, a_domain: POINTER) is
			--  void g_option_context_set_translation_domain (GOptionContext
			--  *context, const gchar *domain);
		external "C use <glib.h>"
		end
	
	g_option_context_free (a_context: POINTER) is
			--  void g_option_context_free (GOptionContext *context);
		external "C use <glib.h>"
		end
		
	g_option_context_parse (a_context, an_argc, an_argv, a_error: POINTER): INTEGER is
			-- gboolean g_option_context_parse (GOptionContext *context, gint
			-- *argc, gchar ***argv, GError **error);
		external "C use <glib.h>"
		end
	
	g_option_context_set_help_enabled (a_context: POINTER; help_enabled_bool: INTEGER) is
			--  void g_option_context_set_help_enabled (GOptionContext *context,
			--  gboolean help_enabled);
		external "C use <glib.h>"
		end
		
	g_option_context_get_help_enabled (a_context: POINTER): INTEGER is
			-- gboolean g_option_context_get_help_enabled (GOptionContext
			-- *context);
		external "C use <glib.h>"
		end
		
	g_option_context_set_ignore_unknown_options (a_context: POINTER; an_ignore_unknown_bool: INTEGER) is
			-- void g_option_context_set_ignore_unknown_options (GOptionContext
			-- *context, gboolean ignore_unknown);
		external "C use <glib.h>"
		end

	g_option_context_get_ignore_unknown_options (a_context: POINTER): INTEGER is
			--  gboolean g_option_context_get_ignore_unknown_options
			--  (GOptionContext *context);
		external "C use <glib.h>"
		end
		
	-- enum        GOptionArg;
	-- enum        GOptionFlags;
	
	-- #define     G_OPTION_REMAINING
	
	-- GOptionEntry;
	
	g_option_context_add_main_entries (a_context, some_entries, a_translation_domain: POINTER) is
			-- void g_option_context_add_main_entries (GOptionContext *context,
			-- const GOptionEntry *entries, const gchar *translation_domain);
		external "C use <glib.h>"
		end
	
	-- GOptionGroup;

	g_option_context_add_group (a_context, a_group: POINTER) is
			-- void g_option_context_add_group (GOptionContext *context,
			-- GOptionGroup *group);
		external "C use <glib.h>"
		end
	
	g_option_context_set_main_group (a_context, some_group: POINTER) is
			-- void g_option_context_set_main_group (GOptionContext *context,
			-- GOptionGroup *group);
		external "C use <glib.h>"
		end
		
	g_option_context_get_main_group (a_context: POINTER): POINTER is
			-- GOptionGroup* g_option_context_get_main_group (GOptionContext
			-- *context);
		external "C use <glib.h>"
		end

	g_option_group_new (a_name, a_description, a_help_description, some_data, a_gdestroynotify: POINTER): POINTER is
			-- GOptionGroup* g_option_group_new (const gchar *name, const gchar
			-- *description, const gchar *help_description, gpointer user_data,
			-- GDestroyNotify destroy);
		external "C use <glib.h>"
		end
	
	g_option_group_free (a_group: POINTER) is
			-- void g_option_group_free (GOptionGroup *group);
		external "C use <glib.h>"
		end
		
	g_option_group_add_entries (a_group, some_entries: POINTER) is
			-- void g_option_group_add_entries (GOptionGroup *group, const
			--x GOptionEntry *entries);
		external "C use <glib.h>"
		end
	
	--  gboolean (*GOptionParseFunc) (a_context: POINTER, GOptionGroup *group,
	--  gpointer data, GError **error);

	g_option_group_set_parse_hooks  (a_group, pre_parse_func, post_parse_func: POINTER) is
			--  void g_option_group_set_parse_hooks (GOptionGroup *group,
			--  GOptionParseFunc pre_parse_func, GOptionParseFunc post_parse_func);
		external "C use <glib.h>"
		end
		
	-- void (*GOptionErrorFunc) (GOptionContext *context, GOptionGroup *group,
	-- gpointer data, GError **error);
	
	g_option_group_set_error_hook   (a_group, an_error_func: POINTER) is
			--  void g_option_group_set_error_hook (GOptionGroup *group,
			--  GOptionErrorFunc error_func);
		external "C use <glib.h>"
		end
		
	g_option_group_set_translate_func (a_group, a_func, some_data, a_gdestroynotify: POINTER) is
			--  void g_option_group_set_translate_func (GOptionGroup *group,
			--  GTranslateFunc func, gpointer data, GDestroyNotify destroy_notify);
		external "C use <glib.h>"
		end
		
	g_option_group_set_translation_domain (a_group, a_domain: POINTER) is
			--  void        g_option_group_set_translation_domain (GOptionGroup *group, const gchar *domain);
		external "C use <glib.h>"
		end

end
