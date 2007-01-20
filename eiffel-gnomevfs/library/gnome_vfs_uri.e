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

inherit 
	SHARED_C_STRUCT 
		redefine 
			copy, 
			is_equal 
		end 
	HASHABLE

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
		
	toplevel: GNOME_VFS_TOP_LEVEL_URI is
			-- the toplevel uri in Current uri.
		local ptr: POINTER
		do
			ptr:= gnome_vfs_uri_get_toplevel(handle)
			if ptr.is_not_null then
				if wrappers.has(ptr)
				 then Result::=wrappers.at(ptr)
				else create Result.from_external_pointer(ptr)
				end
			else
				Result:=Void
				-- unnecessary, but it makes clear that we're breaking the
				-- contract
			end
		ensure not_void: Result/=Void
		end
			
	host_name: CONST_STRING is
		do
			create Result.from_external(gnome_vfs_uri_get_host_name(handle))
		ensure not_void: Result /= Void
		end

	scheme: CONST_STRING is
			-- Retrieve the scheme used for uri.
		do
			create Result.from_external(gnome_vfs_uri_get_scheme(handle))
		ensure not_void: Result /= Void
		end
		
	host_port: INTEGER is
			-- The host port number used by uri. If the value is zero,
			-- the default port value for the specified toplevel
			-- access method is used.  
		do
			Result:=gnome_vfs_uri_get_host_port(handle)
		end

	user_name: CONST_STRING is
			-- the user name in uri.
		do
			create Result.from_external(gnome_vfs_uri_get_user_name(handle))
		ensure not_void: Result /= Void
		end

	password: CONST_STRING is
			-- the password for Current uri.
		do
			create Result.from_external(gnome_vfs_uri_get_password(handle))
		ensure not_void: Result /= Void
		end

feature -- Setters
	set_host_name (an_host_name: STRING) is
			-- Set `an_host_name' as the host name accessed by Current
			-- uri.
		do
			gnome_vfs_uri_set_host_name(handle, an_host_name.to_external)
		ensure set: an_host_name.is_equal(host_name)
		end

	set_host_port (an_host_port: INTEGER) is
			-- Set the (TCP/IP) host port number in uri. If
			-- `an_host_port' is zero, the default port for uri's
			-- toplevel access method is used.
		
			-- TODO: an_host_port should be a NATURAL, since it is a guint
		do
			gnome_vfs_uri_set_host_port (handle, an_host_port)
		end

	set_user_name (an_user_name: STRING) is
			-- Set `an_user_name' as the user name for uri.
		require user_name_not_void: an_user_name /= Void
		do
			gnome_vfs_uri_set_user_name(handle, an_user_name.to_external)
		ensure set: an_user_name.is_equal(user_name)
		end

	set_password (a_password: STRING) is
			-- Set `a_password' as the password for uri.
		require password_not_void: a_password /= Void
		do
			gnome_vfs_uri_set_password (handle, a_password.to_external)
		end

