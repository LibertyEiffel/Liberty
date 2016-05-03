note
	copyright: "(C) 2005 Paolo Redaelli, 2007 Soluciones Informaticas Libres S.A. (Except)"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_IO_CHANNEL
	-- IO Channels -- portable support for using files, pipes and sockets.

inherit
	C_STRUCT 
	REFERENCE_COUNTED redefine dispose end

insert
	G_IO_CONDITIONS

create {ANY}
	from_unix_fd, from_win32_fd, from_win32_socket

feature {} -- Creation

	from_unix_fd (fd: INTEGER) is
			-- Creates from file descriptor `fd'. On UNIX systems this 
			-- works for plain files, pipes, and sockets.
		do
			handle := g_io_channel_unix_new (fd)
		ensure
			encoding.is_equal (once "UTF-8")
		end

	from_win32_fd (fd: INTEGER) is
			-- Creates from file descriptor `fd' on Windows. This works for
			-- file descriptors as returned by the open(), creat(), pipe()
			-- and fileno() calls in the Microsoft C runtime. In order to
			-- meaningfully use this routine your code should use the same
			-- C runtime as GLib uses, which is msvcrt.dll.
			-- This function is available only in GLib on Windows. 
		do
			handle := g_io_channel_win32_new_fd (fd)
		end

	from_win32_socket (socket: INTEGER) is
			-- Creates from socket handle `socket'
		do
			handle := g_io_channel_win32_new_socket (socket)
		end

--             GIOChannel;

-- gint        g_io_channel_unix_get_fd        (GIOChannel *channel);

-- void        g_io_channel_init               (GIOChannel *channel);

-- GIOChannel* g_io_channel_new_file           (const gchar *filename,
--                                              const gchar *mode,
--                                              GError **error);
-- GIOStatus   g_io_channel_read_chars         (GIOChannel *channel,
--                                              gchar *buf,
--                                              gsize count,
--                                              gsize *bytes_read,
--                                              GError **error);
-- GIOStatus   g_io_channel_read_unichar       (GIOChannel *channel,
--                                              gunichar *thechar,
--                                              GError **error);
-- GIOStatus   g_io_channel_read_line          (GIOChannel *channel,
--                                              gchar **str_return,
--                                              gsize *length,
--                                              gsize *terminator_pos,
--                                              GError **error);
-- GIOStatus   g_io_channel_read_line_string   (GIOChannel *channel,
--                                              GString *buffer,
--                                              gsize *terminator_pos,
--                                              GError **error);
-- GIOStatus   g_io_channel_read_to_end        (GIOChannel *channel,
--                                              gchar **str_return,
--                                              gsize *length,
--                                              GError **error);
-- GIOStatus   g_io_channel_write_chars        (GIOChannel *channel,
--                                              const gchar *buf,
--                                              gssize count,
--                                              gsize *bytes_written,
--                                              GError **error);
-- GIOStatus   g_io_channel_write_unichar      (GIOChannel *channel,
--                                              gunichar thechar,
--                                              GError **error);
-- GIOStatus   g_io_channel_flush              (GIOChannel *channel,
--                                              GError **error);
-- GIOStatus   g_io_channel_seek_position      (GIOChannel *channel,
--                                              gint64 offset,
--                                              GSeekType type,
--                                              GError **error);
-- enum        GSeekType;
-- GIOStatus   g_io_channel_shutdown           (GIOChannel *channel,
--                                              gboolean flush,
--                                              GError **err);

-- enum        GIOStatus;
-- enum        GIOChannelError;
-- #define     G_IO_CHANNEL_ERROR
-- GIOChannelError g_io_channel_error_from_errno
--                                             (gint en);


-- GSource*    g_io_create_watch               (GIOChannel *channel,
--                                              GIOCondition condition);

feature {ANY}  -- Memory handling
	ref is
			-- Increments the reference count of a GIOChannel.
		local p: POINTER
		do
			p:=g_io_channel_ref(handle)
			check p=handle end
		end
	
	unref is
		do
			g_io_channel_unref (handle)
		end

	dispose is
		do
			Precursor
			watch_list := Void
		end

feature {ANY} -- Access

	encoding: STRING is
			-- Encoding for the input/output of the channel. The internal
			-- encoding is always UTF-8. The encoding Void makes the
			-- channel safe for binary data.
		local
			enc: POINTER
		do
			enc := g_io_channel_get_encoding (handle)
			if enc.is_not_null then
				create Result.from_external_copy (enc)
			end
		end

	is_writable: BOOLEAN is
		do
			Result := (g_io_channel_get_flags(handle) & g_io_flag_is_writable) /= 0
		end

	is_blocking: BOOLEAN is
		do
			Result := (g_io_channel_get_flags(handle) & g_io_flag_nonblock) = 0
		end

	is_buffered: BOOLEAN is
			-- Is the current channel buffered?
		do
			Result := g_io_channel_get_buffered (handle) /= 0
		end

	last_event_source: INTEGER
		-- glib id of last g_io_add_watch

	last_status: INTEGER
		-- Status code of last operation

	last_failed: BOOLEAN is
			-- Error status of last operation
		do
			Result := last_status /= g_io_status_normal
		end

	last_written: INTEGER
		-- Number of bytes read/written by last operation

feature {ANY} -- Operations

	add_watch (condition: INTEGER; action: FUNCTION [TUPLE [G_IO_CHANNEL, INTEGER], BOOLEAN]) is
			-- Adds into the main event loop with the default priority.
		require
			is_valid_g_io_condition (condition)
			action /= Void
		local
			callback: G_IO_FUNC
		do
			create callback.make (Current, action)
			if watch_list = Void then
				create watch_list.make (0)
			end
			watch_list.add_last (callback)
			last_event_source := g_io_add_watch (handle, condition, callback.function, callback.data)
		end

	set_blocking (block: BOOLEAN) is
		do
			if block then
				last_status := g_io_channel_set_flags(handle,
									g_io_channel_get_flags(handle) &
									~g_io_flag_nonblock,
									default_pointer)
			else
				last_status := g_io_channel_set_flags(handle,
									g_io_channel_get_flags(handle) |
									g_io_flag_nonblock,
									default_pointer)
			end
		end

	set_buffered (buffered: BOOLEAN) is
			-- Enable/disable channel buffering.
			-- Default state is buffered
		require
			no_encoding_set: encoding = Void
				-- The buffering state can only be set if the channel's
				-- encoding is Void. For any other encoding, the channel
				-- must be buffered.
			no_buffered_data: -- No way to query this from GIOChannel
				-- A buffered channel can only be set unbuffered if the
				-- channel's internal buffers have been flushed. Newly
				-- created channels or channels which have returned
				-- G_IO_STATUS_EOF not require such a flush.
				-- For write-only channels, a call to g_io_channel_flush()
				-- is sufficient. For all other channels,
				-- the buffers may be flushed by a call to
				-- g_io_channel_seek_position(). This includes the possibility
				-- of seeking with seek type G_SEEK_CUR and an offset
				-- of zero. Note that this means that socket-based channels
				-- cannot be set unbuffered once they have had data
				-- read from them.
				-- On unbuffered channels, it is safe to mix read and
				-- write calls from the new and old APIs, if this is
				-- necessary for maintaining old code.
		do
			g_io_channel_set_buffered (handle, buffered.to_integer)
		ensure
			is_buffered = buffered
		end

-- guint       g_io_add_watch_full             (GIOChannel *channel,
--                                              gint priority,
--                                              GIOCondition condition,
--                                              GIOFunc func,
--                                              gpointer user_data,
--                                              GDestroyNotify notify);
-- enum        GIOCondition;
-- gboolean    (*GIOFunc)                      (GIOChannel *source,
--                                              GIOCondition condition,
--                                              gpointer data);

--             GIOFuncs;

-- gsize       g_io_channel_get_buffer_size    (GIOChannel *channel);
-- void        g_io_channel_set_buffer_size    (GIOChannel *channel,
--                                              gsize size);
-- GIOCondition g_io_channel_get_buffer_condition
--                                             (GIOChannel *channel);
-- GIOFlags    g_io_channel_get_flags          (GIOChannel *channel);
-- GIOStatus   g_io_channel_set_flags          (GIOChannel *channel,
--                                              GIOFlags flags,
--                                              GError **error);
-- enum        GIOFlags;
-- const gchar* g_io_channel_get_line_term     (GIOChannel *channel,
--                                              gint *length);
-- void        g_io_channel_set_line_term      (GIOChannel *channel,
--                                              const gchar *line_term,
--                                              gint length);

-- gboolean    g_io_channel_get_close_on_unref (GIOChannel *channel);
-- void        g_io_channel_set_close_on_unref (GIOChannel *channel,
--                                              gboolean do_close);


-- GIOError    g_io_channel_read               (GIOChannel *channel,
--                                              gchar *buf,
--                                              gsize count,
--                                              gsize *bytes_read);
-- enum        GIOError;

-- GIOError    g_io_channel_write              (GIOChannel *channel,
--                                              const gchar *buf,
--                                              gsize count,
--                                              gsize *bytes_written);
-- GIOError    g_io_channel_seek               (GIOChannel *channel,
--                                              gint64 offset,
--                                              GSeekType type);
-- void        g_io_channel_close              (GIOChannel *channel);


-- Description

-- The GIOChannel data type aims to provide a portable method for using file descriptors, pipes, and sockets, and integrating them into the main event loop. Currently full support is available on UNIX platforms, support for Windows is only partially complete.

-- To create a new GIOChannel on UNIX systems use g_io_channel_unix_new(). This works for plain file descriptors, pipes and sockets. Alternatively, a channel can be created for a file in a system independent manner using g_io_channel_new_file().

-- Once a GIOChannel has been created, it can be used in a generic manner with the functions g_io_channel_read_chars(), g_io_channel_write_chars(), g_io_channel_seek_position(), and g_io_channel_shutdown().

-- To add a GIOChannel to the main event loop use g_io_add_watch() or g_io_add_watch_full(). Here you specify which events you are interested in on the GIOChannel, and provide a function to be called whenever these events occur.

-- GIOChannel instances are created with an initial reference count of 1. g_io_channel_ref() and g_io_channel_unref() can be used to increment or decrement the reference count respectively. When the reference count falls to 0, the GIOChannel is freed. (Though it isn't closed automatically, unless it was created using g_io_channel_new_from_file().) Using g_io_add_watch() or g_io_add_watch_full() increments a channel's reference count.

-- The new functions g_io_channel_read_chars(), g_io_channel_read_line(), g_io_channel_read_line_string(), g_io_channel_read_to_end(), g_io_channel_write_chars(), g_io_channel_seek_position(), and g_io_channel_flush() should not be mixed with the deprecated functions g_io_channel_read(), g_io_channel_write(), and g_io_channel_seek() on the same channel.
-- Details
-- GIOChannel

-- typedef struct {
-- } GIOChannel;

-- A data structure representing an IO Channel. The fields should be considered private and should only be accessed with the following functions.
-- g_io_channel_unix_new ()

-- gint        g_io_channel_unix_get_fd        (GIOChannel *channel);

-- Returns the file descriptor of the UNIX GIOChannel.
-- channel : 	a GIOChannel, created with g_io_channel_unix_new().
-- Returns : 	the file descriptor of the GIOChannel.
-- g_io_channel_init ()

-- void        g_io_channel_init               (GIOChannel *channel);

-- Initializes a GIOChannel struct. This is called by each of the above functions when creating a GIOChannel, and so is not often needed by the application programmer (unless you are creating a new type of GIOChannel).
-- channel : 	a GIOChannel.
-- g_io_channel_new_file ()

-- GIOChannel* g_io_channel_new_file           (const gchar *filename,
--                                              const gchar *mode,
--                                              GError **error);

-- Open a file filename as a GIOChannel using mode mode. This channel will be closed when the last reference to it is dropped, so there is no need to call g_io_channel_close() (though doing so will not cause problems, as long as no attempt is made to access the channel after it is closed).

-- filename : 	A string containing the name of a file.
-- mode : 	One of "r", "w", "a", "r+", "w+", "a+". These have the same meaning as in fopen().
-- error : 	A location to return an error of type G_FILE_ERROR.
-- Returns : 	A GIOChannel on success, NULL on failure.
-- g_io_channel_read_chars ()

-- GIOStatus   g_io_channel_read_chars         (GIOChannel *channel,
--                                              gchar *buf,
--                                              gsize count,
--                                              gsize *bytes_read,
--                                              GError **error);

-- Replacement for g_io_channel_read() with the new API.

-- channel : 	a GIOChannel
-- buf : 	a buffer to read data into
-- count : 	the size of the buffer. Note that the buffer may not be complelely filled even if there is data in the buffer if the remaining data is not a complete character.
-- bytes_read : 	The number of bytes read. This may be zero even on success if count < 6 and the channel's encoding is non-NULL. This indicates that the next UTF-8 character is too wide for the buffer.
-- error : 	A location to return an error of type GConvertError or GIOChannelError.
-- Returns : 	the status of the operation.
-- g_io_channel_read_unichar ()

-- GIOStatus   g_io_channel_read_unichar       (GIOChannel *channel,
--                                              gunichar *thechar,
--                                              GError **error);

-- This function cannot be called on a channel with NULL encoding.

-- channel : 	a GIOChannel
-- thechar : 	a location to return a character
-- error : 	A location to return an error of type GConvertError or GIOChannelError
-- Returns : 	a GIOStatus
-- g_io_channel_read_line ()

-- GIOStatus   g_io_channel_read_line          (GIOChannel *channel,
--                                              gchar **str_return,
--                                              gsize *length,
--                                              gsize *terminator_pos,
--                                              GError **error);

-- Reads a line, including the terminating character(s), from a GIOChannel into a newly-allocated string. str_return will contain allocated memory if the return is G_IO_STATUS_NORMAL.

-- channel : 	a GIOChannel
-- str_return : 	The line read from the GIOChannel, including the line terminator. This data should be freed with g_free() when no longer needed. This is a nul-terminated string. If a length of zero is returned, this will be NULL instead.
-- length : 	location to store length of the read data, or NULL
-- terminator_pos : 	location to store position of line terminator, or NULL
-- error : 	A location to return an error of type GConvertError or GIOChannelError
-- Returns : 	the status of the operation.
-- g_io_channel_read_line_string ()

-- GIOStatus   g_io_channel_read_line_string   (GIOChannel *channel,
--                                              GString *buffer,
--                                              gsize *terminator_pos,
--                                              GError **error);

-- Reads a line from a GIOChannel, using a GString as a buffer.

-- channel : 	a GIOChannel
-- buffer : 	a GString into which the line will be written. If buffer already contains data, the old data will be overwritten.
-- terminator_pos : 	location to store position of line terminator, or NULL
-- error : 	a location to store an error of type GConvertError or GIOChannelError
-- Returns : 	the status of the operation.
-- g_io_channel_read_to_end ()

-- GIOStatus   g_io_channel_read_to_end        (GIOChannel *channel,
--                                              gchar **str_return,
--                                              gsize *length,
--                                              GError **error);

-- Reads all the remaining data from the file.

-- channel : 	a GIOChannel
-- str_return : 	Location to store a pointer to a string holding the remaining data in the GIOChannel. This data should be freed with g_free() when no longer needed. This data is terminated by an extra nul character, but there may be other nuls in the intervening data.
-- length : 	Location to store length of the data
-- error : 	A location to return an error of type GConvertError or GIOChannelError
-- Returns : 	G_IO_STATUS_NORMAL on success. This function never returns G_IO_STATUS_EOF.
-- g_io_channel_write_chars ()


	write_chars (chars: STRING) is
			-- Replacement for g_io_channel_write() with the new API.
			-- On seekable channels with encodings other than NULL or
			-- UTF-8, generic mixing of reading and writing is not
			-- allowed. A call to g_io_channel_write_chars() may only
			-- be made on a channel from which data has been read in
			-- the cases described in the documentation for
			-- g_io_channel_set_encoding().
		do
				debug
					print (once "Flags ") print(g_io_channel_get_flags (handle).to_string) print("%N")
					if chars.count <= 512 then print (chars) print(once "%N")
					else print (once "Writing ") print(chars.count.to_string) print(once "...%N")
					end
				end
			last_status := g_io_channel_write_chars (handle, chars.to_external,
																  chars.count, $last_written, default_pointer)
				debug print (once "failed=") print(last_failed.to_string) print(once "%N") end
		end

-- GIOStatus   g_io_channel_write_chars        (GIOChannel *channel,
--                                              const gchar *buf,
--                                              gssize count,
--                                              gsize *bytes_written,
--                                              GError **error);

-- Replacement for g_io_channel_write() with the new API.

-- On seekable channels with encodings other than NULL or UTF-8, generic mixing of reading and writing is not allowed. A call to g_io_channel_write_chars() may only be made on a channel from which data has been read in the cases described in the documentation for g_io_channel_set_encoding().

-- channel : 	a GIOChannel
-- buf : 	a buffer to write data from
-- count : 	the size of the buffer. If -1, the buffer is taken to be a nul-terminated string.
-- bytes_written : 	The number of bytes written. This can be nonzero even if the return value is not G_IO_STATUS_NORMAL. If the return value is G_IO_STATUS_NORMAL and the channel is blocking, this will always be equal to count if count >= 0.
-- error : 	A location to return an error of type GConvertError or GIOChannelError
-- Returns : 	the status of the operation.
-- g_io_channel_write_unichar ()

-- GIOStatus   g_io_channel_write_unichar      (GIOChannel *channel,
--                                              gunichar thechar,
--                                              GError **error);

-- This function cannot be called on a channel with NULL encoding.

-- channel : 	a GIOChannel
-- thechar : 	a character
-- error : 	A location to return an error of type GConvertError or GIOChannelError
-- Returns : 	a GIOStatus

	flush is
			-- Flushes the write buffer for the GIOChannel.
		do
			last_status := g_io_channel_flush (handle, default_pointer) --TODO: error handling
		end

-- g_io_channel_seek_position ()

-- GIOStatus   g_io_channel_seek_position      (GIOChannel *channel,
--                                              gint64 offset,
--                                              GSeekType type,
--                                              GError **error);

-- Replacement for g_io_channel_seek() with the new API.

-- channel : 	a GIOChannel
-- offset : 	The offset in bytes from the position specified by type
-- type : 	a GSeekType. The type G_SEEK_CUR is only allowed in those cases where a call to g_io_channel_set_encoding() is allowed. See the documentation for g_io_channel_set_encoding() for details.
-- error : 	A location to return an error of type GIOChannelError
-- Returns : 	the status of the operation.
-- enum GSeekType

-- typedef enum
-- {
--   G_SEEK_CUR,
--   G_SEEK_SET,
--   G_SEEK_END
-- } GSeekType;

-- An enumeration specifying the base position for a g_io_channel_seek_position() operation.
-- G_SEEK_CUR 	the current position in the file.
-- G_SEEK_SET 	the start of the file.
-- G_SEEK_END 	the end of the file.

	shutdown (after_flush: BOOLEAN) is
		-- Close an IO channel. Any pending data to be written will be
		-- flushed if flush is TRUE. The channel will not be freed until the
		-- last reference is dropped using g_io_channel_unref().
		do
			last_status := g_io_channel_shutdown(handle, after_flush, default_pointer)
		end

	set_encoding (new_encoding: STRING) is
			-- Sets the encoding for the input/output of the channel.
			-- The internal encoding is always "UTF-8". The default encoding
			-- for the external file is "UTF-8". encoding=Void sets binary
			-- encoding.
		require
			-- The encoding can only be set if one of the following conditions
			-- is true:
			-- 1. The channel was just created, and has not been written to
			--    or read from yet.
			-- 2. The channel is write-only.
			-- 3. The channel is a file, and the file pointer was just
			--    repositioned by a call to g_io_channel_seek_position().
			--    (This flushes all the internal buffers.)
			-- 4. The current `encoding' is Void or "UTF-8".
			-- 5. One of the (new API) read functions has just returned
			--    G_IO_STATUS_EOF (or, in the case of
			--    g_io_channel_read_to_end(), G_IO_STATUS_NORMAL).
			-- 6. One of the functions g_io_channel_read_chars() or
			--    g_io_channel_read_unichar() has returned G_IO_STATUS_AGAIN
			--    or G_IO_STATUS_ERROR. This may be useful in the case of
			--    G_CONVERT_ERROR_ILLEGAL_SEQUENCE. Returning one of these
			--    statuses from g_io_channel_read_line(),
			--    g_io_channel_read_line_string(), or
			--    g_io_channel_read_to_end() does not guarantee that the
			--    encoding can be changed.
			--
			-- Channels which do not meet one of the above conditions
			-- cannot call g_io_channel_seek_position() with an offset
			-- of G_SEEK_CUR, and, if they are "seekable", cannot call
			-- g_io_channel_write_chars() after calling one of the API
			-- "read" functions.
		local
			p_encoding: POINTER
		do
			if new_encoding /= Void then
				p_encoding := new_encoding.to_external
			end
			last_status := g_io_channel_set_encoding (handle, p_encoding, default_pointer)
			-- TODO: GError Handling
		end

