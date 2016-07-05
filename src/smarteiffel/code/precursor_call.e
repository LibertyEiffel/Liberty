-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class PRECURSOR_CALL
   --
   -- Handling of the `Precursor' construct. Common ancestor of
   -- PRECURSOR_CALL_EXPRESSION (when `Precursor' is inside a function call) and
   -- PRECURSOR_CALL_INSTRUCTION (when `Precursor' is inside a procedure call).
   --

inherit
   CODE

feature {ANY}
   start_position: POSITION -- Of the "Precursor" keyword.

   parent: TYPE_MARK
         -- Used when only when the call looks like: {TYPE_MARK} Precursor...
         -- The goal of this extra {TYPE_MARK} is to remove a possible ambiguity in case
         -- of multiple inheritance.

   arguments: EFFECTIVE_ARG_LIST

   specialized_anonymous_feature: ANONYMOUS_FEATURE
         -- The specialized version of the precursor feature

   specialized_parent: CLASS_TEXT
         -- The parent the feature effectively comes from.

   frozen use_current (type: TYPE): BOOLEAN
      do
         -- Could be actually better.
         Result := True
      end

   frozen safety_check (type: TYPE)
      do
         if arguments /= Void then
            arguments.safety_check(type)
         end
      end

   frozen specialize_and_check (type: TYPE): like Current
      local
         saf: like specialized_anonymous_feature; args: like arguments
      do
         saf := specialized_anonymous_feature.specialize_and_check(type)

         if (arguments = Void) /= (specialized_anonymous_feature.arguments = Void) then
            error_handler.add_position(start_position)
            error_handler.add_position(specialized_anonymous_feature.start_position)
            error_handler.append(once "Actual argument list of Precursor call doesn't match the procedures signature.")
            error_handler.print_as_error
         end

         if arguments /= Void and (specialized_anonymous_feature.arguments /= Void) then
            args := arguments.specialize_and_check(type, saf, type, False)
         end
         Result := current_or_twin_init(saf, args)
      end

   frozen specialize_in (new_type: TYPE): like Current
      local
         saf: like specialized_anonymous_feature; arg: like arguments
      do
         --|*** PH(14/04/04): assignment handler should be warned!
         saf := feature_accumulator.current_mixer.build_precursor(Current, new_type)
         if arguments /= Void then
            arg := arguments.specialize_in(new_type)
         end
         Result := current_or_twin_init(saf, arg)
      end

   frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         saf: like specialized_anonymous_feature; arg: like arguments
      do
         check
            specialized_anonymous_feature /= Void
         end
         saf := feature_accumulator.current_mixer.specialize_precursor(specialized_anonymous_feature, parent_type, parent_edge, new_type)
         if arguments /= Void then
            arg := arguments.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(saf, arg)
      end

   frozen has_been_specialized: BOOLEAN
      do
         Result := arguments /= Void implies arguments.has_been_specialized
         Result := Result and then specialized_anonymous_feature /= Void
         Result := Result and then specialized_parent /= Void
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := specialized_anonymous_feature.side_effect_free(type)
         if arguments /= Void then
            Result := Result and then arguments.side_effect_free(type)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         arg: like arguments; run_feature: RUN_FEATURE
      do
         if arguments /= Void then
            arg := arguments.adapt_for(type)
         end
         -- Following access to trigger the corresponding RUN_FEATURE creation:
         run_feature := type.live_type.precursor_run_feature(specialized_parent, specialized_anonymous_feature)
         check
            run_feature.type_of_current = type
         end

         if (arg = Void) /= (specialized_anonymous_feature.arguments = Void) then
            error_handler.add_position(start_position)
            error_handler.add_position(run_feature.start_position)
            error_handler.append(once "Actual argument list of Precursor call doesn't match the procedures signature.")
            error_handler.print_as_error
         end
         -- TODO: check whether we have to check the types or the
         -- length of the argument lists here...

         if arg /= arguments then
            Result := twin
            Result.set_arguments(arg)
         else
            Result := Current
         end
      end

   simplify (type: TYPE): like Current
      local
         saf: like specialized_anonymous_feature; arg: like arguments
      do
         saf := specialized_anonymous_feature.simplify(type)
         if arguments /= Void then
            arg := arguments.simplify(type)
         end
         Result := current_or_twin_init(saf, arg)
      end

feature {ANONYMOUS_FEATURE_MIXER}
   set_specialized_parent (sp: like specialized_parent)
      require
         sp /= Void
         parent /= Void implies parent.class_text = sp
         specialized_parent /= Void implies specialized_parent = sp
      do
         specialized_parent := sp
      ensure
         specialized_parent = sp
      end

feature {PRECURSOR_CALL}
   set_arguments (a: like arguments)
      do
         arguments := a
      end

   init (saf: like specialized_anonymous_feature; arg: like arguments)
      do
         specialized_anonymous_feature := saf
         arguments := arg
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         args: like arguments; saf: like specialized_anonymous_feature
         new_precursor: like Current
      do
         saf := specialized_anonymous_feature.twin
         saf.inline_dynamic_dispatch(code_accumulator, type)
         if arguments /= Void then
            args := arguments.inline_dynamic_dispatch(code_accumulator, type)
         end
         new_precursor := twin
         new_precursor.init(saf, args)
         code_accumulator.current_context.add_last(new_precursor)
      end

feature {}
   make (sp: like start_position; pc: like parent; pal: like arguments)
      require
         not sp.is_unknown
      do
         start_position := sp
         parent := pc
         arguments := pal
      ensure
         start_position = sp
         parent = pc
         arguments = pal
      end

   current_or_twin_init (saf: like specialized_anonymous_feature; a: like arguments): like Current
      require
         saf /= Void
         a /= Void = (arguments /= Void)
      do
         if saf = specialized_anonymous_feature and then a = arguments then
            Result := Current
         else
            Result := twin
            Result.init(saf, a)
         end
      ensure
         Result.specialized_anonymous_feature = saf
         Result.arguments = a
      end

   frozen pretty_ (indent_level: INTEGER)
      local
         buffer: STRING
      do
         pretty_printer.put_string(once "Precursor")
         if parent /= Void then
            pretty_printer.put_character(' ')
            pretty_printer.put_character('{')
            buffer := once "......................."
            buffer.clear_count
            parent.pretty_in(buffer)
            pretty_printer.put_string(buffer)
            pretty_printer.put_character('}')
            pretty_printer.put_character(' ')
         end
         if arguments /= Void then
            arguments.pretty(indent_level + 1)
         end
      end

invariant
   parent /= Void and specialized_parent /= Void implies parent.class_text = specialized_parent

end -- class PRECURSOR_CALL
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
