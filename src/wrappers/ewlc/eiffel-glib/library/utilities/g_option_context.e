note
	description: "."
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

class G_OPTION_CONTEXT
	-- A commandline option parser. 

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
	-- is explicitly turned off with `set_help_enabled', GOption will
	-- recognize the "--help", "-?", "--help-all" and
	-- "--help-groupname" options (where groupname is the name of a
	-- G_OPTION_GROUP) and write a text similar to the one shown in the
	-- following example to stdout.

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
	
	-- GOption groups options in G_OPTION_GROUPs, which makes it easy to
	-- incorporate options from multiple sources. The intended use for
	-- this is to let applications collect option groups from the
	-- libraries it uses, add them to their G_OPTION_CONTEXT, and parse
	-- all options by a single call to `parse'. GTK provides its own
	-- group in GTK.option_group.

	-- If an option is declared to be of type string or filename,
	-- GOption takes care of converting it to the right encoding;
	-- strings are returned in UTF-8, filenames are returned in the
	-- GLib filename encoding.

	-- "commandline_parser_example" is a complete example of setting up
	-- GOption to parse the example commandline above and produce the
	-- example help output.

inherit 
		C_STRUCT redefine free end
		EIFFEL_OWNED redefine free end

insert
	SHARED_G_ERROR
	GLIB_COMMANDLINE_OPTION_PARSER_EXTERNALS
	ARGUMENTS  undefine is_equal, copy end

create {ANY} with,make, from_external_pointer