feature {} -- Internal constants

	g_io_status_normal: INTEGER is
		external "C macro use <glib.h>" alias "G_IO_STATUS_NORMAL"
		end

-- typedef enum
-- {
--   G_IO_STATUS_ERROR,
--   G_IO_STATUS_NORMAL,
--   G_IO_STATUS_EOF,
--   G_IO_STATUS_AGAIN
-- } GIOStatus;

-- Stati returned by most of the GIOFuncs functions.
-- G_IO_STATUS_ERROR 	An error occurred.
-- G_IO_STATUS_NORMAL 	Success.
-- G_IO_STATUS_EOF 	End of file.
-- G_IO_STATUS_AGAIN 	Resource temporarily unavailable.
-- enum GIOChannelError

-- typedef enum
-- {
--   /* Derived from errno */
--   G_IO_CHANNEL_ERROR_FBIG,
--   G_IO_CHANNEL_ERROR_INVAL,
--   G_IO_CHANNEL_ERROR_IO,
--   G_IO_CHANNEL_ERROR_ISDIR,
--   G_IO_CHANNEL_ERROR_NOSPC,
--   G_IO_CHANNEL_ERROR_NXIO,
--   G_IO_CHANNEL_ERROR_OVERFLOW,
--   G_IO_CHANNEL_ERROR_PIPE,
--   /* Other */
--   G_IO_CHANNEL_ERROR_FAILED
-- } GIOChannelError;

