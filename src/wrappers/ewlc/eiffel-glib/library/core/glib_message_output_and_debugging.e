note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_MESSAGE_OUTPUT_AND_DEBUGGING
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Message Output and Debugging Functions

-- Message Output and Debugging Functions %GÅ‚Äî%@ functions to output messages and help debug applications.
	
-- Synopsis

-- #include <glib.h>


-- void        g_print                         (const gchar *format,
--                                              ...);
-- GPrintFunc  g_set_print_handler             (GPrintFunc func);
-- void        (*GPrintFunc)                   (const gchar *string);

-- void        g_printerr                      (const gchar *format,
--                                              ...);
-- GPrintFunc  g_set_printerr_handler          (GPrintFunc func);

-- #define     g_return_if_fail                (expr)
-- #define     g_return_val_if_fail            (expr,val)
-- #define     g_return_if_reached             ()
-- #define     g_return_val_if_reached         (val)

-- #define     g_assert                        (expr)
-- #define     g_assert_not_reached            ()

-- void        g_on_error_query                (const gchar *prg_name);
-- void        g_on_error_stack_trace          (const gchar *prg_name);

-- #define     G_BREAKPOINT                    ()


-- Description

-- These functions provide support for outputting messages.
-- Details
-- g_print ()

-- void        g_print                         (const gchar *format,
--                                              ...);

-- Outputs a formatted message via the print handler. The default print handler simply outputs the message to stdout.

-- g_print() should not be used from within libraries for debugging messages, since it may be redirected by applications to special purpose message windows or even files. Instead, libraries should use g_log(), or the convenience functions g_message(), g_warning() and g_error().
-- format : 	the message format. See the printf() documentation.
-- ... : 	the parameters to insert into the format string.
-- g_set_print_handler ()

-- GPrintFunc  g_set_print_handler             (GPrintFunc func);

-- Sets the print handler. Any messages passed to g_print() will be output via the new handler. The default handler simply outputs the message to stdout. By providing your own handler you can redirect the output, to a GTK+ widget or a log file for example.
-- func : 	the new print handler.
-- Returns : 	the old print handler.
-- GPrintFunc ()

-- void        (*GPrintFunc)                   (const gchar *string);

-- Specifies the type of the print handler functions. These are called with the complete formatted string to output.
-- string : 	the message to be output.
-- g_printerr ()

-- void        g_printerr                      (const gchar *format,
--                                              ...);

-- Outputs a formatted message via the error message handler. The default handler simply outputs the message to stderr.

-- g_printerr() should not be used from within libraries. Instead g_log() should be used, or the convenience functions g_message(), g_warning() and g_error().
-- format : 	the message format. See the printf() documentation.
-- ... : 	the parameters to insert into the format string.
-- g_set_printerr_handler ()

-- GPrintFunc  g_set_printerr_handler          (GPrintFunc func);

-- Sets the handler for printing error messages. Any messages passed to g_printerr() will be output via the new handler. The default handler simply outputs the message to stderr. By providing your own handler you can redirect the output, to a GTK+ widget or a log file for example.
-- func : 	the new error message handler.
-- Returns : 	the old error message handler.
-- g_return_if_fail()

-- #define     g_return_if_fail(expr)

-- Returns from the current function if the expression is not true. If the expression evaluates to FALSE, a critical message is logged and the function returns. This can only be used in functions which do not return a value.
-- expr : 	the expression to check.
-- g_return_val_if_fail()

-- #define     g_return_val_if_fail(expr,val)

-- Returns from the current function, returning the value val, if the expression is not true. If the expression evaluates to FALSE, a critical message is logged and val is returned.
-- expr : 	the expression to check.
-- val : 	the value to return from the current function if the expression is not true.
-- g_return_if_reached()

-- #define     g_return_if_reached()

-- Logs a critical message and returns from the current function. This can only be used in functions which do not return a value.
-- g_return_val_if_reached()

-- #define     g_return_val_if_reached(val)

-- Logs a critical message and returns val.
-- val : 	the value to return from the current function.
-- g_assert()

-- #define     g_assert(expr)

-- Debugging macro to terminate the application if the assertion fails. If the assertion fails (i.e. the expression is not true), an error message is logged and the application is terminated.

-- The macro can be turned off in final releases of code by defining G_DISABLE_ASSERT when compiling the application.
-- expr : 	the expression to check.
-- g_assert_not_reached()

-- #define     g_assert_not_reached()

-- Debugging macro to terminate the application if it is ever reached. If it is reached, an error message is logged and the application is terminated.

-- The macro can be turned off in final releases of code by defining G_DISABLE_ASSERT when compiling the application.
-- g_on_error_query ()

-- void        g_on_error_query                (const gchar *prg_name);

-- Prompts the user with [E]xit, [H]alt, show [S]tack trace or [P]roceed. This function is intended to be used for debugging use only. The following example shows how it can be used together with the g_log() functions.

-- #include <glib.h>

-- static void 
-- log_handler (const gchar   *log_domain,
-- 	     GLogLevelFlags log_level,
-- 	     const gchar   *message,
-- 	     gpointer       user_data)
-- {
--   g_log_default_handler (log_domain, log_level, message, user_data);

--   g_on_error_query (MY_PROGRAM_NAME);
-- }

-- int main (int argc, char *argv[])
-- {
--   g_log_set_handler (MY_LOG_DOMAIN,
-- 		     G_LOG_LEVEL_WARNING | 
--                      G_LOG_LEVEL_ERROR | 
--                      G_LOG_LEVEL_CRITICAL,
-- 		     log_handler,
-- 		     NULL);

--  /* ... */  

-- If [E]xit is selected, the application terminates with a call to _exit(0).

-- If [H]alt is selected, the application enters an infinite loop. The infinite loop can only be stopped by killing the application, or by setting glib_on_error_halt to FALSE (possibly via a debugger).

-- If [S]tack trace is selected, g_on_error_stack_trace() is called. This invokes gdb, which attaches to the current process and shows a stack trace. The prompt is then shown again.

-- If [P]roceed is selected, the function returns.

-- This function may cause different actions on non-UNIX platforms.
-- prg_name : 	the program name, needed by gdb for the [S]tack trace option. If prg_name is NULL, g_get_prgname() is called to get the program name (which will work correctly if gdk_init() or gtk_init() has been called).
-- g_on_error_stack_trace ()

-- void        g_on_error_stack_trace          (const gchar *prg_name);

-- Invokes gdb, which attaches to the current process and shows a stack trace. Called by g_on_error_query() when the [S]tack trace option is selected.

-- This function may cause different actions on non-UNIX platforms.
-- prg_name : 	the program name, needed by gdb for the [S]tack trace option. If prg_name is NULL, g_get_prgname() is called to get the program name (which will work correctly if gdk_init() or gtk_init() has been called).
-- G_BREAKPOINT()

-- #define     G_BREAKPOINT()

-- Inserts a breakpoint instruction into the code (on x86 machines only).
end
