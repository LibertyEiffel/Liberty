-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SAME_EXECUTABLES
   --
   -- Check if two files given as arguments are (quite) the same
   -- executables files.
   -- Terminate execution with the corresponding exit status code.
   --

insert
   ARGUMENTS

create {}
   make

feature {}
   msg1, msg2: TEXT_FILE_READ

feature {ANY}
   make
      local
         path1, path2: STRING
      do
         if argument_count < 2 then
            io.put_string("Usage: same_files <path1> <path2>%N")
            die_with_code(exit_failure_code)
         end
         path1 := argument(1)
         path2 := argument(2)
         exists_and_is_readable_check(path1)
         exists_and_is_readable_check(path2)
         if same_executables(path1, path2) then
            io.put_string(once "Sames files.%N")
         else
            io.put_string("Files differ.%N")
            die_with_code(exit_failure_code)
         end
      end

feature {}
   same_executables (path1, path2: STRING): BOOLEAN
      local
         f1, f2: TEXT_FILE_READ; diff_count: INTEGER; stop: BOOLEAN
      do
         from
            create f1.connect_to(path1)
            if f1.is_connected then
               if not f1.end_of_input then
                  f1.read_character
               end
            end
            create f2.connect_to(path2)
            if f2.is_connected then
               if not f2.end_of_input then
                  f2.read_character
               end
            end
            diff_count := 4
         until
            stop
         loop
            if f1.end_of_input then
               if f2.end_of_input then
                  stop := True
                  Result := True
               else
                  stop := True
                  Result := False
               end
            elseif f2.end_of_input then
               stop := True
               Result := False
            else
               if f1.last_character /= f2.last_character then
                  diff_count := diff_count - 1
                  if diff_count = 0 then
                     stop := True
                     Result := False
                  end
               end
               f1.read_character
               f2.read_character
            end
         end
         f1.disconnect
         f2.disconnect
      end

   exists_and_is_readable_check (path: STRING)
      do
         if not (create {FILE_TOOLS}).is_readable(path) then
            io.put_string("File : %"")
            io.put_string(path)
            io.put_string("%" not found.%N")
            die_with_code(exit_failure_code)
         end
      end

end -- class SAME_EXECUTABLES
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