-- Error codes returned by GIOChannel operations.
-- G_IO_CHANNEL_ERROR_FBIG 	File too large.
-- G_IO_CHANNEL_ERROR_INVAL 	Invalid argument.
-- G_IO_CHANNEL_ERROR_IO 	IO error.
-- G_IO_CHANNEL_ERROR_ISDIR 	File is a directory.
-- G_IO_CHANNEL_ERROR_NOSPC 	No space left on device.
-- G_IO_CHANNEL_ERROR_NXIO 	No such device or address.
-- G_IO_CHANNEL_ERROR_OVERFLOW 	Value too large for defined datatype.
-- G_IO_CHANNEL_ERROR_PIPE 	Broken pipe.
-- G_IO_CHANNEL_ERROR_FAILED 	Some other error.
-- G_IO_CHANNEL_ERROR

-- #define G_IO_CHANNEL_ERROR g_io_channel_error_quark()

-- Error domain for GIOChannel operations. Errors in this domain will be from the GIOChannelError enumeration. See GError for information on error domains.
-- g_io_channel_error_from_errno ()

-- GIOChannelError g_io_channel_error_from_errno
--                                             (gint en);

-- Converts an errno error number to a GIOChannelError.

-- en : 	an errno error number, e.g. EINVAL.
-- Returns : 	a GIOChannelError error number, e.g. G_IO_CHANNEL_ERROR_INVAL.

