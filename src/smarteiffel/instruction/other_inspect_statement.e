-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class OTHER_INSPECT_STATEMENT
   --
   -- See INSPECT_STATEMENT for explanations.
   --

inherit
   INSPECT_STATEMENT

create {ANY}
   make, with_when_list, make_strippable

feature {ANY}
   accept (visitor: OTHER_INSPECT_STATEMENT_VISITOR)
      do
         visitor.visit_other_inspect_statement(Current)
      end

   dynamic_dispatch_flag: BOOLEAN
         -- Indicate that the intent of `Current' is to implement dynamic dispatch.
      do
         Result := dynamic_dispatch_temporary1 /= Void
      end

feature {PROCEDURE_CALL, FUNCTION_CALL}
   set_dynamic_dispatch_flag (ddt1: like dynamic_dispatch_temporary1)
      require
         ddt1 /= Void
      do
         dynamic_dispatch_temporary1 := ddt1
      ensure
         dynamic_dispatch_temporary1 = ddt1
      end

feature {INSPECT_STATEMENT}
   validity_check (type, expression_type: TYPE)
      local
         i: INTEGER
      do
         if when_list /= Void then
            -- Validity check first:
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_list.item(i).validity_check(type, expression_type, Current)
               i := i + 1
            end
         end
      end

end -- class OTHER_INSPECT_STATEMENT
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
