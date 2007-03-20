indexing
	description: "Various utilities functions of Gnome-VFS to manipulate uris "
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

deferred class GNOME_VFS_UTILITIES
	
insert 
	GNOME_VFS_RESULT
	GNOME_VFS_MAKE_URI_DIRS_FLAGS
	GNOME_VFS_FILE_SIZE

feature -- Utilities
	unlink (a_text_uri: STRING) is
			-- Unlink `a_text_uri' (i.e. delete the file).

			-- `last_result' will be the result of the operation.
		do
			last_result:=gnome_vfs_unlink(a_text_uri.to_external)
		end

	move (an_old_uri, a_new_uri: STRING; force_replace: BOOLEAN) is
			-- Move a file from `an_old_uri' to `a_new_uri'. This will
			-- only work if both uris are on the same file
			-- system. Otherwise, it is necessary to use the more general
			-- (TODO) gnome_vfs_xfer_uri() function.

			-- `an_old_uri': string representing the source file
			-- location.

			-- `a_new_uri':  string representing the destination file 
			-- location.

			-- `force_replace' : if TRUE, perform the operation even if it
			-- unlinks an existing file at new_text_uri.

			-- `last_result' will be the result of the operation.
		require 
			old_uri_not_void: an_old_uri /= Void
			new_uri_not_void: a_new_uri /= Void
			-- TODO: same_filesystem: 
		do
			last_result := gnome_vfs_move (an_old_uri.to_external,
													 a_new_uri.to_external,
													 force_replace.to_integer)
		end

	move_uri (an_old_uri, a_new_uri: GNOME_VFS_URI; force_replace: BOOLEAN) is
			-- Move a file from `an_old_uri' to `a_new_uri'. This will
			-- only work if old_uri and new_uri are on the same file
			-- system. Otherwise, it is necessary to use the more
			-- general (TODO) gnome_vfs_xfer_uri() function.

			-- `an_old_uri': source uri.

			--  `a_new_uri' : destination uri.

			-- `force_replace' : if TRUE, move `an_old_uri' to
			-- `a_new_uri' even if there is already a file at
			-- `a_new_uri'. If there is a file, it will be discarded.

			-- `last_result' will be the result of the operation.
		require 
			old_uri_not_void: an_old_uri /= Void
			new_uri_not_void: a_new_uri /= Void
			-- TODO: same_filesystem:
		do
			last_result:=gnome_vfs_move_uri(an_old_uri.handle, a_new_uri.handle, 
													  force_replace.to_integer)
		end

	check_same_fs (an_uri, another_uri: STRING): BOOLEAN is
			-- Are `an_uri' and `another_uri' on the same file system?
			-- `last_result' will be updated.
		require 
			uri_not_void: an_uri/=Void
			another_uri_not_void: another_uri/=Void
		local same_fs_return: INTEGER
		do
			last_result:=(gnome_vfs_check_same_fs
							  (an_uri.to_external, another_uri.to_external, 
								$same_fs_return))
			Result:=same_fs_return.to_boolean
		end
feature -- Uri manipulation
	full_uri_from_relative (a_full_base_uri, a_secondary_uri: STRING): STRING is
			-- a full uri given `a_full_base_uri,' and `a_secondary_uri'
			-- which may be relative. Can be Void for some bad errors.

			-- `a_base_uri' :     a string representing the base uri.

			-- `a_secondary_uri': a uri fragment/reference to be appended
			-- to base_uri.
		local ptr: POINTER
		do
			ptr:=(gnome_vfs_uri_make_full_from_relative
					(a_base_uri.to_external,
					 a_relative_uri.to_external))
			if ptr.is_not_null then create Result.from_external(ptr) end
		end

	format_file_size_for_display (a_file_size: like gnome_vfs_file_size): STRING is
			-- Formats `a_file_size' passed so that it is easy for the
			-- user to read.  Gives the size in bytes, kilobytes,
			-- megabytes or gigabytes, choosing whatever is
			-- appropriate.

			-- Note: currently `a_file_size' (like gnome_vfs_file_size)
			-- is an INTEGER 64; it should be a NATURAL_64, since it is a
			-- guint64 value.-
		do
			 create Result.from_external(gnome_vfs_format_file_size_for_display(a_file_size))
		end

	format_uri_for_display (an_uri: STRING) is
			-- Filter, modify, unescape and change `an_uri' to make it
			-- appropriate for display to users. The conversion is done
			-- such that the roundtrip to UTF-8 is reversible.

			-- Rules: file: uri without fragments should appear as local
			-- paths. file: uri with fragments should appear as
			-- file:uri. All other uri appear as expected.
		require uri_not_void: an_rui /= Void
		do
			create Result.from_external(gnome_vfs_format_uri_for_display(an_uri.to_external))
		end

	show_url (an_url: STRING) is
			-- Launches the default application or component associated with `an_0url'.

			-- `last_result' will be `gnome_vfs_ok' if the default action
			-- was launched, `gnome_vfs_error_bad_parameters' for an
			-- invalid or non-existant url, `gnome_vfs_error_no_default'
			-- if no default action is associated with the url. Also
			-- error codes from (TODO: those have still to be
			-- Eiffellized) gnome_vfs_mime_action_launch() or
			-- gnome_vfs_mime_action_launch_with_env().
		do
			last_result:=gnome_vfs_url_show(an_url.to_external)
		end

	-- TODO:  gnome_vfs_url_show_with_env ()
	
	--  GnomeVFSResult gnome_vfs_url_show_with_env  (const char *url,
	--                                               char **envp);
	
	--    Like gnome_vfs_url_show() except that the default action will be
	--    launched with the given environment.
	
	--    url :     url to be shown.
	--    envp :    environment data.
	--    Returns : GNOME_VFS_OK if the default action was launched.
	--              GNOME_VFS_ERROR_BAD_PARAMETERS for an invalid or non-existant
	--              url, GNOME_VFS_ERROR_NO_DEFAULT if no default action is
	--              associated with the url. Also error codes from
	--              gnome_vfs_mime_application_launch_with_env() or
	--              gnome_vfs_mime_action_launch_with_env().

	escape_string (a_string: STRING): STRING is
		do
			create Result.from_e