-- g_io_create_watch ()

-- GSource*    g_io_create_watch               (GIOChannel *channel,
--                                              GIOCondition condition);

-- Creates a GSource that's dispatched when condition is met for the given channel. For example, if condition is G_IO_IN, the source will be dispatched when there's data available for reading. g_io_add_watch() is a simpler interface to this same functionality, for the case where you want to add the source to the default main loop at the default priority.
-- channel : 	a GIOChannel to watch
-- condition : 	conditions to watch for
-- Returns : 	a new GSource
-- g_io_add_watch_full ()

-- guint       g_io_add_watch_full             (GIOChannel *channel,
--                                              gint priority,
--                                              GIOCondition condition,
--                                              GIOFunc func,
--                                              gpointer user_data,
--                                              GDestroyNotify notify);

-- Adds the GIOChannel into the main event loop with the given priority.
-- channel : 	a GIOChannel.
-- priority : 	the priority of the GIOChannel source.
-- condition : 	the condition to watch for.
-- func : 	the function to call when the condition is satisfied.
-- user_data : 	user data to pass to func.
-- notify : 	the function to call when the source is removed.
-- Returns : 	the event source id.
-- enum GIOCondition

-- typedef enum
-- {
--   G_IO_IN	GLIB_SYSDEF_POLLIN,
--   G_IO_OUT	GLIB_SYSDEF_POLLOUT,
--   G_IO_PRI	GLIB_SYSDEF_POLLPRI,
--   G_IO_ERR	GLIB_SYSDEF_POLLERR,
--   G_IO_HUP	GLIB_SYSDEF_POLLHUP,
--   G_IO_NVAL	GLIB_SYSDEF_POLLNVAL
-- } GIOCondition;

