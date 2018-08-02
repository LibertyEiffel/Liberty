-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class DEFERRED_ROUTINE
   --
   -- For all sorts of deferred routines.
   --

inherit
   E_ROUTINE

feature {ANY}
   frozen side_effect_free (target_type: TYPE): BOOLEAN
      do
         -- Because it must crahes.
      end

   is_deferred: BOOLEAN True

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
         error_handler.append(once "Deferred feature must not have rescue compound.")
         error_handler.print_as_fatal_error
      end

   specialize_body_in (new_type: TYPE; can_twin: BOOLEAN): like Current
      do
         Result := Current
      end

   specialize_body_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE; can_twin: BOOLEAN): like Current
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN
      do
         if ace.boost then
            Result := True
         else
            Result := require_assertion /= Void implies require_assertion.has_been_specialized
            if Result and then ensure_assertion /= Void then
               Result := ensure_assertion.has_been_specialized
            end
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         fa_memory: like arguments; cfa_memory: like closure_arguments
         ra: like require_assertion; ea: like ensure_assertion
      do
         if ace.boost then
            Result := Current
         else
            fa_memory := smart_eiffel.specializing_feature_arguments_list
            cfa_memory := smart_eiffel.specializing_closure_arguments_lists
            check
               closure_arguments = Void
            end
            smart_eiffel.set_specializing_feature_arguments(arguments, Void)
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
            smart_eiffel.set_specializing_feature_arguments(fa_memory, cfa_memory)
         end
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := True
      end

feature {FEATURE_STAMP, LIVE_TYPE, PRECURSOR_CALL}
   simplify (type: TYPE): ANONYMOUS_FEATURE
      do
         Result := Current
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_9
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {}
   collect_body (t: TYPE)
      do
      end

feature {}
   add_into_ (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
      do
         add_into_shared(ft, fd)
      end

   pretty_print_routine_body (indent_level: INTEGER)
      do
         pretty_index(indent_level, Void)
         pretty_printer.put_string(once "deferred")
      end

   pretty_print_rescue (indent_level: INTEGER)
      do
      end

feature {}
   try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE
      do
         Result := Current
      end

feature {}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
      end

end -- class DEFERRED_ROUTINE
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
