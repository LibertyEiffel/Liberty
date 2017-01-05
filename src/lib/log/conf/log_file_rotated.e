-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_FILE_ROTATED

inherit
   LOG_FILE_OPTION

create {LOG_FILE_OPTIONS}
   make

feature {LOG_FILE_OPTIONS, LOG_FILE_OPTION}
   retrieve (stream: OUTPUT_STREAM): OUTPUT_STREAM
      local
         s: STREAM
         file: FILE_STREAM
      do
         Result := parent.retrieve(stream)
         s := Result
         if file ?:= s then -- TODO: BERK (inheritance branch skipped)
            file ::= s
            if condition.item([file]) then
               s := rotate(file)
               Result ::= s
            end
         end
      end

feature {}
   make (a_parent: like parent; a_condition: like condition; a_retention: like retention)
      require
         a_parent /= Void
         a_condition /= Void
      do
         parent := a_parent
         condition := a_condition
         retention := a_retention
      ensure
         parent = a_parent
         condition = a_condition
         retention = a_retention
      end

   parent: LOG_FILE_OPTION
   condition: PREDICATE[TUPLE[FILE_STREAM]]
   retention: INTEGER_64

   file_pattern (base_name: STRING): REGULAR_EXPRESSION
      local
         file_name: STRING; i: INTEGER; c: CHARACTER
         regex: REGULAR_EXPRESSION_BUILDER
      do
         file_name := once ""
         file_name.with_capacity(base_name.count + 20)
         file_name.copy(once "^")
         from
            i := base_name.lower
         until
            i > base_name.upper
         loop
            c := base_name.item(i)
            inspect
               c
            when '.', '\', '*', '+', '?', '{', '}', '|', '^', '$', '(', ')' then
               file_name.extend('\')
               file_name.extend(c)
            else
               file_name.extend(c)
            end
            i := i + 1
         end
         file_name.append(once "\.([0-9]+)(\..*)?$")
         Result := regex.convert_posix_pattern(file_name)
      end

   rotate (file: FILE_STREAM): FILE_STREAM
      require
         file.is_connected
      local
         file_name_pattern: REGULAR_EXPRESSION
         file_path, dir_name, file_name, new_file_name: STRING
         i: INTEGER
      do
         file_path := file.path
         file.disconnect

         dir_name := once ""
         bd.compute_parent_directory_of(file_path)
         if bd.last_entry.is_empty then
            dir_name.make_from_string(bd.current_working_directory)
         else
            dir_name.copy(bd.last_entry)
         end

         file_name := once ""
         bd.compute_short_name_of(file_path)
         file_name.copy(bd.last_entry)

         if retention /= 0 then
            last_index := 0
            file_name_pattern := file_pattern(file_name)
            from
               map(dir_name, file_name_pattern, agent set_last_index(?))
               i := last_index
            until
               i = 0
            loop
               map(dir_name, file_name_pattern, agent rotate_file(dir_name, file_name_pattern, i, ?, ?))
               i := i - 1
            end
            new_file_name := once ""
            new_file_name.copy(file_name)
            new_file_name.append(once ".1")
            bd.compute_file_path_with(dir_name, new_file_name)
            ft.rename_to(file_path, bd.last_entry)
         end

         create {TEXT_FILE_WRITE} Result.connect_to(file_path)
         do_at_exit(agent (file_: FILE_STREAM) do if file_.is_connected then file_.disconnect end end (Result))
      ensure
         Result /= file
         Result.is_connected
         not file.is_connected
      end

   map (dir_name: STRING; file_name_pattern: REGULAR_EXPRESSION; action: PROCEDURE[TUPLE[INTEGER, STRING]])
         -- non-Void if the file exists; in that case the result contains the exact name of the log file.
      require
         dir_name /= Void
         file_name_pattern /= Void
         action /= Void
      local
         buf, file_name: STRING
      do
         buf := once ""
         bd.connect_to(dir_name)
         if bd.is_connected then
            from
               file_name := once ""
               bd.read_entry
            until
               bd.end_of_input
            loop
               file_name.copy(bd.last_entry)
               if file_name_pattern.match(file_name) then
                  buf.clear_count
                  file_name_pattern.append_ith_group(file_name, buf, 1)
                  check
                     buf.is_integer
                  end
                  action.call([buf.to_integer, file_name])
               end
               bd.read_entry
            end
            bd.disconnect
         end
      end

   last_index: INTEGER

   set_last_index (index: INTEGER)
      do
         if index > last_index then
            last_index := index
         end
      end

   rotate_file (dir_name: STRING; file_name_pattern: REGULAR_EXPRESSION; at_index, index: INTEGER; file_name: STRING)
      require
         last_index > 0
      local
         path, new_file_name, new_index: STRING
      do
         if retention /= -1 and then index > retention then
            bd.compute_file_path_with(dir_name, file_name)
            ft.delete(bd.last_entry)
         elseif index = at_index then
            path := once ""
            bd.compute_file_path_with(dir_name, file_name)
            path.copy(bd.last_entry)
            new_index := once ""
            new_index.clear_count
            ;(index + 1).append_in(new_index)
            new_file_name := once ""
            new_file_name.copy(file_name)
            if file_name_pattern.match(new_file_name) then
               new_file_name.replace_substring(new_index, file_name_pattern.ith_group_first_index(1), file_name_pattern.ith_group_last_index(1))
               bd.compute_file_path_with(dir_name, new_file_name)
               ft.rename_to(path, bd.last_entry)
            else
               check False end
            end
         end
      end

   bd: BASIC_DIRECTORY
   ft: FILE_TOOLS

end -- class LOG_FILE_ROTATED
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