-- A bitwise combination representing a condition to watch for on an event source.
-- G_IO_IN 	There is data to read.
-- G_IO_OUT 	Data can be written (without blocking).
-- G_IO_PRI 	There is urgent data to read.
-- G_IO_ERR 	Error condition.
-- G_IO_HUP 	Hung up (the connection has been broken, usually for pipes and sockets).
-- G_IO_NVAL 	Invalid request. The file descriptor is not open.
-- GIOFunc ()

-- gboolean    (*GIOFunc)                      (GIOChannel *source,
--                                              GIOCondition condition,
--                                              gpointer data);

-- Specifies the type of function passed to g_io_add_watch() or g_io_add_watch_full(), which is called when the requested condition on a GIOChannel is satisfied.
-- source : 	the GIOChannel event source.
-- condition : 	the condition which has been satisfied.
-- data : 	user data set in g_io_add_watch() or g_io_add_watch_full().
-- Returns : 	the function should return FALSE if the event source should be removed.
-- GIOFuncs

-- typedef struct {
--   GIOStatus (*io_read)           (GIOChannel   *channel, 
-- 			          gchar        *buf, 
-- 				  gsize         count,
-- 				  gsize        *bytes_read,
-- 				  GError      **err);
--   GIOStatus (*io_write)          (GIOChannel   *channel, 
-- 				  const gchar  *buf, 
-- 				  gsize         count,
-- 				  gsize        *bytes_written,
-- 				  GError      **err);
--   GIOStatus (*io_seek)           (GIOChannel   *channel, 
-- 				  gint64        offset, 
-- 				  GSeekType     type,
-- 				  GError      **err);
--   GIOStatus  (*io_close)         (GIOChannel   *channel,
-- 				  GError      **err);
--   GSource*   (*io_create_watch)  (GIOChannel   *channel,
-- 				  GIOCondition  condition);
--   void       (*io_free)          (GIOChannel   *channel);
--   GIOStatus  (*io_set_flags)     (GIOChannel   *channel,
--                                   GIOFlags      flags,
-- 				  GError      **err);
--   GIOFlags   (*io_get_flags)     (GIOChannel   *channel);
-- } GIOFuncs;

