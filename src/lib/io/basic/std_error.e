-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STD_ERROR
   --
   -- To write on the standard error output. As for UNIX, the default standard error file is the screen.
   --
   -- Note: only one instance of this class should be necessary.  Access it through ANY.std_error.
   --
   -- See also STANDARD_STREAMS
   --

inherit
   TERMINAL_OUTPUT_STREAM
      redefine put_natively_stored_string, dispose
      end

insert
   REDIRECTION_TOOLS
      rename
         restore_default as restore_default_error
      redefine
         restore_default_error
      end

create {ANY}
   make

feature {ANY}
   is_connected: BOOLEAN True

   disconnect
      do
         filter := Void
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         io_putc(c, stderr)
      end

   filtered_flush
      do
         std_output.flush
         io_flush(stderr)
      end

feature {ABSTRACT_STRING}
   put_natively_stored_string (s: NATIVELY_STORED_STRING)
      local
         unused_result: INTEGER
         fs: FIXED_STRING
      do
         if fs ?:= s then
            fs ::= s
            --|*** TODO: replace by an io_fwrite_slice
            if fs.is_shared then
               fs.unshare
            end
         end
         unused_result := io_fwrite(s.storage, s.count, stderr)
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         Result := sequencer_descriptor(stderr)
      end

   filtered_has_descriptor: BOOLEAN True

   filtered_stream_pointer: POINTER
      do
         Result := stderr
      end

   filtered_has_stream_pointer: BOOLEAN True

feature {STREAM_HANDLER}
   redirect_to (file_name: STRING)
         -- Redirect standard error to `file_name' instead of the default standard error.  If `file_name'
         -- does not exist, it is created.  If it exists, its previous content is erased.
         --
         -- See also `redirection_succeeded'
      do
         redirect(open_descriptor_for_create(file_name.to_external))
      end

   redirect_append_to (file_name: STRING)
         -- Redirect standard error to `file_name' instead of the default standard error.  If `file_name'
         -- does not exist, it is created.  If it exists, the new error stream is appended to it.
         --
         -- See also `redirection_succeeded'
      do
         redirect(open_descriptor_for_append(file_name.to_external))
      end

   restore_default_error
         -- Restore standard error to go to the default standard error.
      do
         Precursor
      end

feature {}
   make
      do
      end

   stderr: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "io"
         feature_name: "stderr"
         }"
      end

   dispose
      do
         check
            std_error = Current
         end
         -- Nothing to dispose for `std_error'.
      end

end -- class STD_ERROR
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
