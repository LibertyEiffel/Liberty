deferred class GLIB_BASE64_ENCODING
   -- Base64 Encoding

--    Base64 Encoding -- encodes and decodes data in Base64 format

-- Synopsis


--  #include <glib.h>


--  gsize       g_base64_encode_step            (const guchar *in,
--                                               gsize len,
--                                               gboolean break_lines,
--                                               gchar *out,
--                                               gint *state,
--                                               gint *save);
--  gsize       g_base64_encode_close           (gboolean break_lines,
--                                               gchar *out,
--                                               gint *state,
--                                               gint *save);
--  gchar*      g_base64_encode                 (const guchar *data,
--                                               gsize len);
--  gsize       g_base64_decode_step            (const gchar *in,
--                                               gsize len,
--                                               guchar *out,
--                                               gint *state,
--                                               guint *save);
--  guchar*     g_base64_decode                 (const gchar *text,
--                                               gsize *out_len);

-- Description

--    Base64 is an encoding that allows to encode a sequence of arbitrary bytes as a
--    sequence of printable ASCII characters. For the definition of Base64, see RFC
--    1421 or RFC 2045. Base64 is most commonly used as a MIME transfer encoding for
--    email.

--    GLib supports incremental encoding using g_base64_encode_step() and
--    g_base64_encode_close(). Incremental decoding can be done with
--    g_base64_decode_step(). To encode or decode data in one go, use g_base64_encode()
--    or g_base64_decode().

--    Support for Base64 encoding has been added in GLib 2.12.

-- Details

--   g_base64_encode_step ()

--  gsize       g_base64_encode_step            (const guchar *in,
--                                               gsize len,
--                                               gboolean break_lines,
--                                               gchar *out,
--                                               gint *state,
--                                               gint *save);

--    Incrementally encode a sequence of binary data into it's Base-64 stringified
--    representation. By calling this function multiple times you can convert data in
--    chunks to avoid having to have the full encoded data in memory.

--    When all of the data has been converted you must call g_base64_encode_close() to
--    flush the saved state.

--    The output buffer must be large enough to fit all the data that will be written
--    to it. Due to the way base64 encodes you will need at least: len * 4 / 3 + 6
--    bytes. If you enable line-breaking you will need at least: len * 4 / 3 + len * 4
--    / (3 * 72) + 7 bytes.

--    break_lines is typically used when putting base64-encoded data in emails. It
--    breaks the lines at 72 columns instead of putting all of the text on the same
--    line. This avoids problems with long lines in the email system.

--    in :          the binary data to encode.
--    len :         the length of in.
--    break_lines : whether to break long lines
--    out :         pointer to destination buffer
--    state :       Saved state between steps, initialize to 0
--    save :        Saved state between steps, initialize to 0
--    Returns :     The number of bytes of output that was written

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_base64_encode_close ()

--  gsize       g_base64_encode_close           (gboolean break_lines,
--                                               gchar *out,
--                                               gint *state,
--                                               gint *save);

--    Flush the status from a sequence of calls to g_base64_encode_step().

--    break_lines : whether to break long lines
--    out :         pointer to destination buffer
--    state :       Saved state from g_base64_encode_step()
--    save :        Saved state from g_base64_encode_step()
--    Returns :     The number of bytes of output that was written

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_base64_encode ()

--  gchar*      g_base64_encode                 (const guchar *data,
--                                               gsize len);

--    Encode a sequence of binary data into its Base-64 stringified representation.

--    data :    the binary data to encode.
--    len :     the length of data.
--    Returns : a newly allocated, zero-terminated Base-64 encoded string representing
--              data.

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_base64_decode_step ()

--  gsize       g_base64_decode_step            (const gchar *in,
--                                               gsize len,
--                                               guchar *out,
--                                               gint *state,
--                                               guint *save);

--    Incrementally decode a sequence of binary data from its Base-64 stringified
--    representation. By calling this function multiple times you can convert data in
--    chunks to avoid having to have the full encoded data in memory.

--    The output buffer must be large enough to fit all the data that will be written
--    to it. Since base64 encodes 3 bytes in 4 chars you need at least: len * 3 / 4
--    bytes.

--    in :      binary input data
--    len :     max length of in data to decode
--    out :     output buffer
--    state :   Saved state between steps, initialize to 0
--    save :    Saved state between steps, initialize to 0
--    Returns : The number of bytes of output that was written

--    Since 2.12

--    ---------------------------------------------------------------------------------

--   g_base64_decode ()

--  guchar*     g_base64_decode                 (const gchar *text,
--                                               gsize *out_len);

--    Decode a sequence of Base-64 encoded text into binary data

--    text :    zero-terminated string with base64 text to decode.
--    out_len : The length of the decoded data is written here.
--    Returns : a newly allocated buffer containing the binary data that text
--              represents

--    Since 2.12
end -- class GLIB_BASE64_ENCODING