-- A table of functions used to handle different types of GIOChannel in a generic way.
-- g_io_channel_get_buffer_size ()

-- gsize       g_io_channel_get_buffer_size    (GIOChannel *channel);

-- Gets the buffer size.

-- channel : 	a GIOChannel
-- Returns : 	the size of the buffer.
-- g_io_channel_set_buffer_size ()

-- void        g_io_channel_set_buffer_size    (GIOChannel *channel,
--                                              gsize size);

-- Sets the buffer size.

-- channel : 	a GIOChannel
-- size : 	the size of the buffer. 0 == pick a good size
-- g_io_channel_get_buffer_condition ()

-- GIOCondition g_io_channel_get_buffer_condition
--                                             (GIOChannel *channel);

-- This function returns a GIOCondition depending on whether there is data to be read/space to write data in the internal buffers in the GIOChannel. Only the flags G_IO_IN and G_IO_OUT may be set.

-- channel : 	A GIOChannel
-- Returns : 	A GIOCondition
-- g_io_channel_get_flags ()

-- GIOFlags    g_io_channel_get_flags          (GIOChannel *channel);

-- Gets the current flags for a GIOChannel, including read-only flags such as G_IO_FLAG_IS_READABLE.

-- The values of the flags G_IO_FLAG_IS_READABLE and G_IO_FLAG_IS_WRITEABLE are cached for internal use by the channel when it is created. If they should change at some later point (e.g. partial shutdown of a socket with the UNIX shutdown() function), the user should immediately call g_io_channel_get_flags() to update the internal values of these flags.

