indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GnomeVFS Developers
					
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

deferred class GNOME_VFS_FILE
	-- Note: current implementation is just a sketch. 

inherit C_STRUCT
	-- TODO: make it inherit from FILE, TERMINAL_OUTPUT_STREAM, 
	-- TERMINAL_INPUT_STREAM or other classes of the standard library; 
	-- anther alternative is to make this class deferred and provide 
	-- effective heirs such as GNOME_VFS_TEXT_FILE and GNOME_VFS_BINARY_FILE.
	FILE

insert
	GNOME_VFS_RESULT
	GNOME_VFS_OPEN_MODE
	GNOME_VFS_SEEK_POSITION
	GNOME_VFS_FILE_SIZE

feature {} -- Creation
	make (a_text_uri: STRING; an_open_mode: INTEGER; exclusive:	BOOLEAN; some_perm: INTEGER) is 
			-- Create `a_text_uri' file according to `an_open_mode'. 
		
			-- `a_text_uri' is a string that represents the uri to
			-- create.
		
			-- `an_open_mode' is the mode to leave the file opened in
			-- after creation (or GNOME_VFS_OPEN_MODE_NONE to leave the
			-- file closed after creation).

			-- `exclusive' : whether the file should be created in
			-- "exclusive" mode. i.e.  if this flag is True, operation
			-- will fail if a file with the same name already exists.

			-- `some_perm' is a bitmap representing the permissions for
			-- the newly created file (Unix style).  

			-- `last_result' will be the result of the operation.
		do
			-- TODO: some_perm should be NATURAL since it's a guint
			last_result:=gnome_vfs_create($handle, a_text_uri.handle,
													an_open_mode, exclusive,
													some_perm);
			-- Note: When gnome_vfs_create returns, handle will then
			-- contain a pointer to a GnomeVFSHandle for the open
			-- file. This is the usual way GnomeVFS is implemented,
			-- creation functions expect a pointer to a pointer to a
			-- GnomeVFSHandle object. Passing `$handle' will let GnomeVFS
			-- change the object referred by handle.
			buffer := buffer.calloc(4096)
			capacity := 4096
		end

	make_uri, create_uri (an_uri: GNOME_VFS_URI; an_open_mode: INTEGER; exclusive: BOOLEAN; some_permissions: INTEGER) is
			-- Create `an_uri' according to `an_open_mode'.

			-- uri : uri for the file to create.
		
			-- `exclusive' tells whether the file should be created in
			-- "exclusive" mode. i.e.  if this flag is nonzero, operation
			-- will fail if a file with the same name already exists.
		
			-- `some_permissions' is bitmap representing the permissions
			-- for the newly created file (Unix style).
		
			-- `last_result' will be the result of the operation.
		
			-- TODO: `some_permissions' should be NATURAL since it is a
			-- guint
		do
			last_result:=gnome_vfs_create_uri($handle, an_uri.handle,
														 an_open_mode, exclusive.to_integer,
														 some_permissions)
			buffer := buffer.calloc(4096)
			capacity := 4096
		end

	open (a_text_uri: STRING; an_open_mode: INTEGER) is
			-- Open `a_text_uri' according to `an_open_mode'.
		
			-- `last_result' will be the result of the operation.
		require text_not_void: a_text_uri/=Void
		do
			last_result:=gnome_vfs_open($handle, a_text_uri.handle, an_open_mode)
			buffer := buffer.calloc(4096)
			capacity := 4096
		end

	open_uri (an_uri: GNOME_VFS_URI; an_open_mode: INTEGER) is
			-- Open `an_uri' according to `an_open_mode'.

			-- `last_result' will be the result of the operation.
		require uri_not_void: an_uri/=Void
		do
			last_result:=gnome_vfs_open_uri($handle, an_uri.handle, an_open_mode)
			buffer := buffer.calloc(4096)
			capacity := 4096
		end


feature -- Basic File Operations
	-- GnomeVFS file operations are, for the most part, patterned after
	-- their POSIX equivalents, with the systematic difference that
	-- they accept URIs rather than paths on the local filesystem. This
	-- makes them easy to learn as if you are already familiar with
	-- basic commands such as open(), seek(), write(), etc you will
	-- feel right at home with GnomeVFS after learning a -- little
	-- about URIs.

	-- GnomeVFS also provides asynchronous versions of these basic
	-- operations for allowing application developers to provide
	-- non-blocking file I/O without the use of threads.

	close is
			-- Close file associated with handle. `last_result' will be
			-- the result of the operation.
		do
			last_result:=gnome_vfs_close(handle);
		end

	on_same_filesystem (another: GNOME_VFS_URI): BOOLEAN is
			-- Are Current and `another' URI are on the same file system?
		
			-- `last_result' will be updated.
		local bool: INTEGER
		do
			last_result:=(gnome_vfs_check_same_fs_uris 
							  (handle, another.handle, $bool))
			Result:=bool.to_boolean
		end

	exists: BOOLEAN is
			-- Does Current URI point to an existing entity?
		do
			Result:=gnome_vfs_uri_exists(handle).to_boolean
		end

	create_symbolic_link (a_target_reference: STRING) is
			-- Creates a symbolic link, or eventually, an uri link (as
			-- necessary) pointing to `a_target_reference'.
		
			-- uri : uri to create a link at.  target_reference : uri
			-- "reference" to point the link to (uri or relative path).

			-- `last_result' will be the result of the operation.
		
			-- Note: the C documentation of this feature is not clear. 
			-- The 
		require reference_not_void: a_target_reference /= Void
		do
			last_result:=(gnome_vfs_create_symbolic_link
							  (handle, a_target_reference.to_external))
		end

