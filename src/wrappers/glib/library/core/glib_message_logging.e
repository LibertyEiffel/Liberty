indexing
	description: "Versatile support for logging messages with different levels of importance."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"
	
deferred class GLIB_MESSAGE_LOGGING
	-- Support for logging error messages or messages used for
	-- debugging. There are several built-in levels of messages,
	-- defined in GLogLevelFlags. These can be extended with
	-- user-defined levels.
	
insert
	GMESSAGES_EXTERNALS
	WRAPPER_HANDLER
	
feature {ANY}
	log (a_domain, a_message: STRING; a_log_level: GLOG_LEVEL_FLAGS_ENUM) is
		-- Logs an error or debugging message. If `a_log_level' has been set as
		-- fatal, the `abort' function is called to terminate the program.
	
		-- `a_domain': the log domain; if Void `g_log_domain' is used.
	
		-- `a_log_level', either from GLogLevelFlags or a
		-- user-defined level.
	require message_not_void: a_message /= Void
	do
		g_log (null_or_string(a_domain), a_log_level.value, a_message.to_external)
	end
	
	message (a_message: STRING) is
		-- log a_message with  message.
	require message_not_void: a_message /= Void
	local f: GLOG_LEVEL_FLAGS_ENUM
	do
		g_log(default_pointer,f.level_message_low_level, a_message.to_external)
	end

	warning (a_message: STRING) is
		-- Log a_message as a warning.
	require message_not_void: a_message/=Void
	local f: GLOG_LEVEL_FLAGS_ENUM
	do 
		g_log(default_pointer,f.level_warning_low_level, a_message.to_external)
	end


	-- g_critical()

	-- #define     g_critical(...)
	
	-- Logs a "critical warning" (G_LOG_LEVEL_CRITICAL). It's more or
	-- less application-defined what constitutes a critical vs. a
	-- regular warning. You could call g_log_set_always_fatal() to make
	-- critical warnings exit the program, then use g_critical() for
	-- fatal errors, for example.  ... : format string, followed by
	-- parameters to insert into the format string (as with printf())
	
	error (an_error: STRING) is
	-- A convenience function/macro to log an error message. Error
	-- messages are always fatal, resulting in a call to the C function
	-- abort() to terminate the application. This function will result
	-- in a core dump; don't use it for errors you expect. Using this
	-- function indicates a bug in your program, i.e. an assertion
	-- failure.
	require error_not_void: an_error /= Void
	local f: GLOG_LEVEL_FLAGS_ENUM
	do
		g_log(default_pointer,f.level_error_low_level,an_error.to_external)

	end
	
-- g_debug()

-- #define     g_debug(...)

-- A convenience function/macro to log a debug message.
-- ... : 	format string, followed by parameters to insert into the format string (as with printf())

-- Since 2.6
-- g_log_set_handler ()

-- guint       g_log_set_handler               (const gchar *log_domain,
--                                              GLogLevelFlags log_levels,
--                                              GLogFunc log_func,
--                                              gpointer user_data);

-- Sets the log handler for a domain and a set of log levels. To handle fatal and recursive messages the log_levels parameter must be combined with the G_LOG_FLAG_FATAL and G_LOG_FLAG_RECURSION bit flags.

-- Note that since the G_LOG_LEVEL_ERROR log level is always fatal, if you want to set a handler for this log level you must combine it with G_LOG_FLAG_FATAL.

-- Example 13. Adding a log handler for all warning messages in the default (application) domain

--   g_log_set_handler (NULL, G_LOG_LEVEL_WARNING | G_LOG_FLAG_FATAL
--                      | G_LOG_FLAG_RECURSION, my_log_handler, NULL);

-- Example 14. Adding a log handler for all critical messages from GTK+

--   g_log_set_handler ("Gtk", G_LOG_LEVEL_CRITICAL | G_LOG_FLAG_FATAL
--                      | G_LOG_FLAG_RECURSION, my_log_handler, NULL);

-- Example 15. Adding a log handler for all messages from GLib

--   g_log_set_handler ("GLib", G_LOG_LEVEL_MASK | G_LOG_FLAG_FATAL
--                      | G_LOG_FLAG_RECURSION, my_log_handler, NULL);

-- log_domain : 	the log domain, or NULL for the default "" application domain.
-- log_levels : 	the log levels to apply the log handler for. To handle fatal and recursive messages as well, combine the log levels with the G_LOG_FLAG_FATAL and G_LOG_FLAG_RECURSION bit flags.
-- log_func : 	the log handler function.
-- user_data : 	data passed to the log handler.
-- Returns : 	the id of the new handler.
-- g_log_remove_handler ()

-- void        g_log_remove_handler            (const gchar *log_domain,
--                                              guint handler_id);

-- Removes the log handler.
-- log_domain : 	the log domain.
-- handler_id : 	the id of the handler, which was returned in g_log_set_handler().
-- g_log_set_always_fatal ()

-- GLogLevelFlags g_log_set_always_fatal       (GLogLevelFlags fatal_mask);

-- Sets the message levels which are always fatal, in any log domain. When a message with any of these levels is logged the program terminates. You can only set the levels defined by GLib to be fatal. G_LOG_LEVEL_ERROR is always fatal.
-- fatal_mask : 	the mask containing bits set for each level of error which is to be fatal.
-- Returns : 	the old fatal mask.
-- g_log_set_fatal_mask ()

-- GLogLevelFlags g_log_set_fatal_mask         (const gchar *log_domain,
--                                              GLogLevelFlags fatal_mask);

-- Sets the log levels which are fatal in the given domain. G_LOG_LEVEL_ERROR is always fatal.
-- log_domain : 	the log domain.
-- fatal_mask : 	the new fatal mask.
-- Returns : 	the old fatal mask for the log domain.
-- g_log_default_handler ()

-- void        g_log_default_handler           (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *message,
--                                              gpointer unused_data);

-- The default log handler set up by GLib; g_log_set_default_handler() allows to install an alternate default log handler. This is used if no log handler has been set for the particular log domain and log level combination. It outputs the message to stderr or stdout and if the log level is fatal it calls abort().

-- stderr is used for levels G_LOG_LEVEL_ERROR, G_LOG_LEVEL_CRITICAL, G_LOG_LEVEL_WARNING and G_LOG_LEVEL_MESSAGE. stdout is used for the rest.
-- log_domain : 	the log domain of the message.
-- log_level : 	the level of the message.
-- message : 	the message.
-- unused_data : 	data passed from g_log() which is unused.
-- g_log_set_default_handler ()

-- GLogFunc    g_log_set_default_handler       (GLogFunc log_func,
--                                              gpointer user_data);

-- Installs a default log handler which is used is used if no log handler has been set for the particular log domain and log level combination. By default, GLib uses g_log_default_handler() as default log handler.
-- log_func : 	the log handler function.
-- user_data : 	data passed to the log handler.
-- Returns : 	the previous default log handler

-- Since 2.6

end