--  char*       gnome_vfs_escape_string         (const char *string);

--    Escapes string, replacing any and all special characters with equivalent
--    escape sequences.

--    string :  string to be escaped.
--    Returns : a newly allocated string equivalent to string but with all
--              special characters escaped.

--    --------------------------------------------------------------------------

--   gnome_vfs_escape_path_string ()

--  char*       gnome_vfs_escape_path_string    (const char *path);

--    Escapes path, replacing only special characters that would not be found in
--    paths (so '/', '&', '=', and '?' will not be escaped by this function).

--    path :    string to be escaped.
--    Returns : a newly allocated string equivalent to path but with non-path
--              characters escaped.

--    --------------------------------------------------------------------------

--   gnome_vfs_escape_host_and_path_string ()

--  char*       gnome_vfs_escape_host_and_path_string
--                                              (const char *path);

--    Escapes path, replacing only special characters that would not be found in
--    paths or host name (so '/', '&', '=', ':', '@' and '?' will not be escaped
--    by this function).

--    path :    string to be escaped.
--    Returns : a newly allocated string equivalent to path but with
--              non-path/host characters escaped.

--    --------------------------------------------------------------------------

--   gnome_vfs_escape_slashes ()

--  char*       gnome_vfs_escape_slashes        (const char *string);

--    Escapes only '/' and '%' characters in string, replacing them with their
--    escape sequence equivalents.

--    string :  string to be escaped.
--    Returns : a newly allocated string equivalent to string, but with no
--              unescaped '/' or '%' characters.

--    --------------------------------------------------------------------------

--   gnome_vfs_escape_set ()

--  char*       gnome_vfs_escape_set            (const char *string,
--                                               const char *match_set);

--    Escapes all characters in string which are listed in match_set.

--    string :    string to be escaped.
--    match_set : a string containing all characters to be escaped in string.
--    Returns :   a newly allocated string equivalent to string but with
--                characters in match_string escaped.

--    --------------------------------------------------------------------------

--   gnome_vfs_unescape_string ()

--  char*       gnome_vfs_unescape_string       (const char *escaped_string,
--                                               const char *illegal_characters);

