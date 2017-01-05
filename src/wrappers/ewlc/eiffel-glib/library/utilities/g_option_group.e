note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, Glib developers
					
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

class G_OPTION_GROUP
	-- A GOptionGroup struct defines the options in a single group. The
	-- struct has only private fields and should not be directly
	-- accessed.

	-- All options in a group share the same translation
	-- function. Libaries which need to parse commandline options are
	-- expected to provide a function for getting a GOptionGroup
	-- holding their options, which the application can then add to its
	-- GOptionContext.

inherit 
	C_STRUCT redefine free end
	EIFFEL_OWNED redefine free end

insert
	SHARED_G_ERROR 
	GLIB_COMMANDLINE_OPTION_PARSER_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_name, a_description, an_help_description: STRING)
			-- Creates a new GOptionGroup to be added to a GOptionContext.
		
			-- `a_name': the name for the option group, this is used to provide
			-- help for the options in this group with --help-name
		
			-- `a_description': a description for this group to be shown in
			-- --help. This string is translated using the translation domain or
			-- translation function of the group
		
			-- `an_help_description' : a description for the --help-name
			-- option. This string is translated using the translation domain or
			-- translation function of the group
		do
			from_external_pointer
			(g_option_group_new
			 (a_name.to_external, a_description.to_external,
			  an_help_description.to_external,
			  default_pointer,
			  -- `user_data' : user data that will be passed to the pre- and
			  -- post-parse hooks, the error hook and to callbacks of
			  -- G_OPTION_ARG_CALLBACK options, or NULL
			  default_pointer	-- destroy: a function that will be called to free user_data, or NULL
			  ))
		end

	free (p: POINTER)
		do
			-- Frees a GOptionGroup. 
			-- Note that you must not free groups which have
			-- been added to a GOptionContext.
			-- g_option_group_free(handle)
		end

	add_entries (some_entries: C_ARRAY[G_OPTION_ENTRY])
			--    Adds the options specified in entries to group.
		do
			--  void g_option_group_add_entries (GOptionGroup *group, const
			-- GOptionEntry *entries); entries is a NULL-terminated array of
			-- GOptionEntrys
			g_option_group_add_entries(handle, some_entries.storage.to_external)
		end

	
	--  GOptionParseFunc ()
	
	--  gboolean (*GOptionParseFunc) (GOptionContext *context, GOptionGroup
	--  *group, gpointer data, GError **error);

	--    The type of function that can be called before and after parsing.
	
	--    context : The active GOptionContext
	--    group :   The group to which the function belongs
	--    data :    User data added to the GOptionGroup containing the option when it was
	--              created with g_option_group_new()
	--    error :   A return location for error details
	--    Returns : TRUE if the function completed successfully, FALSE if an error
	--              occurred, in which case error should be set with g_set_error()

	--   g_option_group_set_parse_hooks ()
	
	--  void g_option_group_set_parse_hooks (GOptionGroup *group,
	--  GOptionParseFunc pre_parse_func, GOptionParseFunc post_parse_func);
	
	--  Associates two functions with group which will be called from
	--  g_option_context_parse() before the first option is parsed and after the
	--  last option has been parsed, respectively.
	
	--    Note that the user data to be passed to pre_parse_func and post_parse_func can be
	--    specified when constructing the group with g_option_group_new().
	
	--    group :           a GOptionGroup
	--    pre_parse_func :  a function to call before parsing, or NULL
	--    post_parse_func : a function to call after parsing, or NULL

	--    Since 2.6

	--   GOptionErrorFunc ()

	--  void (*GOptionErrorFunc) (GOptionContext *context, GOptionGroup *group,
	--  gpointer data, GError **error);

	--    The type of function to be used as callback when a parse error occurs.
	
	--    context : The active GOptionContext
	--    group :   The group to which the function belongs
	--    data :    User data added to the GOptionGroup containing the option when it was
	--              created with g_option_group_new()
	--    error :   The GError containing details about the parse error

	
	--   g_option_group_set_error_hook ()
	
	--  void g_option_group_set_error_hook (GOptionGroup *group, GOptionErrorFunc
	--  error_func);

	--    Associates a function with group which will be called from
	--    g_option_context_parse() when an error occurs.
	
	--    Note that the user data to be passed to pre_parse_func and post_parse_func can be
	--    specified when constructing the group with g_option_group_new().
	
	--    group :      a GOptionGroup
	--    error_func : a function to call when an error occurs
	
	--   g_option_group_set_translate_func ()
	
	--  void g_option_group_set_translate_func (GOptionGroup *group,
	--  GTranslateFunc func, gpointer data, GDestroyNotify destroy_notify);

	-- Sets the function which is used to translate user-visible strings, for
	-- --help output. Different groups can use different GTranslateFuncs. If func
	-- is NULL, strings are not translated.
	
	--    If you are using gettext(), you only need to set the translation domain, see
	--    g_option_group_set_translation_domain().
	
	--    group :          a GOptionGroup
	--    func :           the GTranslateFunc, or NULL
	--    data :           user data to pass to func, or NULL
	--    destroy_notify : a function which gets called to free data, or NULL

	--   g_option_group_set_translation_domain ()

	--  void        g_option_group_set_translation_domain
	--                                              (GOptionGroup *group,
	--                                               const gchar *domain);

	--    A convenience function to use gettext() for translating user-visible strings.

	--    group :  a GOptionGroup
	--    domain : the domain to use

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GOptionGroup)"
		end
end -- class G_OPTION_GROUP

