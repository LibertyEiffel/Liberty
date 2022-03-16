-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_SPLITTER
   --
   -- A simple Strategy pattern to know when to split the generated C files
   --

insert
   GLOBALS

feature {}
   do_split
      require
         not dont_split
      deferred
      end

feature {CLEAN}
   should_clean (path_c, file_name: STRING): BOOLEAN
      require
         path_c /= Void
         file_name /= Void
      deferred
      end

feature {C_PRETTY_PRINTER}
   connect (path_c: STRING)
      require
         path_c /= Void
         not out_c.is_connected
      do
         c_path := path_c.twin
         connect_out_c
         cpp.begin_c_file
      ensure
         out_c.is_connected
      end

   connect_cpp (cpp_path_c: STRING)
      do
      end

   split_now
      require
         not dont_split
      do
         cpp.end_c_file
         do_split
         connect_out_c
         cpp.begin_c_file
      end

   set_live_type (a_live_type: like live_type)
      deferred
      end

   live_type: LIVE_TYPE
      deferred
      end

   should_split (features_count: INTEGER): BOOLEAN
      require
         features_count >= 0
      deferred
      ensure
         dont_split implies not Result
      end

   linker_command (c_file_prefix: STRING): STRING
      require
         not c_file_prefix.is_empty
      deferred
      end

   out_c: TEXT_FILE_WRITE
      once
         create Result.make
      end

   set_dont_split (please_dont: BOOLEAN)
      do
         dont_split := please_dont
      ensure
         dont_split = please_dont
      end

   dont_split: BOOLEAN

   write_make_file (out_make: TEXT_FILE_WRITE): BOOLEAN
         -- True if some compilation should occur, False if the executable is up to date.
      require
         out_make.is_connected
      deferred
      end

feature {ACE}
   pretty_ace_in (txt: STRING)
      require
         txt /= Void
      deferred
      end

feature {}
   connect_out_c
      deferred
      ensure
         out_c.is_connected
      end

   c_connect (real_c_path: STRING)
      do
         out_c.connect_to(real_c_path)
         if out_c.is_connected then
            echo.put_string(once "Writing %"")
            echo.put_string(real_c_path)
            echo.put_string(once "%" file.%N")
         else
            echo.w_put_string(once "Cannot write file %"")
            echo.w_put_string(real_c_path)
            echo.w_put_string(once "%".%N")
            die_with_code(exit_failure_code)
         end
      ensure
         out_c.is_connected
      end

   c_path: STRING

end -- class C_SPLITTER
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
