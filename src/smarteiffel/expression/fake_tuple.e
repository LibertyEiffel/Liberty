-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FAKE_TUPLE
   --
   -- Pseudo expression used to avoid creation of TUPLEs while launching agents.
   -- Also important to check arguments passing more strictly.
   --

inherit
   EXPRESSION

create {EFFECTIVE_ARG_LIST}
   make

feature {ANY}
   is_void: BOOLEAN False

   is_current, is_implicit_current: BOOLEAN False

   precedence: INTEGER 2

   is_static: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   extra_bracket_flag: BOOLEAN False

   start_position: POSITION

   debug_info: STRING

   specialize_in (type: TYPE): like Current
      local
         i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
         Result := Current
         if list /= Void then
            from
               i := list.lower
            until
               e1 /= e2 or else i > list.upper
            loop
               e1 := list.item(i)
               e2 := e1.specialize_in(type)
               i := i + 1
            end
            if e1 = e2 then
               check Result = Current end
            else
               from
                  Result := twin
                  l := list.twin
                  Result.set_list(l)
                  l.put(e2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(l.item(i).specialize_in(type), i)
                  i := i + 1
               end
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
         Result := Current
         if list /= Void then
            from
               i := list.lower
            until
               e1 /= e2 or else i > list.upper
            loop
               e1 := list.item(i)
               e2 := e1.specialize_thru(parent_type, parent_edge, new_type)
               i := i + 1
            end
            if e1 = e2 then
               check Result = Current end
            else
               from
                  Result := twin
                  l := list.twin
                  Result.set_list(l)
                  l.put(e2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(l.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
         Result := Current
         if list /= Void then
            from
               i := list.lower
            until
               e1 /= e2 or else i > list.upper
            loop
               e1 := list.item(i)
               e2 := e1.specialize_and_check(type)
               i := i + 1
            end
            if e1 = e2 then
               check Result = Current end
            else
               from
                  Result := twin
                  l := list.twin
                  Result.set_list(l)
                  l.put(e2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(l.item(i).specialize_and_check(type), i)
                  i := i + 1
               end
            end
         end
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := True
         if list /= Void then
            from
               i := list.lower
            until
               not Result or else i > list.upper
            loop
               Result := list.item(i).has_been_specialized
               i := i + 1
            end
         end
      end

   resolve_in (type: TYPE): TYPE
      do
         sedb_breakpoint
         check
            False
            -- Because Void can be a valid item in `list,' and because Void has no type,
            -- one must not collect `Current' entirely. Each item must be collected separately.
         end
         error_handler.add_position(start_position)
         error_handler.append("FAKE_TUPLE.resolve_in called")
         error_handler.print_as_internal_error
      end

   collect (type: TYPE): TYPE
      do
         sedb_breakpoint
         check
            False
            -- Because Void can be a valid item in `list,' and because Void has no type,
            -- one must not collect `Current' entirely. Each item must be collected separately.
         end
         error_handler.add_position(start_position)
         error_handler.append("FAKE_TUPLE.collect called")
         error_handler.print_as_internal_error
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
      end

   adapt_for (type: TYPE): like Current
      local
         i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
         Result := Current
         if list /= Void then
            from
               i := list.lower
            until
               e1 /= e2 or else i > list.upper
            loop
               e1 := list.item(i)
               e2 := e1.adapt_for(type)
               i := i + 1
            end
            if e1 = e2 then
               check Result = Current end
            else
               from
                  Result := twin
                  l := list.twin
                  Result.set_list(l)
                  l.put(e2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(l.item(i).adapt_for(type), i)
                  i := i + 1
               end
            end
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
      end

   simplify (type: TYPE): FAKE_TUPLE
      local
         i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
         Result := Current
         if list /= Void then
            from
               i := list.lower
            until
               e1 /= e2 or else i > list.upper
            loop
               e1 := list.item(i)
               e2 := e1.simplify(type)
               i := i + 1
            end
            if e1 = e2 then
               check Result = Current end
            else
               from
                  Result := twin
                  l := list.twin
                  Result.set_list(l)
                  l.put(e2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(l.item(i).simplify(type), i)
                  i := i + 1
               end
            end
         end
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               list.item(i).safety_check(type)
               i := i + 1
            end
         end
      end

   declaration_type: TYPE
      do
         Result := written_declaration_type_mark.type
      end

   written_declaration_type_mark: TYPE_MARK
      local
         i: INTEGER; gl: ARRAY[TYPE_MARK]
      do
         -- (Yes, it is leaky, but it is not called very often at all.)
         if list = Void then
            create {EMPTY_TUPLE_TYPE_MARK} Result.make(start_position)
         else
            from
               create gl.make(1, list.count)
               i := list.lower
            until
               i > list.upper
            loop
               Result := list.item(i).declaration_type.canonical_type_mark
               gl.put(Result, i + 1)
               i := i + 1
            end
            create {NON_EMPTY_TUPLE_TYPE_MARK} Result.make(start_position, gl)
         end
      end

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if list /= Void then
            from
               i := list.lower
            until
               Result or else i > list.upper
            loop
               Result := list.item(i).use_current(type)
               i := i + 1
            end
         end
      end

   pretty (indent_level: INTEGER)
      do
         check -- No FAKE_TUPLE created during `pretty'.
            False
         end
      end

   pretty_target (indent_level: INTEGER)
      do
         check -- No FAKE_TUPLE created during `pretty'.
            False
         end
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         check -- No FAKE_TUPLE created during `pretty'.
            False
         end
      end

   short (type: TYPE)
      local
         i: INTEGER
      do
         short_printer.hook_or(once "open_sb",once "[")
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               if i > list.lower then
                  short_printer.hook_or(once "ma_sep", once ",")
               end
               list.item(i).short(type)
               i := i + 1
            end
         end
         short_printer.hook_or(once "close_sb",once "]")
      end

   short_target (type: TYPE)
      do
         short_target(type)
      end

   accept (visitor: FAKE_TUPLE_VISITOR)
      do
         visitor.visit_fake_tuple(Current)
      end

   count: INTEGER
      do
         if list /= Void then
            Result := list.count
         end
      end

   expression (i: INTEGER): EXPRESSION
      require
         i.in_range(1, count)
      do
         Result := list.item(i - 1)
      end

feature {AGENT_LAUNCHER}
   implicit_cast (type: TYPE; open: ARRAY[TYPE]): like Current
      local
         i, j: INTEGER; e1, e2: EXPRESSION; l: like list
      do
         if list = Void then
            Result := Current
         else
            from
               j := open.lower
               i := list.lower
            until
               e1 /= e2 or else i > list.upper
            loop
               e1 := list.item(i)
               if e1.is_void then
                  e2 := e1
               else
                  e2 := assignment_handler.implicit_cast(e1, e1.resolve_in(type), open.item(j))
               end
               i := i + 1
               j := j + 1
            end
            if e1 = e2 then
               Result := Current
            else
               from
                  Result := twin
                  l := list.twin
                  Result.set_list(l)
                  l.put(e2, i - 1)
               until
                  i > l.upper
               loop
                  e2 := l.item(i)
                  e2 := assignment_handler.implicit_cast(e2, e2.resolve_in(type), open.item(j))
                  l.put(e2, i)
                  i := i + 1
                  j := j + 1
               end
            end
         end
      end

feature {FAKE_TUPLE}
   set_list (l: like list)
      require
         l /= Void
      do
         list := l
      ensure
         list = l
      end

feature {FAKE_TUPLE_VISITOR}
   list: FAST_ARRAY[EXPRESSION]

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         l: like list; ft: like Current
      do
         if list /= Void then
            l := inline_dynamic_dispatch_of(code_accumulator, type, list)
         end
         if l = list then
            code_accumulator.current_context.add_last(Current)
         else
            ft := twin
            ft.set_list(l)
            code_accumulator.current_context.add_last(ft)
         end
      end

feature {}
   make (mt: MANIFEST_TUPLE)
      require
         mt /= Void
      local
         i: INTEGER; eal: EFFECTIVE_ARG_LIST
      do
         start_position := mt.start_position
         eal := mt.effective_arg_list
         if eal /= Void then
            from
               i := 1
               create list.make(eal.count)
            until
               i > eal.count
            loop
               list.put(eal.expression(i), i - 1)
               i := i + 1
            end
         end
      end

invariant
   not start_position.is_unknown

end --  FAKE_TUPLE
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