--    Decodes escaped characters (i.e. PERCENTxx sequences) in escaped_string.
--    Characters are encoded in PERCENTxy form, where xy is the ASCII hex code
--    for character 16x+y.

--    escaped_string :     an escaped uri, path, or other string.
--    illegal_characters : a string containing a sequence of characters
--                         considered "illegal" to be escaped, '\0' is
--                         automatically in this list.
--    Returns :            a newly allocated string with the unescaped
--                         equivalents, or NULL if escaped_string contained an
--                         escaped encoding of one of the characters in
--                         illegal_characters.

--    --------------------------------------------------------------------------

--   gnome_vfs_make_uri_canonical ()

--  char*       gnome_vfs_make_uri_canonical    (const char *uri);

--    Standardizes the format of the uri, so that it can be used later in other
--    functions that expect a canonical uri.

--    uri :     an absolute or relative stringified uri. It might have scheme.
--    Returns : a newly allocated string that contains the canonical
--              representation of uri.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gnome_vfs_make_uri_canonical_strip_fragment ()

--  char*       gnome_vfs_make_uri_canonical_strip_fragment
--                                              (const char *uri);

--    Returns a canonicalized uri. If uri contains a fragment (anything after a
--    '#') strips off that and then makes the uri canonical.

--    uri :     a GnomeVFSURI.
--    Returns : a newly allocated string containing a canonical uri.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gnome_vfs_make_path_name_canonical ()

--  char*       gnome_vfs_make_path_name_canonical
--                                              (const char *path);

--    Calls _gnome_vfs_canonicalize_pathname(), allocating storage for the
--    result and providing for a cleaner memory management.

--    path :    a file path, relative or absolute.
--    Returns : a canonical version of path.

--    --------------------------------------------------------------------------

--   gnome_vfs_make_uri_from_input ()

--  char*       gnome_vfs_make_uri_from_input   (const char *location);

--    Takes a user input path/uri and makes a valid uri out of it.

--    This function is the reverse of gnome_vfs_format_uri_for_display() but
--    it also handles the fact that the user could have typed arbitrary UTF-8 in
--    the entry showing the string.

--    location : a possibly mangled "uri", in UTF-8.
--    Returns :  a newly allocated uri.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gnome_vfs_make_uri_from_input_with_dirs ()

--  char*       gnome_vfs_make_uri_from_input_with_dirs
--                                              (const char *location,
--                                               GnomeVFSMakeURIDirs dirs);

--    Determines a fully qualified uri from a relative or absolute input path.
--    Basically calls gnome_vfs_make_uri_from_input() except it specifically
--    tries to support paths relative to the specified directories (can be
--    homedir and/or current directory). See GnomeVFSMakeURIDirs for more
--    information.

--    location : a relative or absolute path.
--    dirs :     directory to use as a base directory if location is a relative
--               path.
--    Returns :  a newly allocated string containing the fully qualified uri.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gnome_vfs_make_uri_from_shell_arg ()

--  char*       gnome_vfs_make_uri_from_shell_arg
--                                              (const char *uri);

--    Similar to gnome_vfs_make_uri_from_input(), except that:

--    1) guesses relative paths instead of http domains. 2) doesn't bother
--    stripping leading/trailing white space. 3) doesn't bother with ~
--    expansion--that's done by the shell.

--    uri :     path to make the uri from.
--    Returns : a newly allocated string representing uri.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gnome_vfs_make_uri_full_from_relative ()

--  char*       gnome_vfs_make_uri_full_from_relative
--                                              (const char *base_uri,
--                                               const char *relative_uri);

--   Warning

--    gnome_vfs_make_uri_full_from_relative is deprecated and should not be used
--    in newly-written code. This function is deprecated, please use
--    gnome_vfs_uri_make_full_from_relative() from gnome-vfs-uri.h .

--    Returns a string representing the full uri given a full base_uri and a
--    secondary uri which may be relative.

--    base_uri :     path to use as the base for the full uri.
--    relative_uri : full or relative path to be appended to the base_uri.
--    Returns :      a newly allocated string containing the uri. (NULL for some
--                   bad errors).

--    Since 2.2

--    --------------------------------------------------------------------------

--   gnome_vfs_expand_initial_tilde ()

