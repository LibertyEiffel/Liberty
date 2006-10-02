indexing
	description: "gda-blob -- Management of BLOBs (Binary Large OBjects)."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GDA_BLOB

inherit SHARED_C_STRUCT

insert GDA_BLOB_EXTERNALS

creation make, from_external_pointer

feature {NONE} -- Creation


--   gda_blob_open ()

--  gint        gda_blob_open                   (GdaBlob *blob,
--                                               GdaBlobMode mode);

--    Opens an existing BLOB. The BLOB must be initialized by gda_connection_create_blob or
--    obtained from a GdaValue.

--    blob :    a GdaBlob structure obtained from a GdaValue or allocated by the user when
--              he/she wants to create a new GdaBlob.
--    mode :    see GdaBlobMode.
--    Returns : 0 if everything's ok. In case of error, -1 is returned and the provider should have
--              added an error to the connection.

--    ----------------------------------------------------------------------------------------------

--   gda_blob_read ()

--  gint        gda_blob_read                   (GdaBlob *blob,
--                                               gpointer buf,
--                                               gint size,
--                                               gint *bytes_read);

--    Reads a chunk of bytes from the BLOB into a user-provided location.

--    blob :       a GdaBlob which is opened with the flag GDA_BLOB_MODE_READ set.
--    buf :        buffer to read the data into.
--    size :       maximum number of bytes to read.
--    bytes_read : on return it will point to the number of bytes actually read.
--    Returns :    0 if everything's ok. In case of error, -1 is returned and the provider should
--                 have added an error to the connection.

--    ----------------------------------------------------------------------------------------------

--   gda_blob_write ()

--  gint        gda_blob_write                  (GdaBlob *blob,
--                                               gpointer buf,
--                                               gint size,
--                                               gint *bytes_written);

--    Writes a chunk of bytes from a user-provided location to the BLOB.

--    blob :          a GdaBlob which is opened with the flag GDA_BLOB_MODE_WRITE set.
--    buf :           buffer to write the data from.
--    size :          maximum number of bytes to read.
--    bytes_written : on return it will point to the number of bytes actually written.
--    Returns :       0 if everything's ok. In case of error, -1 is returned and the provider should
--                    have added an error to the connection.

--    ----------------------------------------------------------------------------------------------

--   gda_blob_lseek ()

--  gint        gda_blob_lseek                  (GdaBlob *blob,
--                                               gint offset,
--                                               gint whence);

--    Sets the blob read/write position.

--    blob :    a opened GdaBlob.
--    offset :  offset added to the position specified by whence.
--    whence :  SEEK_SET, SEEK_CUR or SEEK_END with the same meaning as in fseek(3).
--    Returns : the current position in the blob or < 0 in case of error. In case of error the
--              provider should have added an error to the connection.

--    ----------------------------------------------------------------------------------------------

--   gda_blob_close ()

--  gint        gda_blob_close                  (GdaBlob *blob);

--    Closes the BLOB. After calling this function, blob should no longer be used.

--    blob :    a opened GdaBlob.
--    Returns : 0 if everything's ok. In case of error, -1 is returned and the provider should have
--              added an error to the connection.

--    ----------------------------------------------------------------------------------------------

--   gda_blob_remove ()

--  gint        gda_blob_remove                 (GdaBlob *blob);

--    Removes the BLOB from the database. After calling this function, blob should no longer be
--    used.

--    blob :    a valid GdaBlob.
--    Returns : 0 if everything's ok. In case of error, -1 is returned and the provider should have
--              added an error to the connection.

--    ----------------------------------------------------------------------------------------------

--   gda_blob_free_data ()

--  void        gda_blob_free_data              (GdaBlob *blob);

--    Let the provider free any internal data stored in blob. The user is still responsible for
--    deallocating blob itself.

--    blob : a valid GdaBlob.
feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaBlob)"
		end

end -- class GDA_BLOB
