-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PROCESS_GROUP_WIN32

inherit
   PROCESS_GROUP

create {PROCESS_FACTORY}
   make

feature {ANY}
   wait: PROCESS_WIN32
      local
         handle, status: INTEGER
      do
         if not handle_map.is_empty then
            populate_handle_list
            if basic_exec_win32_wait_any(handle_list.to_external, count, data) then
               handle := basic_exec_win32_handle(data)
               check
                  handle_map.has(handle)
               end
               Result := handle_map.at(handle)
               check
                  Result.handle = handle
               end
               status := basic_exec_status(data)
               Result.cleanup(status)
            end
         end
      end

   finished: PROCESS_WIN32
      local
         handle, status: INTEGER
      do
         if not handle_map.is_empty then
            populate_handle_list
            if basic_exec_win32_any_finished(handle_list.to_external, count, data) then
               handle := basic_exec_win32_handle(data)
               check
                  handle_map.has(handle)
               end
               Result := handle_map.at(handle)
               check
                  Result.handle = handle
               end
               status := basic_exec_status(data)
               Result.cleanup(status)
            end
         end
      end

   count: INTEGER
      do
         Result := handle_map.count
      end

   capacity: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_maximum_wait"
         }"
      end

feature {PROCESS_WIN32}
   register (process: PROCESS_WIN32)
      local
         handle: INTEGER
      do
         handle := process.handle
         handle_map.put(process, handle)
         handle_list_dirty := True
      end

   unregister (process: PROCESS_WIN32)
      local
         handle: INTEGER
      do
         handle := process.handle
         handle_map.remove(handle)
         handle_list_dirty := True
      end

feature {}
   make
      do
         create handle_map.make
         data := basic_exec_alloc_data
      end

   handle_map: HASHED_DICTIONARY[PROCESS_WIN32, INTEGER]

   populate_handle_list
      local
         i: INTEGER
      do
         if handle_list_dirty then
            if handle_list = Void then
               create handle_list.with_capacity(handle_map.count.max(4))
            end
            handle_list.clear_count
            from
               i := handle_map.lower
            until
               i > handle_map.upper
            loop
               handle_list.add_last(handle_map.key(i))
               i := i + 1
            end
            handle_list_dirty := False
         end
      end

   handle_list_dirty: BOOLEAN

   handle_list: FAST_ARRAY[INTEGER]

   data: POINTER

   basic_exec_win32_wait_any (handles: POINTER; count_: INTEGER; data_: POINTER): BOOLEAN
      require
         not handle_map.is_empty
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_wait_any"
         }"
      end

   basic_exec_win32_any_finished (handles: POINTER; count_: INTEGER; data_: POINTER): BOOLEAN
      require
         not handle_map.is_empty
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_any_finished"
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

   basic_exec_win32_handle (dat: like data): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_win32_handle"
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

end -- class PROCESS_GROUP_WIN32
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
