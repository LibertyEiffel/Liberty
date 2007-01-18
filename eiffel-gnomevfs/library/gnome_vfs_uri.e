indexing
	description: "Uniform Resource    GnomeVFSURI -- Functions for manipulating URIs."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GnomeVFS team
					
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

class GNOME_VFS_URI

inherit SHARED_C_STRUCT redefine copy end 

insert GNOME_VFS_URI_HIDE_OPTIONS

creation
	make, from_external_pointer,
	resolve_relative,
	append_string, append_path, append_file_name,
	copy

feature {} -- Creation
	make (a_text_uri: STRING) is
			-- Create a new uri from `a_text_uri'.

			-- Unsupported and unsafe methods are not allowed and will
			-- result in NULL being returned. URL transforms are allowed.

			-- TODO: `a_text_uri' must be an escaped URI string such as
			-- returned by gnome_vfs_get_uri_from_local_path(),
			-- gnome_vfs_make_uri_from_input(), or
			-- gtk_file_chooser_get_uri().

			-- TODO: require text_uri_is_escaped an escaped string
			-- representing a uri.
		do
			from_external_pointer(gnome_vfs_uri_new(an_text_uri))
		end

	resolve_relative (a_base: GNOME_VFS_URI; a_relative_reference: STRING) is
			--	Create a new uri from `a_relative_reference,' relative to
			--	`a_base'. The resolution algorithm follows RFC 2396. For
			--	details, see section 5.2 of
			--	http://www.ietf.org/rfc/rfc2396.txt .

			-- In short, if the base uri ends in '/', relative_reference
			-- is appended to base, otherwise it replaces the part of
			-- base after the last '/'.
		do
			from_external_pointer
			(gnome_vfs_uri_resolve_relative (a_base.handle,
														a_relative_reference.to_external))
		end

	append_string (an_uri: GNOME_VFS_URI; an_uri_fragment: STRING) is
			-- Create a new uri obtained by appending `an_uri_fragment'
			-- to `an_uri'. This will take care of adding an appropriate
			-- directory separator between the end of `an_uri' and the
			-- start of `an_uri_fragment' if necessary.

			-- `an_uri_fragment': a piece of a uri (ie a fully escaped
			-- partial path).
		require
			uri_not_void: an_uri /= Void
			fragment_not_void: an_uri_fragment /= Void
			-- TODO: an_uri_fragment is a fully escaped partial path).
		do
			from_external_pointer
			(gnome_vfs_uri_append_string (an_uri.handle,
													an_uri_fragment.to_external))
		end

	append_path (an_uri: GNOME_VFS_URI; a_path: STRING) is
			-- Create a new uri obtained by appending `a_path' to
			-- `an_uri'. This will take care of adding an appropriate
			-- directory separator between the end of `an_uri' and the
			-- start of `a_path' if necessary as well as escaping
			-- `a_path' as necessary.
		require
			uri_not_void: an_uri /= Void
			path_not_void: a_path /= Void
		do
			from_external_pointer (gnome_vfs_uri_append_path(an_uri.handle, a_path.to_external))
		end

	append_file_name (an_uri: GNOME_VFS_URI; a_filename: STRING) is
			--  Create a new uri obtained by appending `a_file_name' to
			--  `an_uri'. This will take care of adding an appropriate
			--  directory separator between the end of `an_uri' and the start
			--  of `a_file_name' if necessary. `a_file_name' might, for instance,
			--  be the result of a call to g_dir_read_name() (TODO).

			-- `a_filename' is any "regular" file name (can include #, /,
			-- etc) in the file system encoding. This is not an escaped
			-- URI.
		require
			uri_not_void: an_uri /= Void
			path_not_void: a_path /= Void
		do
			from_external_pointer
			(gnome_vfs_uri_append_file_name (an_uri.handle,
														a_filename.to_extnernal))
		end

	copy (another: like Current) is
		do
			from_external_pointer(gnome_vfs_uri_dup(another.handle))
		end

feature
	ref is
			-- Increment uri's reference count.
		local ptr: POINTER
		do
			ptr:=gnome_vfs_uri_ref(handle)
			check ptr = handle end
		end

	unref is
			-- Decrement uri's reference count. If the reference count
			-- reaches zero, uri is destroyed.
		do
			gnome_vfs_uri_unref(handle)
		end

	to_string (some_options: INTEGER): STRING is
			-- Current uri translated into a printable string. The string
			-- will not contain the uri elements specified by
			-- hide_options.

			-- A file: URI on Win32 might look like
			-- file:///x:/foo/bar.txt. Note that the part after file://
			-- is not a legal file name, you need to remove the / in
			-- front of the drive letter. This function does that
			-- automatically if hide_options specifies that the toplevel
			-- method, user name, password, host name and host port
			-- should be hidden.

			-- On the other hand, a file: URI for a UNC path looks like
			-- file:////server/share/foo/bar.txt, and in that case the
			-- part after file:// is the correct file name.
		require valid_options: is_valid_uri_hide_option(some_options)
		do
			create Result.from_external
			(gnome_vfs_uri_to_string (handle, some_hide_options)
			-- gnome_vfs_uri_to_string returns a malloc'd printable string representing uri.
		ensure not_void: Result/=Void
		end


	is_local: BOOLEAN is
			-- Is an uri a local (native) file system?
		do
			Result:=gnome_vfs_uri_is_local(handle).to_boolean
		end

	has_parent: BOOLEAN is
			-- Does Current uri have a parent?
		do
			Result:=gnome_vfs_uri_has_parent(handle)
		end			

	parent: GNOME_VFS_URI is
			-- The parent uri.
		local ptr: POINTER
		do
			ptr:=gnome_vfs_uri_get_parent(handle)
		ensure has_parent implies Result /= Void
		end
		

--   gnome_vfs_uri_get_toplevel ()

--  GnomeVFSToplevelURI* gnome_vfs_uri_get_toplevel
--                                              (const GnomeVFSURI *uri);

--    Retrieve the toplevel uri in uri.

--    uri :     a GnomeVFSURI.
--    Returns : a pointer to the toplevel uri object.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_host_name ()

--  const gchar* gnome_vfs_uri_get_host_name    (const GnomeVFSURI *uri);

--    Retrieve the host name for uri.

--    uri :     a GnomeVFSURI.
--    Returns : a string representing the host name.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_scheme ()

--  const gchar* gnome_vfs_uri_get_scheme       (const GnomeVFSURI *uri);

--    Retrieve the scheme used for uri.

--    uri :     a GnomeVFSURI.
--    Returns : a string representing the scheme.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_host_port ()

--  guint       gnome_vfs_uri_get_host_port     (const GnomeVFSURI *uri);

--    Retrieve the host port number in uri.

--    uri :     a GnomeVFSURI.
--    Returns : The host port number used by uri. If the value is zero, the
--              default port value for the specified toplevel access method is
--              used.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_user_name ()

--  const gchar* gnome_vfs_uri_get_user_name    (const GnomeVFSURI *uri);

--    Retrieve the user name in uri.

--    uri :     a GnomeVFSURI.
--    Returns : a string representing the user name in uri.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_password ()

--  const gchar* gnome_vfs_uri_get_password     (const GnomeVFSURI *uri);

--    Retrieve the password for uri.

--    uri :     a GnomeVFSURI.
--    Returns : The password for uri.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_set_host_name ()

--  void        gnome_vfs_uri_set_host_name     (GnomeVFSURI *uri,
--                                               const gchar *host_name);

--    Set host_name as the host name accessed by uri.

--    uri :       a GnomeVFSURI.
--    host_name : a string representing a host name.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_set_host_port ()

--  void        gnome_vfs_uri_set_host_port     (GnomeVFSURI *uri,
--                                               guint host_port);

--    Set the host port number in uri. If host_port is zero, the default port
--    for uri's toplevel access method is used.

--    uri :       a GnomeVFSURI.
--    host_port : a TCP/IP port number.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_set_user_name ()

--  void        gnome_vfs_uri_set_user_name     (GnomeVFSURI *uri,
--                                               const gchar *user_name);

--    Set user_name as the user name for uri.

--    uri :       a GnomeVFSURI.
--    user_name : a string representing a user name on the host accessed by uri.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_set_password ()

--  void        gnome_vfs_uri_set_password      (GnomeVFSURI *uri,
--                                               const gchar *password);

--    Set password as the password for uri.

--    uri :      a GnomeVFSURI.
--    password : a password string.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_equal ()

--  gboolean    gnome_vfs_uri_equal             (const GnomeVFSURI *a,
--                                               const GnomeVFSURI *b);

--    Compare a and b.

--    FIXME: This comparison should take into account the possiblity that
--    unreserved characters may be escaped. ...or perhaps
--    gnome_vfs_uri_new() should unescape unreserved characters?

--    a :       a GnomeVFSURI.
--    b :       a GnomeVFSURI.
--    Returns : TRUE if a and b are equal, FALSE otherwise.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_is_parent ()

--  gboolean    gnome_vfs_uri_is_parent         (const GnomeVFSURI *possible_parent,
--                                               const GnomeVFSURI *possible_child,
--                                               gboolean recursive);

--    Check if possible_child is contained by possible_parent. If recursive is
--    FALSE, just try the immediate parent directory, else search up through the
--    hierarchy.

--    possible_parent : a GnomeVFSURI.
--    possible_child :  a GnomeVFSURI.
--    recursive :       a flag to turn recursive check on.
--    Returns :         TRUE if possible_child is contained in possible_parent.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_path ()

--  const gchar* gnome_vfs_uri_get_path         (const GnomeVFSURI *uri);

--    Retrieve full path name for uri.

--    uri :     a GnomeVFSURI.
--    Returns : a pointer to the full path name in uri. Notice that the pointer
--              points to the path name stored in uri, so the path name returned
--              must not be modified nor freed.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_get_fragment_identifier ()

--  const gchar* gnome_vfs_uri_get_fragment_identifier
--                                              (const GnomeVFSURI *uri);

--    uri :
--    Returns :

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_extract_dirname ()

--  gchar*      gnome_vfs_uri_extract_dirname   (const GnomeVFSURI *uri);

--    Extract the name of the directory in which the file pointed to by uri is
--    stored as a newly allocated string. The string will end with a
--    GNOME_VFS_URI_PATH_CHR.

--    uri :     a GnomeVFSURI.
--    Returns : a pointer to the newly allocated string representing the parent
--              directory.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_extract_short_name ()

--  gchar*      gnome_vfs_uri_extract_short_name
--                                              (const GnomeVFSURI *uri);

--    Retrieve base file name for uri, ignoring any trailing path separators.
--    This matches the XPG definition of basename, but not g_basename. This is
--    often useful when you want the name of something that's pointed to by a
--    uri, and don't care whether the uri has a directory or file form. If uri
--    points to the root of a domain, returns the host name. If there's no host
--    name, returns GNOME_VFS_URI_PATH_STR.

--    See also: gnome_vfs_uri_extract_short_path_name().

--    uri :     a GnomeVFSURI.
--    Returns : a pointer to the newly allocated string representing the
--              unescaped short form of the name.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_extract_short_path_name ()

--  gchar*      gnome_vfs_uri_extract_short_path_name
--                                              (const GnomeVFSURI *uri);

--    Retrieve base file name for uri, ignoring any trailing path separators.
--    This matches the XPG definition of basename, but not g_basename. This is
--    often useful when you want the name of something that's pointed to by a
--    uri, and don't care whether the uri has a directory or file form. If uri
--    points to the root (including the root of any domain), returns
--    GNOME_VFS_URI_PATH_STR.

--    See also: gnome_vfs_uri_extract_short_name().

--    uri :     a GnomeVFSURI.
--    Returns : a pointer to the newly allocated string representing the escaped
--              short form of the name.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_hequal ()

--  gint        gnome_vfs_uri_hequal            (gconstpointer a,
--                                               gconstpointer b);

--    Function intended for use as a hash table "are these two items the same"
--    comparison. Useful for creating a hash table of uris.

--    a :       a pointer to a GnomeVFSURI.
--    b :       a pointer to a GnomeVFSURI.
--    Returns : TRUE if the uris are the same.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_hash ()

--  guint       gnome_vfs_uri_hash              (gconstpointer p);

--    Creates an integer value from a GnomeVFSURI, appropriate for using as
--    the key to a hash table entry.

--    p :       a pointer to a GnomeVFSURI.
--    Returns : a hash key corresponding to p.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_list_parse ()

--  GList*      gnome_vfs_uri_list_parse        (const gchar *uri_list);

--    Extracts a list of GnomeVFSURI objects from a standard text/uri-list,
--    such as one you would get on a drop operation. Use
--    gnome_vfs_uri_list_free() when you are done with the list.

--    uri_list : string consists of GnomeVFSURIs and/or paths seperated by
--               newline character.
--    Returns :  a GList of GnomeVFSURIs.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_list_ref ()

--  GList*      gnome_vfs_uri_list_ref          (GList *list);

--    Increments the reference count of the items in list by one.

--    list :    list of GnomeVFSURI elements.
--    Returns : list.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_list_unref ()

--  GList*      gnome_vfs_uri_list_unref        (GList *list);

--    Decrements the reference count of the items in list by one. Note that the
--    list is *not freed* even if each member of the list is freed.

--    list :    list of GnomeVFSURI elements.
--    Returns : list.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_list_copy ()

--  GList*      gnome_vfs_uri_list_copy         (GList *list);

--    Creates a duplicate of list, and references each member of that list.

--    list :    list of GnomeVFSURI elements.
--    Returns : a newly referenced duplicate of list.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_list_free ()

--  void        gnome_vfs_uri_list_free         (GList *list);

--    Decrements the reference count of each member of list by one, and frees
--    the list itself.

--    list : list of GnomeVFSURI elements.

--    --------------------------------------------------------------------------

--   gnome_vfs_uri_make_full_from_relative ()

--  char*       gnome_vfs_uri_make_full_from_relative
--                                              (const char *base_uri,
--                                               const char *relative_uri);

--    Returns a full uri given a full base uri, and a secondary uri which may be
--    relative.

--    base_uri :     a string representing the base uri.
--    relative_uri : a uri fragment/reference to be appended to base_uri.
--    Returns :      a newly allocated string containing the uri (NULL for some
--                   bad errors).
feature {} -- Unwrapped
	
-- 	MAGIC_CHR

--  #define GNOME_VFS_URI_MAGIC_CHR '#'

--    The character used to divide location from extra "arguments" passed to the
--    method.

--   GNOME_VFS_URI_MAGIC_STR

--  #define GNOME_VFS_URI_MAGIC_STR "#"

--    The character used to divide location from extra "arguments" passed to the
--    method.

--   GNOME_VFS_URI_PATH_CHR

--  #define GNOME_VFS_URI_PATH_CHR '/'

--    Defines the path seperator character.

--   GNOME_VFS_URI_PATH_STR

--  #define GNOME_VFS_URI_PATH_STR "/"

--    Defines the path seperator string.

feature {} -- External calls
	--GnomeVFSURI;
	--  GnomeVFSToplevelURI;
	--  enum GnomeVFSURIHideOptions;
	--  #define GNOME_VFS_URI_MAGIC_CHR
	--  #define GNOME_VFS_URI_MAGIC_STR
	--  #define GNOME_VFS_URI_PATH_CHR
	--  #define GNOME_VFS_URI_PATH_STR
 	gnome_vfs_uri_new (a_text_uri: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_new (const gchar *text_uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_resolve_relative (a_base, a_relative_reference: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_resolve_relative (const GnomeVFSURI *base, const gchar *relative_reference);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_ref (a_uri: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_ref (GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_unref (a_uri: POINTER): void is
			-- void gnome_vfs_uri_unref (GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_append_string (a_uri, a_uri_fragment: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_append_string (const GnomeVFSURI *uri, const char *uri_fragment);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_append_path (a_uri, a_path: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_append_path (const GnomeVFSURI *uri, const char *path);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_append_file_name (a_uri, a_filename: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_append_file_name (const GnomeVFSURI *uri, const gchar *filename);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_to_string (a_uri: POINTER; some_hide_options: INTEGER): POINTER is
			-- gchar* gnome_vfs_uri_to_string (const GnomeVFSURI *uri, GnomeVFSURIHideOptions hide_options);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_dup (a_uri: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_dup (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_is_local (a_uri: POINTER): INTEGER is
			-- gboolean gnome_vfs_uri_is_local (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_has_parent (a_uri: POINTER): INTEGER is
			-- gboolean gnome_vfs_uri_has_parent (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_parent (a_uri: POINTER): POINTER is
			-- GnomeVFSURI* gnome_vfs_uri_get_parent (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_toplevel (a_uri: POINTER): POINTER is
			-- GnomeVFSToplevelURI* gnome_vfs_uri_get_toplevel (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_host_name (a_uri: POINTER): POINTER is
			-- gchar* gnome_vfs_uri_get_host_name (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_scheme (a_uri: POINTER): POINTER is
			-- const gchar* gnome_vfs_uri_get_scheme (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_host_port (a_uri: POINTER): INTEGER is
			-- guint gnome_vfs_uri_get_host_port (const GnomeVFSURI 
			--*uri);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_user_name (a_uri: POINTER): POINTER is
			-- const gchar* gnome_vfs_uri_get_user_name (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_password (a_uri: POINTER): POINTER is
			-- const gchar* gnome_vfs_uri_get_password (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_set_host_name (a_uri, a_host_name: POINTER) is
			-- void gnome_vfs_uri_set_host_name (GnomeVFSURI *uri, const gchar *host_name);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_set_host_port (a_uri: POINTER, guint host_port) is
			-- void gnome_vfs_uri_set_host_port (GnomeVFSURI *uri, guint host_port);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_set_user_name (a_uri: POINTER, a_user_name: POINTER) is
			-- void gnome_vfs_uri_set_user_name (GnomeVFSURI *uri, const gchar *user_name);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_set_password (a_uri: POINTER, a_password: POINTER) is
			-- void gnome_vfs_uri_set_password (GnomeVFSURI *uri, const gchar *password);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_equal (a_a: POINTER, a_b: POINTER): INTEGER is
			-- gboolean gnome_vfs_uri_equal (const GnomeVFSURI *a, const GnomeVFSURI *b);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_is_parent (a_possible_parent, a_possible_child; recursive: INTEGER): INTEGER is
			-- gboolean gnome_vfs_uri_is_parent (const GnomeVFSURI
			-- *possible_parent, const GnomeVFSURI *possible_child,
			-- gboolean recursive);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_path (a_uri: POINTER): POINTER is
			-- const gchar* gnome_vfs_uri_get_path (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_get_fragment_identifier (a_uri: POINTER): POINTER is
			-- const gchar* gnome_vfs_uri_get_fragment_identifier (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_extract_dirname (a_uri: POINTER): POINTER is
			-- gchar* gnome_vfs_uri_extract_dirname (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_extract_short_name (a_uri: POINTER): POINTER is
			-- gchar* gnome_vfs_uri_extract_short_name (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_extract_short_path_name (a_uri: POINTER): POINTER is
			-- gchar* gnome_vfs_uri_extract_short_path_name (const GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_hequal (an_a, a_b: POINTER): INTEGER is
			-- gint gnome_vfs_uri_hequal (gconstpointer a, gconstpointer b);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_hash (a_p: POINTER): INTEGER is
			-- guint gnome_vfs_uri_hash (gconstpointer p);

			-- TODO: Result should be NATURAL, since it is a guint
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_parse (a_uri_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_parse (const gchar *uri_list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_ref (a_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_ref (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_unref (a_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_unref (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_copy (a_list: POINTER): POINTER is
			-- GList* gnome_vfs_uri_list_copy (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_list_free (a_list: POINTER) is
			-- void gnome_vfs_uri_list_free (GList *list);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_make_full_from_relative (a_base_uri, a_relative_uri: POINTER): POINTER is
			-- char* gnome_vfs_uri_make_full_from_relative (const char *base_uri, const char *relative_uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end


-- Description

-- Details

--  GnomeVFSURI

--  typedef struct {
--  /* Reference count. */
--  guint ref_count;

--  /* Text for the element: eg. some/path/name. */
--  gchar *text;

--  /* Text for uri fragment: eg, #anchor */
--  gchar *fragment_id;

--  /* Method string: eg. `gzip', `tar', `http'. This is necessary as
--  one GnomeVFSMethod can be used for different method strings (e.g. extfs handles zip, rar, zoo and several other ones). */
--  gchar *method_string;

--  /* VFS method to access the element. */
--  struct GnomeVFSMethod *method;

--  /* Pointer to the parent element, or NULL for toplevel elements. */
--  struct GnomeVFSURI *parent;

--  /* Reserved to avoid future breaks in ABI compatibility */
--  void *reserved1;
--  void *reserved2;
--  } GnomeVFSURI;

--  --------------------------------------------------------------------------

--  GnomeVFSToplevelURI

--  typedef struct {
--  /* Base object. */
--  GnomeVFSURI uri;

--  /* Server location information. */
--  gchar *host_name;
--  guint host_port;

--  /* Authorization information. (unescaped) */
--  gchar *user_name;
--  gchar *password;

--  /* The parent URN, if it exists */
--  gchar *urn;

--  /* Reserved to avoid future breaks in ABI compatibility */
--  void *reserved1;
--  void *reserved2;
--  } GnomeVFSToplevelURI;

end -- GNOME_VFS_URI