--  char*       gnome_vfs_expand_initial_tilde  (const char *path);

--    If path starts with a ~, representing the user's home directory, expand it
--    to the actual path location.

--    path :    a local file path which may start with a '~'.
--    Returns : a newly allocated string with the initial tilde (if there was
--              one) converted to an actual path.

--    --------------------------------------------------------------------------

--   gnome_vfs_unescape_string_for_display ()

--  char*       gnome_vfs_unescape_string_for_display
--                                              (const char *escaped);

--    Similar to gnome_vfs_unescape_string, but it returns something
--    semi-intelligable to a user even upon receiving traumatic input such as 00
--    or URIs in bad form.

--    See also: gnome_vfs_unescape_string().

--    WARNING: You should never use this function on a whole URI! It unescapes
--    reserved characters, and can result in a mangled URI that can not be
--    re-entered. For example, it unescapes "#" "&" and "?", which have special
--    meanings in URI strings.

--    escaped : a string encoded with escaped sequences.
--    Returns : a pointer to a g_malloc'd string with all characters replacing
--              their escaped hex values.

--    --------------------------------------------------------------------------

--   gnome_vfs_get_local_path_from_uri ()

--  char*       gnome_vfs_get_local_path_from_uri
--                                              (const char *uri);

--    Create a local path for a file:/// uri. Do not use with uris of other
--    methods.

--    uri :     uri to convert to a local path.
--    Returns : a newly allocated string containing the local path. NULL is
--              returned on error or if the uri isn't a file: uri without a
--              fragment identifier (or chained uri).

--    --------------------------------------------------------------------------

--   gnome_vfs_get_uri_from_local_path ()

--  char*       gnome_vfs_get_uri_from_local_path
--                                              (const char *local_full_path);

--    Returns a file:/// URI for the local path local_full_path, such as a path
--    provided by gtk_file_chooser_get_filename(). The resulting URI may be
--    provided, for instance, to gnome_vfs_uri_new().

--    On Windows local_full_path should be in the UTF-8 encoding, and can start
--    with a drive letter, but doesn't have to.

--    local_full_path : a full local filesystem path (i.e. not relative).
--    Returns :         a newly allocated string containing the uri
--                      corresponding to local_full_path (NULL for some bad
--                      errors).

--    --------------------------------------------------------------------------

--   gnome_vfs_is_executable_command_string ()

--  gboolean    gnome_vfs_is_executable_command_string
--                                              (const char *command_string);

--    Checks if command_string starts with the full path of an executable file
--    or an executable in $PATH.

--    command_string : a string representing a command ie "xterm -bg white".
--    Returns :        TRUE if command_string started with an executable file,
--                     and is in $PATH, FALSE otherwise.

--    --------------------------------------------------------------------------

--   gnome_vfs_list_deep_free ()

--  void        gnome_vfs_list_deep_free        (GList *list);

--    Free list and call g_free() on all data members.

--    list : list to be freed.

--    --------------------------------------------------------------------------

--   gnome_vfs_get_volume_free_space ()

--  GnomeVFSResult gnome_vfs_get_volume_free_space
--                                              (const GnomeVFSURI *vfs_uri,
--                                               GnomeVFSFileSize *size);

--    Stores the amount of free space in bytes on vfs-uri's volume in size.

--    vfs_uri : a GnomeVFSURI.
--    size :    a GnomeVFSFileSize.
--    Returns : GNOME_VFS_OK on success, otherwise an GNOME_VFS_ERROR_* code.

--    --------------------------------------------------------------------------

--   gnome_vfs_icon_path_from_filename ()

--  char*       gnome_vfs_icon_path_from_filename
--                                              (const char *filename);

--    filename :
--    Returns :  Returns the icon path for the relative_filename. Example:
--               gnome_vfs_icon_path_from_filename
--               ("nautilus/nautilus-desktop.png") will return a string forming
--               the full path of the file nautilus-desktop.png ie
--               $PREFIX/share/pixmaps/nautilus/nautilus-desktop.png.

--    --------------------------------------------------------------------------

--   gnome_vfs_is_primary_thread ()

--  gboolean    gnome_vfs_is_primary_thread     (void);

