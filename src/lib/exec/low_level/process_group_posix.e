-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PROCESS_GROUP_POSIX

inherit
   PROCESS_GROUP

insert
   PLATFORM
      rename
         Maximum_integer as capacity
      end

create {PROCESS_FACTORY}
   make

feature {ANY}
   wait: PROCESS_POSIX
      local
         process_id, status: INTEGER
      do
         basic_exec_posix_wait_any(data)
         process_id := basic_exec_id(data)
         if process_id /= -1 then
            check
               id_map.has(process_id)
            end
            Result := id_map.at(process_id)
            check
               Result.id = process_id
            end
            status := basic_exec_status(data)
            Result.cleanup(status)
         end
      end

   finished: PROCESS_POSIX
      local
         process_id, status: INTEGER
      do
         basic_exec_posix_any_finished(data)
         process_id := basic_exec_id(data)
         if process_id /= -1 and then process_id /= 0 then
            check
               id_map.has(process_id)
            end
            Result := id_map.at(process_id)
            check
               Result.id = process_id
            end
            status := basic_exec_status(data)
            Result.cleanup(status)
         end
      end

   count: INTEGER
      do
         Result := id_map.count
      end

feature {PROCESS_POSIX}
   register (process: PROCESS_POSIX)
      local
         process_id: INTEGER
      do
         process_id := process.id
         id_map.put(process, process_id)
      end

   unregister (process: PROCESS_POSIX)
      local
         process_id: INTEGER
      do
         process_id := process.id
         id_map.remove(process_id)
      end

feature {}
   make
      do
         create id_map.make
         data := basic_exec_alloc_data
      end

   id_map: HASHED_DICTIONARY[PROCESS_POSIX, INTEGER]

   data: POINTER

   basic_exec_posix_wait_any (dat: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_posix_wait_any"
         }"
      end

   basic_exec_posix_any_finished (dat: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_posix_any_finished"
         }"
      end

   basic_exec_alloc_data: like data
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_alloc_data()"
         }"
      end

   basic_exec_id (dat: like data): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_id"
         }"
      end

   basic_exec_status (dat: like data): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_status"
         }"
      end

end -- class PROCESS_GROUP_POSIX
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
