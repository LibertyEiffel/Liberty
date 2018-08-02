-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CODE
   --
   -- Common direct ancestor of EXPRESSION and INSTRUCTION.
   --

inherit
   VISITABLE

insert
   GLOBALS

feature {ANY}
   start_position: POSITION
         -- Of the left-most character of `Current'.
      deferred
      ensure
         not Result.is_unknown
      end

   specialize_in (type: TYPE): like Current
         -- Specialize `Current' knowing that the corresponding source code was written in `type'. The `Result'
         -- still contains all the original source code information in order to be able to `specialize_in' again
         -- the `Result' in another `type'. (See also `specialize_thru' and `has_been_specialized' as well.)
      require
         start_position.class_text = type.class_text
      deferred
      ensure
         Result.has_been_specialized -- All the original source code information is kept in the `Result':
         Result.generating_type = generating_type
      end

   has_been_specialized: BOOLEAN
         -- Used both for `specialize_in' and `specialize_thru' to indicate that we have all FEATURE_STAMPs
         -- ready for use and that FEATURE_NAMEs are no longer used (except for calls on non-current target
         -- who are available after `specialize_and_check' -- step). Finally, also note that the purpose of this
         -- feature is mostly to write contracts (see also the strange ensure assertion).
      deferred
      ensure
         assertion_check_only: Result
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
         -- Assuming that `Current' is already specialized in `parent_type', now specialize `Current' for the
         -- `new_type' knowing that this source code is inherited thru `parent_edge'. (See also
         -- `specialize_in' and `has_been_specialized' as well.)
      require
         has_been_specialized
         start_position.class_text /= new_type.class_text
         new_type.direct_thru_step(parent_type, parent_edge)
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized -- All the original source code information is kept in the `Result':
         Result.generating_type = generating_type
      end

   specialize_and_check (type: TYPE): CODE
         -- This `specialize_and_check' step is applied after `specialize_in' / `specialize_thru'. The `specialize_and_check'
         -- step has been added to continue specialization which can't be made at `specialize_in' / `specialize_thru'
         -- time (because the expression TYPE computation may involve TYPEs who don't yet exist).
         -- At `specialize_and_check' step, all TYPEs used by `Current' expression are ready, so TYPE may be known for all
         -- sub-members (target, arguments) using `resolve_in', if we take care to call `specialize_and_check' on them
         -- before calling `resolve_in'. So we can continue the specialization process and perform some validation
         -- checks knowing the TYPE of other components.
         --
         -- After this `specialize_and_check' has been called on `Current', `resolve_in' can be used to know the
         -- `Current' expression result TYPE.
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
         may_report_an_error: error_handler.is_empty
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized
         may_report_an_error: error_handler.is_empty
      end

   specialize_without_checks (type: TYPE): like specialize_and_check
         -- Perform specialize_and_check without checking the validity (export violations, ...)
         -- Useful for generated code
         --|*** At the moment, checks are only inhibited for CREATE_INSTRUCTIONs.
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      do
         Result := specialize_and_check(type)
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   collect (type: TYPE): TYPE
         -- Collect `Current' to become actually true live code in `type' knowing that `Current'
         -- already specialized in `type'. The `Result' is used for EXPRESSION only to indicates its
         -- TYPE in the `type' context. Feature `collect' may be call more than once on the same
         -- target until for example the `magic_count' to be stabilized. Also note that, when not
         -- Void, the `Result' must be the one given by a similar `resolve_in' call.

         -- *** AS THE NEW `collect' NOW ACCEPT VOID AS A TARGET, IT
         -- *** CAN BE COOL TO TRACK is_void CALL PROTECTIONS.
         -- *** (Dom April 6th 2008)
      require
         has_been_specialized
         type.feature_collection_done
         smart_eiffel.status.is_collecting
         not smart_eiffel.status.is_specializing
      deferred
      end

   side_effect_free (type: TYPE): BOOLEAN
         -- True when the evaluation of `Current' has no side effect at all (i.e. no memory allocated, no
         -- modification in the _heap_ memory, no external code with possible side effect). Actually, when
         -- `side_effect_free' is True, `Current' can be evaluated more than once or not evaluated at all.
      require
         smart_eiffel.status.collecting_done
         type /= Void
      deferred
      end

   use_current (type: TYPE): BOOLEAN
         -- Is Current used?
      require
         smart_eiffel.status.collecting_done
         type /= Void
      deferred
      end

   to_expression: EXPRESSION
         -- Safe down-casting.
      require
         {EXPRESSION} ?:= Current
      do
         Result ::= Current
      end

   to_instruction: INSTRUCTION
         -- Safe down-casting.
      require
         {INSTRUCTION} ?:= Current
      do
         Result ::= Current
      end

   frozen is_not_a_compound: BOOLEAN
         -- Mostly for assertion checks.
      do
         Result := not {COMPOUND} ?:= Current
      ensure
         Result = not {COMPOUND} ?:= Current
      end

feature {CODE, EFFECTIVE_ARG_LIST, NO_INVARIANT_WRAPPER}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      require
         code_accumulator /= Void
         type /= Void
      deferred
      ensure
         code_accumulator.context_level = old code_accumulator.context_level
      end

feature {ANY}
   adapt_for (type: TYPE): like Current
         -- This function is called only once at the end of the compilation process (i.e. after `collect'
         -- `inline_dynamic_dispatch' and `simplify'). During this last step RUN_FEATUREs are prepared too.
      require
         type /= Void
         not smart_eiffel.short_or_class_check_flag
      deferred
      ensure
         Result /= Void
      end

   safety_check (type: TYPE)
      require
         smart_eiffel.status.is_safety_checking
         type.live_type /= Void
      deferred
      end

   pretty (indent_level: INTEGER)
      require
         smart_eiffel.pretty_flag implies indent_level >= 1
      deferred
      end

feature {ANONYMOUS_FEATURE, CODE}
   simplify (type: TYPE): CODE
         -- May return `Current', Void or a simplified version of `Current'.
      require
         type /= Void
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.status.collecting_done
      deferred
      ensure
         (Result /= Current or Result = Void) implies (smart_eiffel.magic_count > old smart_eiffel.magic_count);
         (Result = Current) implies (smart_eiffel.magic_count = old smart_eiffel.magic_count)
      end

feature {}
   inline_dynamic_dispatch_of (code_accumulator: CODE_ACCUMULATOR; type: TYPE; l: FAST_ARRAY[EXPRESSION]): like l
      require
         not l.is_empty
      local
         i: INTEGER; exp1, exp2: EXPRESSION
      do
         from
            i := l.lower
         until
            i > l.upper or else exp1 /= exp2
         loop
            exp1 := l.item(i)
            exp1.inline_dynamic_dispatch_(code_accumulator, type)
            exp2 := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            i := i + 1
         end
         if exp1 = exp2 then
            Result := l
         else
            from
               Result := l.twin
               Result.put(exp2, i - 1)
            until
               i > Result.upper
            loop
               Result.item(i).inline_dynamic_dispatch_(code_accumulator, type)
               Result.put(code_accumulator.current_context.last.to_expression, i)
               code_accumulator.current_context.remove_last
               i := i + 1
            end
         end
      ensure
         Result.count = l.count
      end

end -- class CODE
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