feature {} -- Creation
	with, make (a_parameter: STRING) is
			-- Creates a new option context.

			-- The parameter_string can serve multiple purposes. It can be used to
			-- add descriptions for "rest" arguments, which are not parsed by the
			-- GOptionContext, typically something like "FILES" or "FILE1
			-- FILE2...". If you are using G_OPTION_REMAINING for collecting "rest"
			-- arguments, GLib handles this automatically by using the
			-- arg_description of the corresponding GOptionEntry in the usage
			-- summary.
		
			-- Another usage is to give a short summary of the program
			-- functionality, like " - frob the strings", which will be displayed
			-- in the same line as the usage. For a longer description of the
			-- program functionality that should be displayed as a paragraph below
			-- the usage line, use g_option_context_set_summary().

			-- Note that the parameter_string is translated (see
			-- g_option_context_set_translate_func()).

			-- `a_parameter' : a string which is displayed in the first line of
			-- --help output, after the usage summary programname [OPTION...]
		require parameter_not_void: a_parameter/=Void
		do
			from_external_pointer(g_option_context_new(a_parameter.to_external))
		end

feature {ANY}
	set_summary (a_summary: STRING) is
			-- Adds a string to be displayed in --help output before the list of
			-- options. This is typically a summary of the program functionality.
		
			-- Note that the summary is translated (see `set_translate_func').
		
			-- `a_summary': a string to be shown in --help output before the list
			-- of options, or Void
		local sp: POINTER
		do
			if a_summary/=Void then sp:=a_summary.to_external end
			g_option_context_set_summary(handle,sp)
		end

	summary: STRING is
		local sp: POINTER
		do
			sp:=g_option_context_get_summary(handle)
			if sp.is_not_null then create {CONST_STRING} Result.from_external(sp) end
		end
	
	--  void        g_option_context_set_description
	--                                              (GOptionContext *context,
	--                                               const gchar *description);

	--    Adds a string to be displayed in --help output after the list of options. This
	--    text often includes a bug reporting address.

	--    Note that the summary is translated (see g_option_context_set_translate_func()).

	--    context :     a GOptionContext
	--    description : a string to be shown in --help output after the list of options, or
	--                  NULL

	--    Since 2.12

	--    ---------------------------------------------------------------------------------

	--   g_option_context_get_description ()

	--  const gchar* g_option_context_get_description
	--                                              (GOptionContext *context);

	--    Returns the description. See g_option_context_set_description().

	--    context : a GOptionContext
	--    Returns : the description

	--    Since 2.12

	--    ---------------------------------------------------------------------------------

	--   GTranslateFunc ()

	--  const gchar* (*GTranslateFunc)              (const gchar *str,
	--                                               gpointer data);

	--    The type of functions which are used to translate user-visible strings, for
	--    --help output.

	--    str :     the untranslated string
	--    data :    user data specified when installing the function, e.g. in
	--              g_option_group_set_translate_func()
	--    Returns : a translation of the string for the current locale. The returned string
	--              is owned by GLib and must not be freed.

	--    ---------------------------------------------------------------------------------

	--   g_option_context_set_translate_func ()

	--  void        g_option_context_set_translate_func
	--                                              (GOptionContext *context,
	--                                               GTranslateFunc func,
	--                                               gpointer data,
	--                                               GDestroyNotify destroy_notify);

	--    Sets the function which is used to translate the contexts user-visible strings,
	--    for --help output. If func is NULL, strings are not translated.

	--    Note that option groups have their own translation functions, this function only
	--    affects the parameter_string (see g_option_context_nex()), the summary (see
	--    g_option_context_set_summary()) and the description (see
	--    g_option_context_set_description()).

	--    If you are using gettext(), you only need to set the translation domain, see
	--    g_context_group_set_translation_domain().

	--    context :        a GOptionContext
	--    func :           the GTranslateFunc, or NULL
	--    data :           user data to pass to func, or NULL
	--    destroy_notify : a function which gets called to free data, or NULL

	--    Since 2.12

	--    ---------------------------------------------------------------------------------

	--   g_option_context_set_translation_domain ()

	--  void        g_option_context_set_translation_domain
	--                                              (GOptionContext *context,
	--                                               const gchar *domain);

	--    A convenience function to use gettext() for translating user-visible strings.

	--    context : a GOptionContext
	--    domain :  the domain to use

	--    Since 2.12

	parse is
			-- Parses the command line arguments, recognizing options
			-- which have been added to context. This feature also invoke
			-- `g_set_prgname'.

			-- If the parsing is successful, any parsed arguments are
			-- removed from the array and argc and argv are updated
			-- accordingly. A '--' option is stripped from argv unless
			-- there are unparsed options before and after it, or some of
			-- the options after it start with '-'. In case of an error,
			-- argc and argv are left unmodified.
		
			-- If automatic --help support is enabled (see
			-- `set_help_enabled'), and the argv array contains one of
			-- the recognized help options, this function will produce
			-- help output to stdout and call exit (0).
		
			-- `is_successful' is set to True if the parsing was successful, FALSE
			-- if an error occurred
		local i, argc: INTEGER; -- arguments: FAST_ARRAY[STRING]; 
			argv: POINTER
		do
			--    context : a GOptionContext
			--    argc :    a pointer to the number of command line arguments.
			--    argv :    a pointer to the array of command line arguments.
			--    error :   a return location for errors

			-- Note: the next two assignments are necessary to generate
			-- correct C code because command_arguments.to_external is
			-- actually implemented as a function therefore it cannot be
			-- used as an argument of address_of. AFAIK there is no way
			-- to add a precondition to address_or requiring that its
			-- argument is not the result of a function. Paolo 2007-04-23
			
			argc := se_argc
			argv := command_arguments.to_external
			is_successful := (g_option_context_parse
									(handle, $argc, -- i.e.: gint *argc,
									 $argv, -- i.e.: -- gchar ***argv
									 error.handle)).to_boolean
			-- Commandline arguments have been changed. We must
			-- rebuild `command_arguments' array.
			
			-- from i:=argc; command_arguments.clear_count; until i = 0
			-- loop i := i - 1 command_arguments.force(arguments.item(i),
			-- i) end
		ensure arguments_can_be_decreased: command_arguments.count <= old command_arguments.count
		end

	set_help_enabled (a_setting: BOOLEAN) is
			-- Enables or disables automatic generation of --help output. By
			-- default, `parse' recognizes "--help", "-?", "--help-all" and
			-- "--help-groupname" and creates suitable output to stdout.
		do
			g_option_context_set_help_enabled(handle,a_setting.to_integer)
		ensure set: a_setting = is_help_enabled
		end
	
	is_help_enabled: BOOLEAN is
			-- Is automatic "--help" generation turned on?
		do
			Result:=g_option_context_get_help_enabled(handle).to_boolean
		end

	
	set_ignore_unknown_options (a_setting: BOOLEAN) is
			-- Sets whether to ignore unknown options or not. If an
			-- argument is ignored, it is left in the `command_arguments'
			-- array after parsing. By default, `parse' treats unknown
			-- options as error.
		
			-- This setting does not affect non-option arguments
			-- (i.e. arguments which don't start with a dash). But note
			-- that GOption cannot reliably determine whether a
			-- non-option belongs to a preceding unknown option.
		
			-- `a_setting' : TRUE to ignore unknown options, FALSE to
			-- produce an error when unknown options are met
		do
			g_option_context_set_ignore_unknown_options(handle, a_setting.to_integer)
		end

	are_unknown_options_ignored: BOOLEAN is
			-- Are unknown options ignored?
		do 
			Result:=g_option_context_get_ignore_unknown_options(handle).to_boolean
		end

feature {ANY} -- group options
	add_main_entries (some_entries: COLLECTION[G_OPTION_ENTRY];
							a_translaction_domain: STRING) is
			-- A convenience feature which creates a main group if it doesn't
			-- exist, adds the entries to it and sets the translation domain.
		
			-- `a_translation_domain': a translation domain to use for translating
			-- the --help output for the options in entries with gettext(), or
			-- Void.

			-- Performance: the wrapper is O(1) if some_entries is a
			-- NULL_TERMINATED_C_ARRAY, otherwise it has an
			-- O(some_entries.count) overhead, since it converts the
			-- collection into a NULL_TERMINATED_C_ARRAY
		require entries_not_void: some_entries /= Void
		local entries_array: NULL_TERMINATED_C_ARRAY[G_OPTION_ENTRY]
		do
			not_yet_implemented
			-- debug print ("G_OPTION_CONTEXT.add_main_entries%N") end
			-- if entries_array ?:= some_entries then
			-- entries_array ::= some_entries 
			-- else create entries_array.from_collection(some_entries) 
			-- end
			-- debug print (" entries array created:%N") end
			--debug entries_array.print_on(std_output) std_output.put_new_line end 
			--g_option_context_add_main_entries 
			--(handle, entries_array.storage.to_external,
			-- null_or_string(a_translaction_domain))
		end

	main_group: G_OPTION_GROUP is
			-- the main group of context, or Void if context doesn't have a main
			-- group.
		local p: POINTER
		do
			create Result.from_external_pointer(g_option_context_get_main_group(handle))
			-- Note that group belongs to context and should not be modified
			-- or freed.
		end

	add_group (a_group: G_OPTION_GROUP) is
			-- Adds a GOptionGroup to the context, so that parsing with context
			-- will recognize the options in the group.
		require group_not_void: a_group /= Void
		do
			g_option_context_add_group (handle,a_group.handle)
			-- Note that the added group will be freed together with the context
			-- when g_option_context_free() is called, so you must not free the
			-- group yourself after adding it to a context.
			
			--a_group.set_shared -- avoid freeing the underlying C structure.
		end

	set_main_group (a_group: G_OPTION_GROUP) is
			-- Sets a GOptionGroup as main group of the context. This has the same
			-- effect as calling `add_group', the only difference is that the
			-- options in the main group are treated differently when generating
			-- "--help" output.
		require group_not_void: a_group /= Void
		do
			g_option_context_set_main_group (handle, a_group.handle)
			-- a_group.set_shared -- avoid freeing the underlying C structure.
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <glib.h>"
		alias "sizeof(GOptionContext)"
		end
feature {}
	free (a_ptr: POINTER) is
		do
			g_option_context_free(a_ptr)
		end

end -- class G_OPTION_CONTEXT
