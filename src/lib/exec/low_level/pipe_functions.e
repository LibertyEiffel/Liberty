-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PIPE_FUNCTIONS

feature {}
   basic_exec_pipe_create: POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_create()"
         }"
      end

   basic_exec_pipe_again (data: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_again"
         }"
      end

   basic_exec_pipe_error (data: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_error"
         }"
      end

feature {} -- for PIPE_OUTPUT
   basic_exec_pipe_in_disconnect (data: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_in_disconnect"
         }"
      end

   basic_exec_pipe_in_fd (data: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_in_fd"
         }"
      end

   basic_exec_pipe_read (data: POINTER; sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_read"
         }"
      end

   basic_exec_pipe_read_character (data: POINTER): CHARACTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_read_character"
         }"
      end

   basic_exec_pipe_in_named (path: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_in_named"
         }"
      end

feature {} -- for PIPE_INPUT
   basic_exec_pipe_out_disconnect (data: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_out_disconnect"
         }"
      end

   basic_exec_pipe_out_fd (data: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_out_fd"
         }"
      end

   basic_exec_pipe_write (data: POINTER; c: CHARACTER; sync: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_write"
         }"
      end

   basic_exec_pipe_flush (data: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_flush"
         }"
      end

   basic_exec_pipe_out_named (path: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/exec"
         module_name: "pipes"
         feature_name: "basic_exec_pipe_out_named"
         }"
      end

end -- class PIPE_FUNCTIONS
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
