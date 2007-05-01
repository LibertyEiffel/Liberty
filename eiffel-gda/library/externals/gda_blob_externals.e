indexing
	description: "External calls for GDA_BLOB"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_BLOB_EXTERNALS

inherit ANY undefine is_equal, copy end


insert GDA_BLOB_MODE_ENUM
feature {} -- External calls

	gda_blob_open (a_blob: POINTER; a_mode: INTEGER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	 gda_blob_read (a_blob, a_buffer: POINTER; a_size: INTEGER; gint_bytes_read: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_blob_write (a_blob, a_buffer: POINTER; a_size: INTEGER; gint_bytes_written: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_blob_lseek (a_blob: POINTER; an_offset, a_whencee: INTEGER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_blob_close (a_blob: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_blob_remove (a_blob: POINTER): INTEGER is
		external "C use <libgda/libgda.h>"
		end
	
	gda_blob_free_data (a_blob: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	-- TODO: implement GDA_BLOB_STRUCT - if necessary
	-- GdaBlob

	-- typedef struct {
	-- /* Private */
	-- gint (* open) (GdaBlob *blob, GdaBlobMode mode);

	-- gint (* read) (GdaBlob *blob, gpointer buf, gint size,
	-- gint *bytes_read);

	-- gint (* write) (GdaBlob *blob, gpointer buf, gint size,
	-- gint *bytes_written);

	-- gint (* lseek) (GdaBlob *blob, gint offset, gint whence);

	-- gint (* close) (GdaBlob *blob);

	-- gint (* remove) (GdaBlob *blob);

	-- gchar * (* stringify) (GdaBlob *blob);

	-- void (* free_data) (GdaBlob *blob);

	-- gpointer priv_data;
	-- /* */

	-- /* Public */
	-- gpointer user_data;
	-- } GdaBlob;
end
