-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ONCE8
   --
   -- To memorize the result of a discussion at the last ECMA we agree with.
   --
   -- Pre--post condition of once must be checked at every calls (they
   -- are part of the interface).
   -- Dom. feb 18th 2004, just back from Orinda CA.
   --

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   require_trace: STRING
      once
         create Result.make(0)
      end

   body_trace: STRING
      once
         create Result.make(0)
      end

   ensure_trace: STRING
      once
         create Result.make(0)
      end

   update_trace (actual_trace: STRING; step_mark: STRING): BOOLEAN
      do
         actual_trace.append(step_mark)
         Result := True
      end

   once_procedure (step_mark: STRING)
      require
         update_trace(require_trace, "RP")
      once
         body_trace.append(step_mark)
      ensure
         update_trace(ensure_trace, "EP")
      end

   make
      local
         require_trace_view, ensure_trace_view, once_function_result: STRING
      do
         setup_flags
         -- To ease debug:
         require_trace_view := require_trace
         ensure_trace_view := ensure_trace
         assert(require_trace.is_empty)
         assert(body_trace.is_empty)
         assert(ensure_trace.is_empty)
         once_procedure("1")
         assert(require_flag implies require_trace.is_equal("RP"))
         assert(body_trace.is_equal("1"))
         assert(ensure_flag implies ensure_trace.is_equal("EP"))
         once_procedure("2")
         assert(require_flag implies require_trace.is_equal("RPRP"))
         assert(body_trace.is_equal("1"))
         assert(ensure_flag implies ensure_trace.is_equal("EPEP"))
         require_trace.clear_count
         ensure_trace.clear_count
         once_function_result := once_function("call_1")
         assert(require_flag implies require_trace.is_equal("RP"))
         assert(ensure_flag implies ensure_trace.is_equal("EP"))
         assert(once_function("call_2") = once_function_result)
         assert(require_flag implies require_trace.is_equal("RPRP"))
         assert(ensure_flag implies ensure_trace.is_equal("EPEP"))
      end

   require_flag: BOOLEAN

   set_require_flag: BOOLEAN
      do
         require_flag := True
         Result := True
      end

   ensure_flag: BOOLEAN

   set_ensure_flag: BOOLEAN
      do
         ensure_flag := True
         Result := True
      end

   setup_flags
      require
         set_require_flag
      do
      ensure
         set_ensure_flag
      end

   once_function (step_mark: STRING): STRING
      require
         update_trace(require_trace, "RP")
      once
         Result := step_mark.twin
      ensure
         update_trace(ensure_trace, "EP")
      end

end -- class TEST_ONCE8
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
