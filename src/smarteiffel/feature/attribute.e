-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ATTRIBUTE
   --
   -- For all sorts of attributes : constants (CST_ATT), unique
   -- (CST_ATT_UNIQUE) and instance variables (WRITABLE_ATTRIBUTE).
   --

inherit
   ANONYMOUS_FEATURE

feature {ANY}
   result_type: TYPE_MARK

   is_deferred: BOOLEAN False

   is_attribute: BOOLEAN True

   obsolete_mark: MANIFEST_STRING

   frozen rescue_compound: INSTRUCTION
      do
      end

   frozen set_rescue_compound (instruction: like rescue_compound)
      do
         if instruction /= Void then
            error_handler.add_position(instruction.start_position)
         else
            error_handler.add_position(start_position)
         end
         error_handler.append(once "Attributes cannot have a rescue compound.")
         error_handler.print_as_fatal_error
      end

   frozen arguments: FORMAL_ARG_LIST
      do
      end

feature {FEATURE_STAMP, PRECURSOR_CALL}
   specialize_and_check (type: TYPE): like Current
      local
         ra: like require_assertion; ea: like ensure_assertion
      do
         if ace.boost then
            Result := Current
         else
            if require_assertion /= Void then
               ra ::= require_assertion.specialize_and_check(type)
            end
            if ensure_assertion /= Void then
               ea := ensure_assertion.specialize_and_check(type)
            end
            if ra = require_assertion and then ea = ensure_assertion then
               Result := Current
            else
               Result := twin
               Result.set_require_assertion(ra)
               Result.set_ensure_assertion(ea)
            end
         end
      end

feature {FEATURE_STAMP, LIVE_TYPE, PRECURSOR_CALL}
   simplify (type: TYPE): ANONYMOUS_FEATURE
      do
         Result := Current
      end

feature {}
   frozen try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE
      do
         error_handler.add_position(start_position)
         error_handler.add_position(fn.start_position)
         error_handler.append(once "An attribute cannot be undefined.")
         error_handler.print_as_error
         bc.fatal_undefine(fn)
      end

invariant
   no_arguments: arguments = Void

end -- class ATTRIBUTE
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
