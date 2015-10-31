-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class MOCK_GENERATOR

insert
   GLOBALS

feature {MOCK}
   generate (features: MAP[ANONYMOUS_FEATURE, FEATURE_NAME])
      require
         features /= Void
      local
         i: INTEGER
      do
         create file.connect_to(file_name)
         if file.is_connected then
            echo.put_string(once "Generating features for ")
            echo.put_string(file_name)
            echo.put_new_line
            generate_class_header
            from
               i := features.lower
            until
               i > features.upper
            loop
               echo.put_string(once " - ")
               echo.put_line(features.key(i).to_string)
               generate_feature(features.key(i), features.item(i))
               i := i + 1
            end
            generate_class_footer
            file.disconnect
         else
            error_handler.append(once "Could not write to ")
            error_handler.append(file_name)
            error_handler.print_as_fatal_error
         end
      end

feature {}
   generate_class_header
      require
         file.is_connected
      deferred
      end

   generate_class_footer
      require
         file.is_connected
      deferred
      end

   generate_feature (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      require
         file.is_connected
         af.names.has(fn)
      deferred
      end

   file: TEXT_FILE_WRITE

feature {}
   make (a_file_name: like file_name)
      require
         a_file_name /= Void
      do
         file_name := a_file_name
      ensure
         file_name = a_file_name
      end

   file_name: STRING

end -- class MOCK_GENERATOR
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
-- Copyright(C) 2011-2015: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