--    Check if the current thread is the thread with the main glib event loop.

--    Returns : TRUE if the current thread is the thread with the main glib
--              event loop.

--    --------------------------------------------------------------------------

--   gnome_vfs_get_uri_scheme ()

--  char*       gnome_vfs_get_uri_scheme        (const char *uri);

--    Retrieve the scheme used in uri.

--    uri :     a stringified uri.
--    Returns : a newly allocated string containing the scheme, NULL if uri
--              doesn't contain a scheme.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gnome_vfs_uris_match ()

--  gboolean    gnome_vfs_uris_match            (const char *uri_1,
--                                               const char *uri_2);

--    Compare two uris.

--    uri_1 :   stringified uri to compare with uri_2.
--    uri_2 :   stringified uri to compare with uri_1.
--    Returns : TRUE if they are the same, FALSE otherwise.

--    Since 2.2

--    --------------------------------------------------------------------------

--   GNOME_VFS_ASSERT_PRIMARY_THREAD

--  #define GNOME_VFS_ASSERT_PRIMARY_THREAD g_assert (gnome_vfs_is_primary_thread())

--    Asserts that the current thread is the thread with the main glib event
--    loop

--    --------------------------------------------------------------------------

--   GNOME_VFS_ASSERT_SECONDARY_THREAD

--  #define GNOME_VFS_ASSERT_SECONDARY_THREAD g_assert (!gnome_vfs_is_primary_thread())

--    Asserts that the current thread is NOT the thread with the main glib event
--    loop

--    --------------------------------------------------------------------------

--   gnome_vfs_read_entire_file ()

--  GnomeVFSResult gnome_vfs_read_entire_file   (const char *uri,
--                                               int *file_size,
--                                               char **file_contents);

--    Reads an entire file into memory for convenience. Beware accidentally
--    loading large files into memory with this function.

--    Since version 2.10 the string stored in file_contents will be
--    null-terminated, so for text files you can use result as a normal string.

--    uri :           uri of the file to read.
--    file_size :     after reading the file, contains the size of the file
--                    read.
--    file_contents : contains the file_size bytes, the contents of the file at
--                    uri.
--    Returns :       an integer representing the result of the operation.

--    Since 2.2