feature -- Advanced File Operations 

	-- TODO: GnomeVFSResult gnome_vfs_file_control (GnomeVFSHandle
	-- *handle, const char *operation, gpointer operation_data);

	-- Execute a backend dependent operation specified by the string
	-- operation.  This is typically used for specialized vfs backends
	-- that need additional operations that gnome-vfs doesn't
	-- have. Compare it to the unix call ioctl(). The format of
	-- operation_data depends on the operation. Operation that are
	-- backend specific are normally namespaced by their module name.

	--    handle :         handle of the file to affect.
	--    operation :      operation to execute.
	--    operation_data : data needed to execute the operation.
	--    Returns :        an integer representing the success of the operation.

	forget_cache (an_offset: like gnome_vfs_file_offset; a_size: like gnome_vfs_file_size) is
			-- Announce to gnome-vfs that you will no longer use the
			-- region of data starting at `an_offset' with `a_size'. Any
			-- cached data for this region might then be freed.

			-- This might be useful if you stream large files, for
			-- example.

			-- `an_offset': start point of the region to be freed.

			-- `a_size': length of the region to be freed (or until the
			-- end of the file -- if 0 is specified).  

			-- `last_result' will be the result of the operation.
		do
			last_result := (gnome_vfs_forget_cache 
								 (handle, an_offset, a_size))
		end

feature  -- Reading and Writing
	set_buffer_size (a_size: like gnome_vfs_file_size) is
		do
			buffer.calloc(a_size)
		end

	bytes_count: INTEGER 
			-- The number of bytes read/written in the last operation 

	read is
		do
			last_result:= gnome_vfs_read(handle, buffer, buffer.count, $bytes_count)
		end

	--  GnomeVFSResult gnome_vfs_write (GnomeVFSHandle *handle,
	--  gconstpointer buffer, GnomeVFSFileSize bytes, GnomeVFSFileSize
	--  *bytes_written);

	--    Write bytes into the file opened through handle. As with Unix system
	--    calls, the number of bytes written can effectively be less than bytes on
	--    return and will be stored in bytes_written.
	
	--    handle :        handle of the file to write data to.
	--    buffer :        pointer to the buffer containing the data to be written.
	--    bytes :         number of bytes to write.
	--    bytes_written : pointer to a variable that will hold the number of bytes
	--                    effectively written on return.
	--    Returns :       an integer representing the result of the operation.
	
	seek (a_position: INTEGER; an_offset: like gnome_vfs_file_offset) is
			-- Set the current position for reading/writing through
			-- handle.
	
			-- `an_offset': number of bytes to skip from the position
			-- specified by whence.  (a positive value means to move
			-- forward; a negative one to move backwards).

			-- `last_result' will be the result of the operation.
		require is_valid_seek_position (a_position)
		do
			last_result:= gnome_vfs_seek (handle, a_position, an_offset)
		end	

	current_position: like gnome_vfs_file_offset is
			-- the current position on handle. This is the point in the
			-- file pointed to by handle that reads and writes will occur
			-- on.

			-- `last_result' will be the result of the operation.
		do
			last_result := gnome_vfs_tell(handle, $Result);
		end
	
