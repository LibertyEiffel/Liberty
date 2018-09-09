-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ERROR_MESSAGE_COMPARATOR
   --
   -- Class used to check that warning/error message of the compiler are stable.
   --

create {ANY}
   make

feature {}
   msg_file, new_file: TEXT_FILE_READ

   msg_file_position, new_file_position: INTEGER

   stop_flag: BOOLEAN

feature {ANY}
   error_flag: BOOLEAN

   error_message: STRING

   do_compare (msg_file_path, new_file_path: STRING)
         -- Perform the comparison between the reference file `msg_file_path' and the `new_file_path'.
         -- Check whether those two files are identical (remove version numbers, Unix/DOS path of files,
         -- blanks, tabs as well as non-meaningful line feed or informations...).
      local
         c1, c2: CHARACTER count: INTEGER
      do
         error_flag := False
         stop_flag := False
         error_message.clear_count

         create msg_file.connect_to(msg_file_path)
         if not msg_file.is_connected then
            stop_flag := True
            error_flag := True
            error_message.append(once "%NCannot open file %"")
            error_message.append(msg_file_path)
            error_message.append(once "%".%N")
         else
            c1 := standard_forth(msg_file)
         end

         create new_file.connect_to(new_file_path)
         if not new_file.is_connected then
            stop_flag := True
            error_flag := True
            error_message.append(once "%NCannot open file %"")
            error_message.append(new_file_path)
            error_message.append(once "%".%N")
         else
            c2 := standard_forth(new_file)
         end

         from
         until
            stop_flag
         loop
            if msg_file.end_of_input then
               if new_file.end_of_input then
                  successful_exit
               else
                  error_exit
               end
            elseif new_file.end_of_input then
               error_exit
            elseif c1 /= c2 then
               error_exit
            else
               inspect c1
               when '(' then
                  c1 := inside_bracket_forth(msg_file)
                  c2 := inside_bracket_forth(new_file)
               when '/' then
                  c1 := unix_path_forth(msg_file)
                  c2 := unix_path_forth(new_file)
               else
                  c1 := standard_forth(msg_file)
                  c2 := standard_forth(new_file)
               end
            end
            count := count + 1
         end
      end

feature {}
   make
      do
         create error_message.make(128)
         error_flag := False
      end

   error_exit
      do
         error_flag := True
         stop_flag := True
         error_message.append(once "%Nsame_msg: ")
         error_message.append(msg_file.path)
         error_message.append(" at: ")
         msg_file_position.append_in(error_message)
         error_message.append(" and ")
         error_message.append(new_file.path)
         error_message.append(" at: ")
         new_file_position.append_in(error_message)
         error_message.append("%N%N%T")
         error_message.append("diff ")
         error_message.append(new_file.path)
         error_message.append(once " ")
         error_message.append(msg_file.path)
         error_message.append("%N")
         msg_file.disconnect
         new_file.disconnect
      end

   successful_exit
      do
         error_flag := False
         stop_flag := True
         msg_file.disconnect
         new_file.disconnect
      end

   standard_forth (m: TEXT_FILE_READ): CHARACTER
      require
         not m.end_of_input
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            m.read_character
            if m = msg_file then
               msg_file_position := msg_file_position + 1
            else
               new_file_position := new_file_position + 1
            end
            if m.end_of_input then
               stop := True
            else
               Result := m.last_character
               inspect
                  Result
               when ' ', '%T', '%N', '%C' then
               else
                  stop := True
               end
            end
         end
      end

   inside_bracket_forth (m: TEXT_FILE_READ): CHARACTER
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            if m.end_of_input then
               stop := True
            elseif Result = ')' then
                  stop := True
            else
               Result := standard_forth(m)
            end
         end
      end

   unix_path_forth (m: TEXT_FILE_READ): CHARACTER
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            if m.end_of_input then
               stop := True
            else
               Result := standard_forth(m)
               inspect Result
               when '.',' ' then
                  stop := True
               else
               end
            end
         end
      end

end -- ERROR_MESSAGE_COMPARATOR
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
