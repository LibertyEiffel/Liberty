-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REDIRECTION_TOOLS

feature {STREAM_HANDLER}
   redirection_succeeded: BOOLEAN
         -- Did the last call to redirect succeed?

   restore_default
         -- Cancel redirection
      do
         flush
         save_default_descriptor
         dup2(default_descriptor, filtered_descriptor)
      end

feature {}
   filtered_descriptor: INTEGER
      deferred
      end

   flush
      deferred
      end

   redirect (file_descriptor: INTEGER)
         -- Redirect to/from `file_descriptor'
      do
         redirection_succeeded := open_descriptor_succeeded (file_descriptor)
         if redirection_succeeded then
            flush
            save_default_descriptor
            dup2(file_descriptor, filtered_descriptor)
            close_descriptor(file_descriptor)
         end
      end

   save_default_descriptor
         -- Always call this before calling `dup2'(..., `filtered_descriptor')
      once
         default_descriptor := dup(filtered_descriptor)
      end

   default_descriptor: INTEGER
         -- A descriptor that refers to the same file as stdin initially does.

   dup (descriptor_: INTEGER): INTEGER
         -- Return a new descriptor that refers to the same file as `descriptor_'.
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "dup"
         }"
      end

   dup2 (descriptor_1, descriptor_2: INTEGER)
         -- Make `descriptor_2' point to the same file as `descriptor_1'.
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "dup2"
         }"
      end

   open_descriptor_for_read (file_name: POINTER): INTEGER
         -- Open `file_name' for reading, returning a descriptor to it.
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "open_descriptor_for_read"
         }"
      end

   open_descriptor_for_create (file_name: POINTER): INTEGER
         -- Open `file_name' for writing, returning a descriptor to it. The file is truncated if it already
         -- existed.
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "open_descriptor_for_create"
         }"
      end

   open_descriptor_for_append (file_name: POINTER): INTEGER
         -- Open `file_name' for writing, returning a descriptor to it. New content is appended to the end of
         -- the file if it already existed.
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "open_descriptor_for_append"
         }"
      end

   open_descriptor_succeeded (descriptor_: INTEGER): BOOLEAN
         -- Did open returning `descriptor_' succeed ?
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "open_descriptor_succeeded"
         }"
      end

   close_descriptor (descriptor_: INTEGER)
         -- Close `descriptor_', freeing it for later use.
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "low_level_redirection"
         feature_name: "close_descriptor"
         }"
      end

end -- class REDIRECTION_TOOLS
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