-- channel : 	a GIOChannel
-- Returns : 	the flags which are set on the channel
-- g_io_channel_set_flags ()

-- GIOStatus   g_io_channel_set_flags          (GIOChannel *channel,
--                                              GIOFlags flags,
--                                              GError **error);

-- Sets the (writeable) flags in channel to (flags & G_IO_CHANNEL_SET_MASK).

-- channel : 	a GIOChannel.
-- flags : 	the flags to set on the IO channel.
-- error : 	A location to return an error of type GIOChannelError.
-- Returns : 	the status of the operation.
-- enum GIOFlags

	g_io_flag_is_writable: INTEGER is
		external "C macro use <glib.h>" alias "G_IO_FLAG_IS_WRITEABLE"
		end

	g_io_flag_nonblock: INTEGER is
		external "C macro use <glib.h>" alias "G_IO_FLAG_NONBLOCK"
		end

-- typedef enum
-- {
--   G_IO_FLAG_APPEND = 1 < < 0,
--   G_IO_FLAG_NONBLOCK = 1 < < 1,
--   G_IO_FLAG_IS_READABLE = 1 < < 2,	/* Read only flag */
--   G_IO_FLAG_IS_WRITEABLE = 1 < < 3,	/* Read only flag */
--   G_IO_FLAG_IS_SEEKABLE = 1 < < 4,	/* Read only flag */
--   G_IO_FLAG_MASK = (1 < < 5) - 1,
--   G_IO_FLAG_GET_MASK = G_IO_FLAG_MASK,
--   G_IO_FLAG_SET_MASK = G_IO_FLAG_APPEND | G_IO_FLAG_NONBLOCK
-- } GIOFlags;

-- Specifies properties of a GIOChannel. Some of the flags can only be read with g_io_channel_get_flags(), but not changed with g_io_channel_set_flags().
-- G_IO_FLAG_APPEND 	turns on append mode, corresponds to O_APPEND (see the documentation of the UNIX open() syscall).
-- G_IO_FLAG_NONBLOCK 	turns on nonblocking mode, corresponds to O_NONBLOCK/O_NDELAY (see the documentation of the UNIX open() syscall).
-- G_IO_FLAG_IS_READABLE 	indicates that the io channel is readable. This flag can not be changed.
-- G_IO_FLAG_IS_WRITEABLE 	indicates that the io channel is writable. This flag can not be changed.
-- G_IO_FLAG_IS_SEEKABLE 	indicates that the io channel is seekable, i.e. that g_io_channel_seek_position() can be used on it. This flag can not be changed.
-- G_IO_FLAG_MASK 	
-- G_IO_FLAG_GET_MASK 	
-- G_IO_FLAG_SET_MASK 	
-- g_io_channel_get_line_term ()

-- const gchar* g_io_channel_get_line_term     (GIOChannel *channel,
--                                              gint *length);

-- This returns the string that GIOChannel uses to determine where in the file a line break occurs. A value of NULL indicates auto detection.

-- channel : 	a GIOChannel
-- length : 	a location to return the length of the line terminator
-- Returns : 	The line termination string. This value is owned by GLib and must not be freed.
-- g_io_channel_set_line_term ()

-- void        g_io_channel_set_line_term      (GIOChannel *channel,
--                                              const gchar *line_term,
--                                              gint length);

-- This sets the string that GIOChannel uses to determine where in the file a line break occurs.

-- channel : 	a GIOChannel
-- line_term : 	The line termination string. Use NULL for auto detect. Auto detection breaks on "\n", "\r\n", "\r", "\0", and the Unicode paragraph separator. Auto detection should not be used for anything other than file-based channels.
-- length : 	The length of the termination string. If -1 is passed, the string is assumed to be nul-terminated. This option allows termination strings with embeded nuls.

-- g_io_channel_get_close_on_unref ()

-- gboolean    g_io_channel_get_close_on_unref (GIOChannel *channel);

-- Returns whether the file/socket/whatever associated with channel will be closed when channel receives its final unref and is destroyed. The default value of this is TRUE for channels created by g_io_channel_new_file(), and FALSE for all other channels.

-- channel : 	a GIOChannel.
-- Returns : 	Whether the channel will be closed on the final unref of the GIOChannel data structure.
-- g_io_channel_set_close_on_unref ()

-- void        g_io_channel_set_close_on_unref (GIOChannel *channel,
--                                              gboolean do_close);

-- Setting this flag to TRUE for a channel you have already closed can cause problems.

-- channel : 	a GIOChannel
-- do_close : 	Whether to close the channel on the final unref of the GIOChannel data structure. The default value of this is TRUE for channels created by g_io_channel_new_file(), and FALSE for all other channels.
-- g_io_channel_read ()

-- GIOError    g_io_channel_read               (GIOChannel *channel,
--                                              gchar *buf,
--                                              gsize count,
--                                              gsize *bytes_read);

