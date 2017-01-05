-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_FILE_ZIPPED

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
         if Result /= stream and then file ?:= s then
            file ::= s
            zip(file.path, file)
         end
      end

feature {}
   make (a_parent: like parent; a_command: like command)
      require
         a_parent /= Void
         a_command /= Void
      do
         parent := a_parent
         command := a_command
      ensure
         parent = a_parent
         command = a_command
      end

   parent: LOG_FILE_OPTION
   command: FIXED_STRING

   zip (file_path: STRING; file: FILE_STREAM)
      require
         not file.is_connected
      local
         dir_name, file_name: STRING
         cmd, rotated_file_path: STRING; i: INTEGER
         pf: PROCESS_FACTORY; p: PROCESS
      do
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
         file_name.append(once ".1")

         bd.compute_file_path_with(dir_name, file_name)
         rotated_file_path := once ""
         rotated_file_path.copy(bd.last_entry)
         if ft.file_exists(rotated_file_path) then
            cmd := once ""
            cmd.make_from_string(command)
            i := cmd.substring_index(once "{}", cmd.lower)
            if cmd.valid_index(i) then
               cmd.replace_substring(rotated_file_path, i, i + 1)
            else
               cmd.extend_unless(' ')
               cmd.append(rotated_file_path)
            end
            p := pf.execute_command_line(cmd)
            check
               p /= Void
            end
         end
      end

   bd: BASIC_DIRECTORY
   ft: FILE_TOOLS

end -- class LOG_FILE_ZIPPED
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
