-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CREATE_WRITABLE
   --
   -- Used to wrap the writable entity of a CREATE_INSTRUCTION with an explicit creation `type'.
   -- The goal of this class is to be able to use directly the call specialize_* methods.
   --

inherit
   EXPRESSION

create {CREATE_INSTRUCTION}
   make, make_specialized

feature {CREATE_WRITABLE, CREATE_WRITABLE_VISITOR}
   writable: EXPRESSION
         -- The hidden wrapped `writable'.

feature {ANY}
   type_mark: TYPE_MARK
         -- The static type of the wrapped `writable'.

   is_current, is_implicit_current, is_manifest_string, is_void, is_static: BOOLEAN False

   start_position: POSITION
      do
         Result := writable.start_position
      end

   is_writable: BOOLEAN
      do
         Result := True
         check
            writable.is_writable
         end
      end

   is_result: BOOLEAN
      do
         Result := writable.is_result
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := writable.use_current(type)
      end

   declaration_type: TYPE

   written_declaration_type_mark: TYPE_MARK
      do
         Result := type_mark
      end

   specialize_in (new_type: TYPE): like Current
      local
         w: like writable
      do
         type_mark.specialize_in(new_type)
         if declaration_type = Void then
            declaration_type := type_mark.declaration_type.type
         end
         w := writable.specialize_in(new_type)
         if w = writable then
            Result := Current
         else
            Result := twin
            Result.set_writable(w)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         w: like writable; tm: like type_mark
      do
         w := writable.specialize_thru(parent_type, parent_edge, new_type)
         tm := type_mark.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(w, tm)
      end

   specialize_and_check (type: TYPE): like Current
      local
         w: like writable
      do
         w := writable.specialize_and_check(type)
         if w = writable then
            Result := Current
         else
            Result := twin
            Result.set_writable(w)
         end
         Result.validity_check(type)
      end

   has_been_specialized: BOOLEAN
      do
         Result := writable.has_been_specialized and then type_mark.has_been_specialized and then declaration_type /= Void
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := type_mark.resolve_in(type)
      end

   collect (type: TYPE): TYPE
      local
         writable_type: TYPE; left_live_type: LIVE_TYPE
      do
         writable_type := writable.collect(type)
         Result := type_mark.resolve_in(type)
         if writable_type.live_type = Void then
            -- It may be the time to actually collect the `left_side' LIVE_TYPE:
            if Result.live_type /= Void then
               -- It is the time to actually collect the corresponding LIVE_TYPE:
               -- (Done in EFFECTIVE_ARG_LIST_N, ASSIGNMENT_ATTEMPT, ASSIGNMENT and CREATE_WRITABLE.)
               left_live_type := smart_eiffel.collect_one_type(writable_type, False)
            end
         end
         assignment_handler.collect_normal(Result, writable_type)
      end

   adapt_for (type: TYPE): like Current
      local
         w: like writable
      do
         w := writable.adapt_for(type)
         if w = writable then
            Result := Current
         else
            Result := twin
            Result.set_writable(w)
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         check
            False
         end
      end

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

   precedence: INTEGER
      do
         Result := writable.precedence
      end

   safety_check (type: TYPE)
      do
         writable.safety_check(type)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := writable.side_effect_free(type)
      end

feature {ANY} -- For `pretty' and `short':
   extra_bracket_flag: BOOLEAN
      do
         Result := writable.extra_bracket_flag
      end

   pretty (indent_level: INTEGER)
      do
         writable.pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER)
      do
         writable.pretty_target(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         writable.bracketed_pretty(indent_level)
      end

   short (type: TYPE)
      do
         writable.short(type)
      end

   short_target (type: TYPE)
      do
         writable.short_target(type)
      end

   accept (visitor: CREATE_WRITABLE_VISITOR)
      do
         visitor.visit_create_writable(Current)
      end

feature {CREATE_WRITABLE}
   init (w: like writable; tm: like type_mark)
      do
         writable := w
         type_mark := tm
      ensure
         writable = w
         type_mark = tm
      end

   set_writable (w: like writable)
      do
         writable := w
      ensure
         writable = w
      end

   validity_check (type: TYPE)
      local
         writable_type, type_mark_type: TYPE
      do
         writable_type := writable.resolve_in(type)
         type_mark_type := type_mark.resolve_in(type)
         if not type_mark_type.can_be_assigned_to(writable_type) then
            error_handler.add_position(writable.start_position)
            error_handler.add_position(type_mark.start_position)
            error_handler.append(once "Cannot assign newly created ")
            error_handler.append(type_mark_type.name.to_string)
            error_handler.append(once " into ")
            error_handler.add_expression(writable)
            error_handler.append(once " which is of type ")
            error_handler.append(writable_type.name.to_string)
            if type.is_generic then
               error_handler.append(once " while building type ")
               error_handler.append(type.name.to_string)
            end
            error_handler.append(once ".")
            if not type_mark.is_static then
               error_handler.add_context_info(type.canonical_type_mark)
            end
            error_handler.print_as_fatal_error
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (tm: like type_mark; w: like writable)
      require
         tm /= Void
         w /= Void
      do
         type_mark := tm
         writable := w
      ensure
         type_mark = tm
         writable = w
      end

   make_specialized (tm: like type_mark; w: like writable)
      require
         tm /= Void
         w /= Void
      do
         type_mark := tm
         writable := w
         declaration_type := tm.declaration_type.type
      ensure
         type_mark = tm
         writable = w
         has_been_specialized
      end

   current_or_twin_init (w: like writable; tm: like type_mark): like Current
      require
         w /= Void
         tm /= Void
      do
         if w = writable and then tm = type_mark then
            Result := Current
         else
            Result := twin
            Result.init(w, tm)
         end
      ensure
         Result.writable = w
         Result.type_mark = tm
      end

invariant
   type_mark /= Void

   writable /= Void

end -- class CREATE_WRITABLE
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
