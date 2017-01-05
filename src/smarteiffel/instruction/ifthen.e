-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class IFTHEN
   --
   -- Used when we have an single if-then INSTRUCTION with no else part or when it is a component of
   -- an IFTHENELSE (see also IFTHENELSE).
   --

inherit
   INSTRUCTION

insert
   IF_SUPPORT

create {ANY}
   make

feature {ANY}
   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         dummy := expression.collect(type)
         if then_compound /= Void then
            dummy := then_compound.collect(type)
         end
      end

   simplify (type: TYPE): INSTRUCTION
      local
         bc: BOOLEAN_CONSTANT; e: like expression; tc: like then_compound
      do
         e := expression.simplify(type)
         bc ?= e
         if bc /= Void then
            smart_eiffel.magic_count_increment
            if bc.value then
               if then_compound /= Void then
                  Result := then_compound.simplify(type)
               end
            else
               -- The `then_compound' cannot be reached.
            end
         else
            if then_compound /= Void then
               tc := then_compound.simplify(type)
            end
            Result := current_or_twin_init(e, tc)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         e: like expression; tc: like then_compound
      do
         e := expression.adapt_for(type)
         if then_compound /= Void then
            tc := then_compound.adapt_for(type)
         end
         Result := current_or_twin_init(e, tc)
      end

   safety_check (type: TYPE)
      do
         expression.safety_check(type)
         if then_compound /= Void then
            then_compound.safety_check(type)
         end
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := expression.use_current(type)
         if not Result and then then_compound /= Void then
            Result := then_compound.use_current(type)
         end
      end

   pretty (indent_level: INTEGER)
      do
         pretty_(indent_level, once "if")
         pretty_end_if(indent_level)
      end

   specialize_in (type: TYPE): like Current
      local
         e: like expression; tc: like then_compound
      do
         e := expression.specialize_in(type)
         if then_compound /= Void then
            tc := then_compound.specialize_in(type)
         end
         Result := current_or_twin_init(e, tc)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         e: like expression; tc: like then_compound
      do
         e := expression.specialize_thru(parent_type, parent_edge, new_type)
         if then_compound /= Void then
            tc := then_compound.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(e, tc)
      end

   specialize_and_check (type: TYPE): like Current
      local
         e: like expression; tc: like then_compound
      do
         e := expression.specialize_and_check(type)
         if then_compound /= Void then
            tc := then_compound.specialize_and_check(type)
         end
         Result := current_or_twin_init(e, tc)
         Result.specialize_check_(type)
      end

   has_been_specialized: BOOLEAN
      do
         Result := expression.has_been_specialized
         if then_compound /= Void then
            Result := then_compound.has_been_specialized
         end
      end

   accept (visitor: IFTHEN_VISITOR)
      do
         visitor.visit_ifthen(Current)
      end

feature {IFTHEN}
   init (e: like expression; tc: like then_compound)
      require
         e /= Void
      do
         expression := e
         then_compound := tc
      ensure
         expression = e
         then_compound = tc
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         e: like expression; tc: like then_compound; internal_local2: INTERNAL_LOCAL2
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         e := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if then_compound /= Void then
            code_accumulator.open_new_context
            then_compound.inline_dynamic_dispatch_(code_accumulator, type)
            tc := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
         end
         if tc = Void then
            -- Note that we can do the following simplification because we are sure that `Current'
            -- not a member of some "elseif" list (see `inline_dynamic_dispatch_' of IF_THEN_ELSE).
            if e.side_effect_free(type) then
               -- Well, nothing is always better.
            else
               create internal_local2.make(start_position, e, once "ifthen (empty)", True)
               code_accumulator.current_context.add_last(create {ASSIGNMENT}.inline_make(internal_local2, e))
            end
         else
            code_accumulator.current_context.add_last(current_or_twin_init(e, tc))
         end
      end

feature {}
   current_or_twin_init (e: like expression; tc: like then_compound): like Current
      do
         if e = expression and then tc = then_compound then
            Result := Current
         else
            Result := twin
            Result.init(e, tc)
         end
      end

   make (sp: like start_position; e: like expression; tc: like then_compound)
      require
         not sp.is_unknown
         e /= Void
      do
         start_position := sp
         expression := e
         then_compound := tc
      ensure
         start_position = sp
         expression = e
         then_compound = tc
      end

end -- class IFTHEN
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
