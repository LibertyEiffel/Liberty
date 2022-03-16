-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CHECK_COMPOUND
   --
   -- Instruction "check ... end;".
   --

inherit
   INSTRUCTION
   INDEXINGABLE
      export {ASSERTION_LIST}
         pretty_index
      end

create {ANY}
   make

feature {ANY}
   end_mark_comment: BOOLEAN True

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := ace.boost
      end

   start_position: POSITION
         -- Of keyword "check".
      do
         if assertion_list /= Void then
            Result := assertion_list.start_position
         end
      end

   specialize_in (type: TYPE): like Current
      local
         al: like assertion_list
      do
         if assertion_list /= Void then
            al := assertion_list.specialize_in(type)
         end
         Result := current_or_twin_init(al)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         al: like assertion_list
      do
         if assertion_list /= Void then
            al := assertion_list.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(al)
      end

   specialize_and_check (type: TYPE): like Current
      local
         al: like assertion_list
      do
         if assertion_list /= Void then
            al := assertion_list.specialize_and_check(type)
         end
         Result := current_or_twin_init(al)
      end

   has_been_specialized: BOOLEAN
      do
         if assertion_list = Void then
            Result := True
         else
            Result := assertion_list.has_been_specialized
         end
      end

   safety_check (type: TYPE)
      do
         assertion_list.safety_check(type)
      end

   simplify (type: TYPE): INSTRUCTION
      local
         al: like assertion_list
      do
         if must_be_generated(type) then
            al := assertion_list.simplify(type)
            Result := current_or_twin_init(al)
         end
         if Result /= Current then
            smart_eiffel.magic_count_increment
         end
      end

   use_current (type: TYPE): BOOLEAN
      do
         if not ace.boost then
            Result := assertion_list.use_current(type)
         end
      end

   pretty (indent_level: INTEGER)
      do
         if assertion_list /= Void then
            assertion_list.pretty_as_check_compound(indent_level, Current)
         end
      end

   accept (visitor: CHECK_COMPOUND_VISITOR)
      do
         visitor.visit_check_compound(Current)
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         if assertion_list /= Void then
            dummy := assertion_list.collect(type)
         end
      end

   adapt_for (type: TYPE): like Current
      do
         if must_be_generated(type) then
            Result := current_or_twin_init(assertion_list.adapt_for(type))
         else
            Result := Current
         end
      end

feature {CHECK_COMPOUND}
   init (al: like assertion_list)
      do
         assertion_list := al
      ensure
         assertion_list = al
      end

feature {CHECK_COMPOUND_VISITOR}
   assertion_list: ASSERTION_LIST
         -- (May be Void when there is only a comment after a "check" keyword.)

   must_be_generated (type: TYPE): BOOLEAN
      do
         if assertion_list /= Void then
            Result := type.class_text.all_check
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         al: like assertion_list
      do
         if must_be_generated(type) then
            if assertion_list /= Void then
               al ::= assertion_list.inline_dynamic_dispatch(code_accumulator, type)
            end
            code_accumulator.current_context.add_last(current_or_twin_init(al))
         end
      end

feature {}
   make (sp: like start_position; hc: COMMENT; l: FAST_ARRAY[ASSERTION])
      require
         not sp.is_unknown
      do
         if hc /= Void or else l /= Void then
            create assertion_list.make(sp, hc, l)
         end
      end

   current_or_twin_init (al: like assertion_list): like Current
      do
         if assertion_list = al then
            Result := Current
         else
            Result := twin
            Result.init(al)
         end
      end

end -- class CHECK_COMPOUND
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
