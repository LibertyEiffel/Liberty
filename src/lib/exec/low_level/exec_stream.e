-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class EXEC_STREAM

feature {PROCESS}
   pipe: POINTER --| **** TODO: memory leak, never deallocated

feature {}
   create_pipe
      do
         if pipe.is_null then
            pipe := basic_exec_alloc_pipe
         end
         if not basic_exec_init_pipe(pipe) then
            basic_exec_free_pipe(pipe)
            pipe := default_pointer
         end
      end

   basic_exec_alloc_pipe: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_alloc_pipe()"
         }"
      end

   basic_exec_free_pipe (p: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_free_pipe"
         }"
      end

   basic_exec_init_pipe (p: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_init_pipe"
         }"
      end

end -- class EXEC_STREAM
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
