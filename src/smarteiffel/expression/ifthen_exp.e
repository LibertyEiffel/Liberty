-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class IFTHEN_EXP
   --
   -- Used when it is a component of an IFTHENELSE_EXP (see also IFTHENELSE_EXP).
   --
   -- Note: There cannot be any if-then expression without an else part.
   --

inherit
   EXPRESSION

insert
   IF_SUPPORT_EXP

create {ANY}
   make

feature {ANY}
   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         dummy := expression.collect(type)
         Result := then_expression.collect(type)
      end

   simplify (type: TYPE): EXPRESSION
      local
         bc: BOOLEAN_CONSTANT; e: like expression; tc: like then_expression
      do
         e := expression.simplify(type)
         bc ?= e
         if bc /= Void then
            smart_eiffel.magic_count_increment
            if bc.value then
               if then_expression /= Void then
                  Result := then_expression.simplify(type)
               end
            else
               -- The `then_expression' cannot be reached.
            end
         else
            tc := then_expression.simplify(type)
            Result := current_or_twin_init(e, tc)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         e: like expression; tc: like then_expression
      do
         e := expression.adapt_for(type)
         tc := then_expression.adapt_for(type)
         Result := current_or_twin_init(e, tc)
      end

   safety_check (type: TYPE)
      do
         expression.safety_check(type)
         then_expression.safety_check(type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := expression.use_current(type)
            or else then_expression.use_current(type)
      end

   pretty (indent_level: INTEGER)
      do
         pretty_(indent_level, once "if")
         pretty_end_if(indent_level)
      end

   specialize_in (type: TYPE): like Current
      local
         e: like expression; tc: like then_expression
      do
         e := expression.specialize_in(type)
         tc := then_expression.specialize_in(type)
         Result := current_or_twin_init(e, tc)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         e: like expression; tc: like then_expression
      do
         e := expression.specialize_thru(parent_type, parent_edge, new_type)
         tc := then_expression.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(e, tc)
      end

   specialize_and_check (type: TYPE): like Current
      local
         e: like expression; tc: like then_expression
      do
         e := expression.specialize_and_check(type)
         tc := then_expression.specialize_and_check(type)
         Result := current_or_twin_init(e, tc)
         Result.specialize_check_(type)
      end

   has_been_specialized: BOOLEAN
      do
         Result := expression.has_been_specialized
         Result := then_expression.has_been_specialized
      end

   accept (visitor: IFTHEN_EXP_VISITOR)
      do
         visitor.visit_ifthen_exp(Current)
      end

   resolve_in (type: TYPE): TYPE
      do
         check False end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         check False end
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         check False end
      end

   pretty_target (indent_level: INTEGER)
      do
         check False end
      end

   declaration_type: TYPE
      do
         Result := then_expression.declaration_type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := then_expression.written_declaration_type_mark
      end

   short (type: TYPE)
      do
         check False end
      end

   short_target (type: TYPE)
      do
         check False end
      end

feature {IFTHEN_EXP}
   init (e: like expression; tc: like then_expression)
      require
         e /= Void
         tc /= Void
      do
         expression := e
         then_expression := tc
      ensure
         expression = e
         then_expression = tc
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         e: like expression; tc: like then_expression
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         e := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         then_expression.inline_dynamic_dispatch_(code_accumulator, type)
         tc := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         code_accumulator.current_context.add_last(current_or_twin_init(e, tc))
      end

feature {}
   current_or_twin_init (e: like expression; tc: like then_expression): like Current
      do
         if e = expression and then tc = then_expression then
            Result := Current
         else
            Result := twin
            Result.init(e, tc)
         end
      end

   make (sp: like start_position; e: like expression; tc: like then_expression)
      require
         not sp.is_unknown
         e /= Void
         tc /= Void
      do
         start_position := sp
         expression := e
         then_expression := tc
      ensure
         start_position = sp
         expression = e
         then_expression = tc
      end

end -- class IFTHEN_EXP
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
