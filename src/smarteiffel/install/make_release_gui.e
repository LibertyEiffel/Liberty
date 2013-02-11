-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class MAKE_RELEASE_GUI

insert
   GLOBALS

feature {MAKE_RELEASE, MAKE_RELEASE_JOB}
   start (job: MAKE_RELEASE_JOB) is
      require
         job /= Void
      deferred
      ensure
         does_not_return: False
      end

   set_title (a_message: STRING) is
         -- Displays the application title
      deferred
      end

   set_action (a_message: STRING) is
         -- Displays an action the application is currently performing
      deferred
      end

   set_progress (a_value, a_max: INTEGER; a_message: STRING) is
         -- Displays some progress information about what the application is doing
      require
         a_max > 0
         a_value.in_range(0, a_max)
      deferred
      end

   run_command (a_command: STRING): INTEGER is
      require
         a_command /= Void
         not a_command.has('%N')
      deferred
      end

   die (death_code: INTEGER) is
      require
         death_code >= 0
      deferred
      ensure
         dead: False
      end

   info (a_message: STRING) is
         -- Displays an information message on the standard error stream.
      do
         echo.w_put_string(once "[INFO]%T")
         echo.w_put_string(a_message)
         echo.w_put_character('%N')
      end

   warning (a_message: STRING) is
         -- Displays a warning message on the standard error stream.
      do
         echo.w_put_string(once "[WARN]%T")
         echo.w_put_string(a_message)
         echo.w_put_character('%N')
      end

   error (a_message: STRING) is
         -- Displays an error message on the standard error stream.
      do
         echo.w_put_string(once "[ERROR]%T")
         echo.w_put_string(a_message)
         echo.w_put_character('%N')
      end

   fatal (a_message: STRING; death_code: INTEGER) is
         -- Displays a fatal error message on the standard error stream, and terminates with the given
         -- `death_code' as status.
      require
         death_code /= 0
      do
         echo.w_put_string(once "[FATAL]%T")
         echo.w_put_string(a_message)
         echo.w_put_character('%N')
         die(death_code)
      ensure
         dead: False
      end

end -- class MAKE_RELEASE_GUI
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