feature {} -- Basic file operations external calls
	gnome_vfs_create (an_handle, a_text_uri: POINTER; an_open_mode, exclusive: INTEGER; some_perm: INTEGER): INTEGER is
			-- GnomeVFSResult gnome_vfs_create (GnomeVFSHandle **handle,
			-- const gchar *text_uri, GnomeVFSOpenMode open_mode,
			-- gboolean exclusive, guint perm);

			-- TODO: some_perm should be a NATURAL, since it is a guint
			-- TODO: require valid open mode
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_create_uri (an_handle, an_uri: POINTER; an_open_mode, exclusive: INTEGER; some_perm: INTEGER): INTEGER is
			-- GnomeVFSResult gnome_vfs_create_uri (GnomeVFSHandle
			-- **handle, GnomeVFSURI *uri, GnomeVFSOpenMode open_mode,
			-- gboolean exclusive, guint perm);
		
			-- TODO: some_perm should be a NATURAL, since it is a guint
			-- TODO: require valid open mode
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_open (an_handle, a_text_uri: POINTER; an_open_mode: INTEGER): INTEGER is
			-- GnomeVFSResult gnome_vfs_open (GnomeVFSHandle **handle,
			-- const gchar *text_uri, GnomeVFSOpenMode open_mode);

			-- TODO: require valid open mode
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_open_uri (a_handle, an_uri: POINTER; an_open_mode: INTEGER): INTEGER is
			-- GnomeVFSResult gnome_vfs_open_uri (GnomeVFSHandle
			-- **handle, GnomeVFSURI *uri, GnomeVFSOpenMode open_mode);

			-- TODO: require valid open mode
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_close (a_handle: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_close (GnomeVFSHandle *handle);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_check_same_fs_uris (a_source_uri, a_target_uri, a_same_fs_return: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_check_same_fs_uris (GnomeVFSURI
			-- *source_uri, GnomeVFSURI *target_uri, gboolean
			-- *same_fs_return);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_uri_exists (a_uri: POINTER): INTEGER is
			-- gboolean gnome_vfs_uri_exists (GnomeVFSURI *uri);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

	gnome_vfs_create_symbolic_link (a_uri, a_target_reference: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_create_symbolic_link (GnomeVFSURI
			-- *uri, const gchar *target_reference);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

feature {} -- External calls for reading and writing
	gnome_vfs_read (an_handle, a_buffer: POINTER; a_bytes_count: like gnome_vfs_file_size; a_bytes_read: POINTER): INTEGER is
			--  GnomeVFSResult gnome_vfs_read (GnomeVFSHandle *handle,
			--  gpointer buffer, GnomeVFSFileSize bytes, GnomeVFSFileSize
			--  *bytes_read);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_write (a_handle, a_buffer: POINTER; a_bytes_count: like gnome_vfs_file_size; bytes_written: POINTER): INTEGER is
			-- GnomeVFSResult gnome_vfs_write (GnomeVFSHandle *handle,
			-- gconstpointer buffer, GnomeVFSFileSize bytes,
			-- GnomeVFSFileSize *bytes_written);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	 gnome_vfs_seek (a_handle: POINTER; a_seek_position: INTEGER; an_offset: like gnome_vfs_file_offset): INTEGER is
			--  GnomeVFSResult gnome_vfs_seek (GnomeVFSHandle *handle,
			--  GnomeVFSSeekPosition whence, GnomeVFSFileOffset offset);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
	
	gnome_vfs_tell (an_handle, an_offset_return: POINTER): INTEGER is
			--  GnomeVFSResult gnome_vfs_tell (GnomeVFSHandle *handle, GnomeVFSFileSize *offset_return);
		external "C use <libgnomevfs/gnome-vfs.h>"
		end

feature {} -- External calls for advanced file operations
	gnome_vfs_file_control (a_handle, an_operation, some_operation_data: POINTER): INTEGER is
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
 
	gnome_vfs_forget_cache (an_handle: POINTER; an_offset: like gnome_vfs_file_offset; a_size: gnome_vfs_file_size): INTEGER is
		external "C use <libgnomevfs/gnome-vfs.h>"
		end
end -- class GNOME_VFS_FILE