feature 
	is_equal (another: like Current): BOOLEAN is
			-- Is `another' equal to Current?

			-- FIXME: This comparison should take into account the
			-- possiblity that unreserved characters may be
			-- escaped. ...or perhaps gnome_vfs_uri_new() should unescape
			-- unreserved characters?
		do
			Result:=gnome_vfs_uri_equal(handle, another.handle).to_boolean
		end

	is_parent (a_possible_child: GNOME_VFS_URI; recursive: BOOLEAN): BOOLEAN is
			-- Is `a_possible_child' contained by Current? If `recursive'
			-- is False, just try the immediate parent directory, else
			-- search up through the hierarchy.
		require child_not_void: a_possible_child /= Void
		do
			Result:=(gnome_vfs_uri_is_parent (handle, a_possible_child.handle, recursive.to_integer)).to_boolean
		end

	path: CONST_STRING is
			-- the full path name for uri.
		do
			create Result.from_external(gnome_vfs_uri_get_path(handle))
			-- Returns : a pointer to the full path name in uri. Notice
			-- that the pointer points to the path name stored in uri, so
			-- the path name returned must not be modified nor freed.
		end

	fragment_identifier: CONST_STRING is
		do
			create Result.from_external (gnome_vfs_uri_get_fragment_identifier(handle))
		end

	dirname: STRING is
			-- the name of the directory in which the file pointed to by
			-- uri as a newly allocated string. TODO: Eiffellize this
			-- "The string will end with a GNOME_VFS_URI_PATH_CHR"
		do
			create Result.from_external(gnome_vfs_uri_extract_dirname(handle))
		end

	short_name: STRING is
			-- the base file name for uri as a newly unescaped allocated
			-- string, ignoring any trailing path separators. This
			-- matches the XPG definition of basename, but not g_basename
			-- (TODO: Eiffellize). This is often useful when you want the
			-- name of something that's pointed to by an uri, and don't
			-- care whether the uri has a directory or file form. If uri
			-- points to the root of a domain, returns the host name. If
			-- there's no host name, returns `GNOME_VFS_URI_PATH_STR'.
				
			-- See also `short_path_name'
		do
			create Result.from_external(gnome_vfs_uri_extract_short_name(handle))
		ensure not_void: Result/=Void
		end

	short_path_name: STRING is
			-- the base file name for uri as a newly allocated string,
			-- ignoring any trailing path separators.  This matches the
			-- XPG definition of basename, but not g_basename. This is
			-- often useful when you want the name of something that's
			-- pointed to by a uri, and don't care whether the uri has a
			-- directory or file form. If uri points to the root
			-- (including the root of any domain), returns
			-- `GNOME_VFS_URI_PATH_STR'.
		
			-- See also: `short_name'.
		do
			create Result.from_external(gnome_vfs_uri_extract_short_path_name(handle))
		ensure not_void: Result/=Void
		end

	-- TODO: provide useful wrap of gnome_vfs_uri_hequal ()

	-- gint gnome_vfs_uri_hequal (gconstpointer a, -- gconstpointer b);

	-- Function intended for use as a hash table "are these two items
	-- the same" comparison. Useful for creating a hash table of uris.

	-- a :       a pointer to a GnomeVFSURI.
	-- b :       a pointer to a GnomeVFSURI.
	-- Returns : TRUE if the uris are the same.
	
	hash_code: INTEGER_32 is 
			-- An integer value from a GnomeVFSURI, appropriate for using
			-- as the key to a hash table entry.
		
			-- Note: the original C implmententaion returns a guint which
			-- should be akin to a NATURAL (once
			-- implemented). Nevertheless this feature that implements
			-- HASHABLE needs to be INTEGER_32
		do
			Result:=gnome_vfs_uri_hash(handle)
		end



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
feature -- Utilities
	--    --------------------------------------------------------------------------

--   gnome_vfs_unlink_from_uri ()

--  GnomeVFSResult gnome_vfs_unlink_from_uri    (GnomeVFSURI *uri);

--    Unlink uri (i.e. delete the file).

--    uri :     uri of the file to be unlinked.
--    Returns : an integer representing the result of the operation.

--    --------------------------------------------------------------------------

--   gnome_vfs_move_uri ()

--  GnomeVFSResult gnome_vfs_move_uri           (GnomeVFSURI *old_uri,
--                                               GnomeVFSURI *new_uri,
--                                               gboolean force_replace);

--    Move a file from uri old_uri to new_uri. This will only work if old_uri
--    and new_uri are on the same file system. Otherwise, it is necessary to use
--    the more general gnome_vfs_xfer_uri() function.

--    old_uri :       source uri.
--    new_uri :       destination uri.
--    force_replace : if TRUE, move old_uri to new_uri even if there is already
--                    a file at new_uri. If there is a file, it will be
--                    discarded.
--    Returns :       an integer representing the result of the operation.

--    --------------------------------------------------------------------------

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

 	gnome_vfs_uri_unref (a_uri: POINTER) is
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

 	gnome_vfs_uri_set_host_port (a_uri: POINTER; a_host_port: INTEGER) is
			-- void gnome_vfs_uri_set_host_port (GnomeVFSURI *uri, guint host_port);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_set_user_name (a_uri, a_user_name: POINTER) is
			-- void gnome_vfs_uri_set_user_name (GnomeVFSURI *uri, const gchar *user_name);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_set_password (a_uri, a_password: POINTER) is
			-- void gnome_vfs_uri_set_password (GnomeVFSURI *uri, const gchar *password);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_equal (an_a, a_b: POINTER): INTEGER is
			-- gboolean gnome_vfs_uri_equal (const GnomeVFSURI *a, const GnomeVFSURI *b);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

 	gnome_vfs_uri_is_parent (a_possible_parent, a_possible_child: POINTER; recursive: INTEGER): INTEGER is
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


 	gnome_vfs_uri_make_full_from_relative (a_base_uri, a_relative_uri: POINTER): POINTER is
			-- char* gnome_vfs_uri_make_full_from_relative (const char *base_uri, const char *relative_uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	--  GnomeVFSResult gnome_vfs_unlink_from_uri    (GnomeVFSURI *uri);
	--  GnomeVFSResult gnome_vfs_move_uri           (GnomeVFSURI *old_uri,
	--                                               GnomeVFSURI *new_uri,
	--                                               gboolean force_replace);


feature {} -- Unwrapped
	
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

end -- GNOME_VFS_URI
