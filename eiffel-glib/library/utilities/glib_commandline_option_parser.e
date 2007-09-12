indexing
	description: "Commandline option parser -- parses commandline options."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Glib developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GLIB_COMMANDLINE_OPTION_PARSER
	-- The GOption commandline parser is intended to be a simpler
	-- replacement for the popt library. It supports short and long
	-- commandline options, as shown in the following example:

	-- testtreemodel -r 1 --max-size 20 --rand --display=:1.0 -vb --
	-- file1 file2
	
	-- The example demonstrates a number of features of the GOption
	-- commandline parser
	
	-- o Options can be single letters, prefixed by a single
	-- dash. Multiple short options can be grouped behind a single
	-- dash.

	-- o Long options are prefixed by two consecutive dashes.

	-- o Options can have an extra argument, which can be a number, a
	-- string or a filename. For long options, the extra argument can
	-- be appended with an equals sign after the option name.
	
	-- o Non-option arguments are returned to the application as rest
	-- arguments.

	-- o An argument consisting solely of two dashes turns off further
	-- parsing, any remaining arguments (even those starting with a
	-- dash) are returned to the application as rest arguments.

	-- Another important feature of GOption is that it can
	-- automatically generate nicely formatted help output. Unless it
	-- is explicitly turned off with
	-- g_option_context_set_help_enabled(), GOption will recognize the
	-- --help, -?, --help-all and --help-groupname options (where
	-- groupname is the name of a GOptionGroup) and write a text
	-- similar to the one shown in the following example to stdout.

	--  Usage:
	--    testtreemodel [OPTION...] - test tree model performance
	
	--  Help Options:
	--    -?, --help               Show help options
	--    --help-all               Show all help options
	--    --help-gtk               Show GTK+ Options
	
	--  Application Options:
	--    -r, --repeats=N          Average over N repetitions
	--    -m, --max-size=M         Test up to 2^M items
	--    --display=DISPLAY        X display to use
	--    -v, --verbose            Be verbose
	--    -b, --beep               Beep when done
	--    --rand                   Randomize the data
	
	-- GOption groups options in GOptionGroups, which makes it easy to
	-- incorporate options from multiple sources. The intended use for
	-- this is to let applications collect option groups from the
	-- libraries it uses, add them to their GOptionContext, and parse
	-- all options by a single call to g_option_context_parse(). See
	-- gtk_get_option_group() for an example.

	-- If an option is declared to be of type string or filename,
	-- GOption takes care of converting it to the right encoding;
	-- strings are returned in UTF-8, filenames are returned in the
	-- GLib filename encoding.

	-- Here is a complete example of setting up GOption to parse the
	-- example commandline above and produce the example help output.
	
	-- TODO: Eiffelize this example:


inherit SHARED_C_STRUCT

insert GLIB_COMMANDLINE_OPTION_PARSER_EXTERNALS

creation dummy, from_external_pointer

feature {} -- Unwrapped code
	--   G_OPTION_ERROR

	--  #define G_OPTION_ERROR (g_option_error_quark ())
	
	-- Error domain for option parsing. Errors in this domain will be
	-- from the GOptionError enumeration. See GError for information on
	-- error domains.
	
	-- GOptionArgFunc ()

	-- gboolean (*GOptionArgFunc) (const gchar *option_name, const
	-- gchar *value, gpointer data, GError **error);
	
	-- The type of function to be passed as callback for
	-- G_OPTION_ARG_CALLBACK options.
	
	-- option_name : The name of the option being parsed. This will be either a single
	--                  dash followed by a single letter (for a short name) or two dashes
	--                  followed by a long option name.
	--    value :       The value to be parsed.
	--    data :        User data added to the GOptionGroup containing the option when it
	--                  was created with g_option_group_new()
	--    error :       A return location for errors. The error code G_OPTION_ERROR_FAILED
	--                  is intended to be used for errors in GOptionArgFunc callbacks.
	--    Returns :     TRUE if the option was successfully parsed, FALSE if an error
	--                  occurred, in which case error should be set with g_set_error()

	--    ---------------------------------------------------------------------------------

	--   G_OPTION_REMAINING

	--  #define G_OPTION_REMAINING ""

	--    If a long option in the main group has this name, it is not treated as a regular
	--    option. Instead it collects all non-option arguments which would otherwise be
	--    left in argv. The option must be of type G_OPTION_ARG_STRING_ARRAY or
	--    G_OPTION_ARG_FILENAME_ARRAY.

	--    Using G_OPTION_REMAINING instead of simply scanning argv for leftover arguments
	--    has the advantage that GOption takes care of necessary encoding conversions for
	--    strings or filenames.

feature -- size
	struct_size: INTEGER is
		external "C inline use <glib.h>"
		alias "sizeof(Foo)"
		end

end -- class GLIB_COMMANDLINE_OPTION_PARSER
