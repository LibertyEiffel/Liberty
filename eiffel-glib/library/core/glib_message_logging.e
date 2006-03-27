indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_MESSAGE_LOGGING

-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Message Logging

-- Message Logging %GÅ‚Äî%@ versatile support for logging messages with different levels of importance.
	
-- Synopsis

-- #include <glib.h>


-- #define     G_LOG_DOMAIN
-- #define     G_LOG_FATAL_MASK
-- #define     G_LOG_LEVEL_USER_SHIFT
-- void        (*GLogFunc)                     (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *message,
--                                              gpointer user_data);
-- enum        GLogLevelFlags;

-- void        g_log                           (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *format,
--                                              ...);
-- void        g_logv                          (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *format,
--                                              va_list args);
-- #define     g_message                       (...)
-- #define     g_warning                       (...)
-- #define     g_critical                      (...)
-- #define     g_error                         (...)
-- #define     g_debug                         (...)

-- guint       g_log_set_handler               (const gchar *log_domain,
--                                              GLogLevelFlags log_levels,
--                                              GLogFunc log_func,
--                                              gpointer user_data);
-- void        g_log_remove_handler            (const gchar *log_domain,
--                                              guint handler_id);
-- GLogLevelFlags g_log_set_always_fatal       (GLogLevelFlags fatal_mask);
-- GLogLevelFlags g_log_set_fatal_mask         (const gchar *log_domain,
--                                              GLogLevelFlags fatal_mask);
-- void        g_log_default_handler           (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *message,
--                                              gpointer unused_data);
-- GLogFunc    g_log_set_default_handler       (GLogFunc log_func,
--                                              gpointer user_data);

-- Description

-- These functions provide support for logging error messages or messages used for debugging.

-- There are several built-in levels of messages, defined in GLogLevelFlags. These can be extended with user-defined levels.
-- Details
-- G_LOG_DOMAIN

-- #define G_LOG_DOMAIN    ((gchar*) 0)

-- Defines the log domain. For applications, this is typically left as the default NULL (or "") domain. Libraries should define this so that any messages which they log can be differentiated from messages from other libraries and application code. But be careful not to define it in any public header files.

-- For example, GTK+ uses this in its Makefile.am:

-- INCLUDES = -DG_LOG_DOMAIN=\"Gtk\"

-- G_LOG_FATAL_MASK

-- #define G_LOG_FATAL_MASK        (G_LOG_FLAG_RECURSION | G_LOG_LEVEL_ERROR)

-- GLib log levels that are considered fatal by default.
-- G_LOG_LEVEL_USER_SHIFT

-- #define G_LOG_LEVEL_USER_SHIFT  (8)

-- Log level shift offset for user defined log levels (0-7 are used by GLib).
-- GLogFunc ()

-- void        (*GLogFunc)                     (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *message,
--                                              gpointer user_data);

-- Specifies the prototype of log handler functions.
-- log_domain : 	the log domain of the message.
-- log_level : 	the log level of the message (including the fatal and recursion flags).
-- message : 	the message to process.
-- user_data : 	user data, set in g_log_set_handler().
-- enum GLogLevelFlags

-- typedef enum
-- {
--   /* log flags */
--   G_LOG_FLAG_RECURSION          = 1 << 0,
--   G_LOG_FLAG_FATAL              = 1 << 1,

--   /* GLib log levels */
--   G_LOG_LEVEL_ERROR             = 1 << 2,       /* always fatal */
--   G_LOG_LEVEL_CRITICAL          = 1 << 3,
--   G_LOG_LEVEL_WARNING           = 1 << 4,
--   G_LOG_LEVEL_MESSAGE           = 1 << 5,
--   G_LOG_LEVEL_INFO              = 1 << 6,
--   G_LOG_LEVEL_DEBUG             = 1 << 7,

--   G_LOG_LEVEL_MASK              = ~(G_LOG_FLAG_RECURSION | G_LOG_FLAG_FATAL)
-- } GLogLevelFlags;

-- Flags specifying the level of log messages.
-- g_log ()

-- void        g_log                           (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *format,
--                                              ...);

-- Logs an error or debugging message. If the log level has been set as fatal, the abort() function is called to terminate the program.
-- log_domain : 	the log domain, usually G_LOG_DOMAIN.
-- log_level : 	the log level, either from GLogLevelFlags or a user-defined level.
-- format : 	the message format. See the printf() documentation.
-- ... : 	the parameters to insert into the format string.
-- g_logv ()

-- void        g_logv                          (const gchar *log_domain,
--                                              GLogLevelFlags log_level,
--                                              const gchar *format,
--                                              va_list args);

-- Logs an error or debugging message. If the log level has been set as fatal, the abort() function is called to terminate the program.
-- log_domain : 	the log domain.
-- log_level : 	the log level.
-- format : 	the message format. See the printf() documentation.
-- args : 	the parameters to insert into the format string.
-- g_message()

-- #define     g_message(...)

-- A convenience function/macro to log a normal message.
-- ... : 	format string, followed by parameters to insert into the format string (as with printf())
-- g_warning()

-- #define     g_warning(...)

-- A convenience function/macro to log a warning message.
-- ... : 	format string, followed by parameters to insert into the format string (as with printf())
-- g_critical()

-- #define     g_critical(...)

-- Logs a "critical warning" (G_LOG_LEVEL_CRITICAL). It's more or less application-defined what constitutes a critical vs. a regular warning. You could call g_log_set_always_fatal() to make critical warnings exit the program, then use g_critical() for fatal errors, for example.
-- ... : 	format string, followed by parameters to insert into the format string (as with printf())
-- g_error()

-- #define     g_error(...)

-- A convenience function/macro to log an error message. Error messages are always fatal, resulting in a call to abort() to terminate the application. This function will result in a core dump; don't use it for errors you expect. Using this function indicates a bug in your program, i.e. an assertion failure.
-- ... : 	the parameters to insert into the format string.
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

													