feature {} -- External calls
	gnome_vfs_unlink (a_text_uri: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_unlink (const gchar *text_uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_move (an_old_text_uri, a_new_text_uri: POINTER; force_replace: INTEGER): INTEGER is
			-- GnomeVFSResult gnome_vfs_move (const gchar *old_text_uri, const gchar *new_text_uri, gboolean force_replace);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
			
 	gnome_vfs_uri_make_full_from_relative (a_base_uri, a_relative_uri: POINTER): POINTER is
			-- char* gnome_vfs_uri_make_full_from_relative (const char *base_uri, const char *relative_uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_unlink_from_uri (an_uri: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_unlink_from_uri (GnomeVFSURI *uri)
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
															  
	gnome_vfs_move_uri (an_old_uri, a_new_uri: POINTER; force_replace: INTEGER) is
		external "C use <libgnomevfs/gnome-vfs.h>"
		end


	gnome_vfs_check_same_fs (a_source, a_target, same_fs_return_bool: POINTER): INTEGER is 
			-- GnomeVFSResult gnome_vfs_check_same_fs (const gchar
			-- *source, const gchar *target, gboolean *same_fs_return);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_create_symbolic_link (a_uri, a_target_reference: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_create_symbolic_link (GnomeVFSURI *uri, const gchar *target_reference);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_format_file_size_for_display (a_size: like gnome_vfs_file_size): POINTER is
			--  char* gnome_vfs_format_file_size_for_display (GnomeVFSFileSize size);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	

	gnome_vfs_format_uri_for_display (a_uri: POINTER): POINTER is
			--  char* gnome_vfs_format_uri_for_display (const char *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	

	gnome_vfs_url_show (a_url: POINTER): INTEGER is
			--  GnomeVFSResult gnome_vfs_url_show (const char *url);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	

	gnome_vfs_url_show_with_env (a_url, an_envp: POINTER): INTEGER is
			--  GnomeVFSResult gnome_vfs_url_show_with_env (const char
			--  *url, char **envp);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	
	gnome_vfs_escape_string (a_string: POINTER): POINTER is
			--  char* gnome_vfs_escape_string (const char *string);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_escape_path_string (a_path: POINTER): POINTER is
			--  char* gnome_vfs_escape_path_string (const char *path);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_escape_host_and_path_string (a_path: POINTER): POINTER is
			--  char* gnome_vfs_escape_host_and_path_string (const char *path);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_escape_slashes (a_string: POINTER): POINTER is
			--  char* gnome_vfs_escape_slashes (const char *string);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_escape_set (a_string: POINTER, a_match_set: POINTER): POINTER is
			-- char* gnome_vfs_escape_set (const char *string, const char
			-- *match_set);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_unescape_string (a_escaped_string, some_illegal_characters: POINTER): POINTER is
			--  char* gnome_vfs_unescape_string (const char
			--  *escaped_string, const char *illegal_characters);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_uri_canonical (a_uri: POINTER): POINTER is
			--  char* gnome_vfs_make_uri_canonical (const char *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_uri_canonical_strip_fragment (a_uri: POINTER): POINTER is
			--  char* gnome_vfs_make_uri_canonical_strip_fragment (const char *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_path_name_canonical (a_path: POINTER): POINTER is
			--  char* gnome_vfs_make_path_name_canonical (const char *path);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_uri_from_input (a_location: POINTER): POINTER is
			--  char* gnome_vfs_make_uri_from_input (const char *location);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_uri_from_input_with_dirs (a_location: POINTER, some_make_uri_dirs_flags: INTEGER): POINTER is
			--  char* gnome_vfs_make_uri_from_input_with_dirs (const char
			--  *location, GnomeVFSMakeURIDirs dirs);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_uri_from_shell_arg (a_uri: POINTER): POINTER is
			--  char* gnome_vfs_make_uri_from_shell_arg (const char *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_make_uri_full_from_relative (a_base_uri, a_relative_uri: POINTER): POINTER is
			-- char* gnome_vfs_make_uri_full_from_relative (a_base_uri:
			-- POINTER, const char *relative_uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_expand_initial_tilde (a_path: POINTER): POINTER is
			--  char* gnome_vfs_expand_initial_tilde (const char *path);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_unescape_string_for_display (a_escaped: POINTER): POINTER is
			--  char* gnome_vfs_unescape_string_for_display (const char *escaped);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_get_local_path_from_uri (a_uri: POINTER): POINTER is
			--  char* gnome_vfs_get_local_path_from_uri (const char *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_get_uri_from_local_path (a_local_full_path: POINTER): POINTER is
			-- char* gnome_vfs_get_uri_from_local_path (const char
			-- *local_full_path);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_is_executable_command_string (a_command_string: POINTER): INTEGER is
			-- gboolean gnome_vfs_is_executable_command_string (const
			-- char *command_string);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_list_deep_free (a_list: POINTER) is
			--  void gnome_vfs_list_deep_free (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_get_volume_free_space (a_vfs_uri, a_size: POINTER): INTEGER is
			--  GnomeVFSResult gnome_vfs_get_volume_free_space (const
			--  GnomeVFSURI *vfs_uri, GnomeVFSFileSize *size);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_icon_path_from_filename (a_filename: POINTER): POINTER is
			--  char* gnome_vfs_icon_path_from_filename (const char *filename);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_is_primary_thread: INTEGER is
			--  gboolean gnome_vfs_is_primary_thread (void);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_get_uri_scheme (a_uri: POINTER): POINTER is
			--  char* gnome_vfs_get_uri_scheme (const char *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_uris_match (an_uri, another_uri: POINTER): INTEGER is
			--  gboolean gnome_vfs_uris_match (const char *uri_1, const char *uri_2);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	-- #define GNOME_VFS_ASSERT_PRIMARY_THREAD

	--  #define GNOME_VFS_ASSERT_SECONDARY_THREAD
	
	gnome_vfs_read_entire_file (a_uri, a_file_size, file_contents_ptr: POINTER): INTEGER is
			--  GnomeVFSResult gnome_vfs_read_entire_file (const char
			--  *uri, int *file_size, char **file_contents);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
end -- class GNOME_VFS_UTILITIES