-- Warning

-- g_io_channel_read is deprecated and should not be used in newly-written code. Use g_io_channel_read_chars() instead.

-- Reads data from a GIOChannel.

-- channel : 	a GIOChannel.
-- buf : 	a buffer to read the data into (which should be at least count bytes long).
-- count : 	the number of bytes to read from the GIOChannel.
-- bytes_read : 	returns the number of bytes actually read.
-- Returns : 	G_IO_ERROR_NONE if the operation was successful.
-- enum GIOError

-- typedef enum
-- {
--   G_IO_ERROR_NONE,
--   G_IO_ERROR_AGAIN,
--   G_IO_ERROR_INVAL,
--   G_IO_ERROR_UNKNOWN
-- } GIOError;

-- GIOError is only used by the deprecated functions g_io_channel_read(), g_io_channel_write(), and g_io_channel_seek().
-- G_IO_ERROR_NONE 	no error
-- G_IO_ERROR_AGAIN 	an EAGAIN error occurred
-- G_IO_ERROR_INVAL 	an EINVAL error occurred
-- G_IO_ERROR_UNKNOWN 	another error occurred
-- g_io_channel_write ()

-- GIOError    g_io_channel_write              (GIOChannel *channel,
--                                              const gchar *buf,
--                                              gsize count,
--                                              gsize *bytes_written);

-- Warning

-- g_io_channel_write is deprecated and should not be used in newly-written code. Use g_io_channel_write_chars() instead.

-- Writes data to a GIOChannel.

-- channel : 	a GIOChannel.
-- buf : 	the buffer containing the data to write.
-- count : 	the number of bytes to write.
-- bytes_written : 	the number of bytes actually written.
-- Returns : 	G_IO_ERROR_NONE if the operation was successful.
-- g_io_channel_seek ()

-- GIOError    g_io_channel_seek               (GIOChannel *channel,
--                                              gint64 offset,
--                                              GSeekType type);

-- Warning

-- g_io_channel_seek is deprecated and should not be used in newly-written code. Use g_io_channel_seek_position() instead.

-- Sets the current position in the GIOChannel, similar to the standard library function fseek().

-- channel : 	a GIOChannel.
-- offset : 	an offset, in bytes, which is added to the position specified by type
-- type : 	the position in the file, which can be G_SEEK_CUR (the current position), G_SEEK_SET (the start of the file), or G_SEEK_END (the end of the file).
-- Returns : 	G_IO_ERROR_NONE if the operation was successful.
-- g_io_channel_close ()

-- void        g_io_channel_close              (GIOChannel *channel);

-- Warning

-- g_io_channel_close is deprecated and should not be used in newly-written code. Use g_io_channel_shutdown() instead.

-- Close an IO channel. Any pending data to be written will be flushed, ignoring errors. The channel will not be freed until the last reference is dropped using g_io_channel_unref().

-- channel : 	A GIOChannel
-- See Also

-- gtk_input_add_full(), gtk_input_remove(), gdk_input_add(), gdk_input_add_full(), gdk_input_remove() 	

-- Convenience functions for creating GIOChannel instances and adding them to the main event loop.

feature {} -- Internal

	watch_list: FAST_ARRAY [G_IO_FUNC]
		-- We keep g_io_funcs here, to save them from the GC

feature {} -- Externals

	struct_size: INTEGER is
			-- sizeof (wrapped_structure), speaking in C. TODO: shall be a NATURAL
		external "C macro use <glib.h>"
		alias "(sizeof (GIOChannel))"
		end

	g_io_channel_unix_new (fd: INTEGER): POINTER is
		external "C use <glib.h>"
		end

	g_io_channel_win32_new_fd (fd: INTEGER): POINTER is
		external "C use <glib.h>"
		end

	g_io_channel_win32_new_socket (socket: INTEGER): POINTER is
		external "C use <glib.h>"
		end

	g_io_channel_ref (a_channel: POINTER): POINTER is
			-- GIOChannel* g_io_channel_ref (GIOChannel *channel);
		external "C use <glib.h>"
		end

	g_io_channel_unref (channel: POINTER) is
		external "C use <glib.h>"
		end

	g_io_channel_get_encoding (channel: POINTER): POINTER is
		external "C use <glib.h>"
		end

	g_io_add_watch (channel: POINTER; condition: INTEGER; func, user_data: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_write_chars (channel: POINTER; buffer: POINTER; count: INTEGER; written: POINTER; error: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_flush (channel, error: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_get_buffer_size (channel: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_get_flags (channel: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_shutdown (channel: POINTER; after_flush: BOOLEAN; error: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_set_flags (channel: POINTER; flags: INTEGER; error: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_get_buffered (channel: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_io_channel_set_buffered (channel: POINTER; buffered: INTEGER) is
		external "C use <glib.h>"
		end

	g_io_channel_set_encoding (channel, new_encoding, error: POINTER): INTEGER is
		external "C use <glib.h>"
		end

end -- class G_IO_CHANNEL
