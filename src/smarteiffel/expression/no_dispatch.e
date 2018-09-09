-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NO_DISPATCH
   --
   -- Used to wrap a `side_effect_free' EXPRESSION for which there is no need for dynamic dispatch.
   -- As an example, an expression of type COLLECTION[FOO] can be wrapped into a NO_DISPATCH
   -- when there is only one live subtype, FAST_ARRAY[FOO].
   -- (See also IMPLICIT_CAST.)
   --

inherit
   NON_WRITTEN_EXPRESSION

create {ANY}
   make

feature {ANY}
   side_effect_free_expression: EXPRESSION
         -- The wrapped one.

   dynamic_type: TYPE
         -- Unique possible one for the `side_effect_free_expression'.

   start_position: POSITION
      do
         Result := side_effect_free_expression.start_position
      end

   is_writable: BOOLEAN
      do
         Result := side_effect_free_expression.is_writable
      end

   is_static: BOOLEAN False

   is_result: BOOLEAN
      do
         Result := side_effect_free_expression.is_result
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := dynamic_type
      end

   declaration_type: TYPE
      do
         Result := dynamic_type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         dummy := side_effect_free_expression.collect(type)
         Result := dynamic_type
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := side_effect_free_expression.use_current(type)
      end

   adapt_for (type: TYPE): like Current
      local
         sefe: like side_effect_free_expression
      do
         sefe := side_effect_free_expression.adapt_for(type)
         if sefe = side_effect_free_expression then
            Result := Current
         else
            Result := twin
            Result.set_side_effect_free_expression(sefe)
         end
      end

   safety_check (type: TYPE)
      do
         side_effect_free_expression.safety_check(type)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
         check
            side_effect_free_expression.side_effect_free(type)
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := dynamic_type
      end

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

   accept (visitor: NO_DISPATCH_VISITOR)
      do
         visitor.visit_no_dispatch(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {NO_DISPATCH}
   set_side_effect_free_expression(sefe: like side_effect_free_expression)
      require
         sefe /= Void
      do
         side_effect_free_expression := sefe
      ensure
         side_effect_free_expression = sefe
      end

feature {}
   make (type: TYPE; sefe: like side_effect_free_expression; dt: like dynamic_type)
      require
         ace.boost or else sefe.side_effect_free(type)
         dt.can_be_assigned_to(sefe.resolve_in(type))
      do
         dynamic_type := dt
         side_effect_free_expression := sefe
      ensure
         dynamic_type = dt
         side_effect_free_expression = sefe
      end

invariant
   dynamic_type.is_reference

   side_effect_free_expression /= Void

end -- class NO_DISPATCH
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
