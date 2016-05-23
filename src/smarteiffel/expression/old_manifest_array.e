-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class OLD_MANIFEST_ARRAY
   --
   -- The old (now obsolete) manifest array notation:
   --                                                    << foo, bar >>
   --
   -- is still accepted when the type of elements can be computed with no ambiguity.
   -- Expression OLD_MANIFEST_ARRAY are internally replaced with  the canonical corresponding
   -- canonical MANIFEST_GENERIC.
   --
inherit
   EXPRESSION

create {EIFFEL_PARSER}
   make

feature {ANY}
   start_position: POSITION
         -- Of first character of the first < character.

   list: FAST_ARRAY[EXPRESSION]

   is_void: BOOLEAN False

   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_writable: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_result: BOOLEAN False

   extra_bracket_flag: BOOLEAN True

   precedence: INTEGER 2

   is_static: BOOLEAN False

   specialize_in (type: TYPE): like Current
      local
         i: INTEGER; exp1, exp2: EXPRESSION; l: like list
      do
         from
            i := list.lower
         until
            exp1 /= exp2 or else i > list.upper
         loop
            exp1 := list.item(i)
            exp2 := exp1.specialize_in(type)
            i := i + 1
         end
         if exp1 = exp2 then
            Result := Current
         else
            from
               l := list.twin
               Result := twin
               Result.set_list(l)
               l.put(exp2, i - 1)
            until
               i > l.upper
            loop
               l.put(list.item(i).specialize_in(type), i)
               i := i + 1
            end
         end
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         Result := True
         from
            i := list.lower
         until
            not Result or else i > list.upper
         loop
            Result := list.item(i).has_been_specialized
            i := i + 1
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         i: INTEGER; exp1, exp2: EXPRESSION; l: like list
      do
         from
            i := list.lower
         until
            exp1 /= exp2 or else i > list.upper
         loop
            exp1 := list.item(i)
            exp2 := exp1.specialize_thru(parent_type, parent_edge, new_type)
            i := i + 1
         end
         if exp1 = exp2 then
            Result := Current
         else
            from
               l := list.twin
               Result := twin
               Result.set_list(l)
               l.put(exp2, i - 1)
            until
               i > l.upper
            loop
               l.put(list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
               i := i + 1
            end
         end
      end

   specialize_and_check (type: TYPE): MANIFEST_GENERIC
         -- Transformation into the canonical form.
      local
         i: INTEGER; exp1, exp2: EXPRESSION; l: like list
         array_type_mark: ARRAY_TYPE_MARK; items_type_mark: TYPE_MARK
         optional_list: FAST_ARRAY[EXPRESSION]; unknown_position: POSITION
         void_expression: E_VOID; void_type: TYPE
      do
         -- First applying `specialize_and_check' for all items of the `list':
         from
            i := list.lower
         until
            exp1 /= exp2 or else i > list.upper
         loop
            exp1 := list.item(i)
            exp2 := exp1.specialize_and_check(type)
            i := i + 1
         end
         if exp1 = exp2 then
            l := list
         else
            from
               l := list.twin
               l.put(exp2, i - 1)
            until
               i > l.upper
            loop
               l.put(list.item(i).specialize_and_check(type), i)
               i := i + 1
            end
         end
         -- Now computing `items_type_mark':
         from
            type_set_buffer.clear_count
            i := l.lower
         until
            i > l.upper
         loop
            exp1 := l.item(i)
            if exp1.is_void then
               void_expression ::= exp1
            else
               type_set_buffer.add(exp1.resolve_in(type))
            end
            i := i + 1
         end
         if void_expression /= Void and then type_set_buffer.count = 0 then
            void_type := void_expression.resolve_in(type)
            error_handler.add_position(start_position)
            error_handler.append(once "Cannot create an ARRAY with only `Void' items.")
            error_handler.print_as_fatal_error
         end
         if type_set_buffer.count = 0 then
            items_type_mark := smart_eiffel.type_any.canonical_type_mark
         elseif type_set_buffer.count = 1 then
            items_type_mark := type_set_buffer.item(1).canonical_type_mark
         else
            items_type_mark := smallest_ancestor_from_type_set_buffer
            if items_type_mark = Void then
               error_handler.add_position(start_position)
               error_handler.append(once "The old manifest ARRAY notation can only be used when the common %
                                    %type mark for all items of the manifest ARRAY exists, is not ambiguous %
                                    %and is easy to compute! By the way, it is not easy or possible to %
                                    %compute the most general type for the following set of types: {")
               from
                  i := type_set_buffer.lower
               until
                  i > type_set_buffer.upper
               loop
                  error_handler.append(type_set_buffer.item(i).name.to_string)
                  i := i + 1
                  if i <= type_set_buffer.upper then
                     error_handler.append(once ", ")
                  end
               end
               error_handler.append(once "}. See the next error message.")
               error_handler.print_as_error
               error_handler.add_position(start_position)
               error_handler.append(once "This obsolete manifest ARRAY creation is no longer supported. %
                                     %See our %"tutorial/manifest_notation.e%" %
                                     %in order to use the new notation.")
               error_handler.print_as_fatal_error
            end
         end
         check
            items_type_mark.is_static
         end
         -- Now building the canonical form:
         create array_type_mark.make(start_position, items_type_mark)
         create optional_list.with_capacity(1)
         optional_list.add_last(create {INTEGER_CONSTANT}.make(1, start_position))
         create Result.make(start_position, array_type_mark, optional_list, l, 0, unknown_position)
         Result.specialize_and_check_from_old_manifest_array(type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   safety_check (type: TYPE)
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   resolve_in (type: TYPE): TYPE
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   declaration_type: TYPE
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   written_declaration_type_mark: TYPE_MARK
      do
         check False end
      end

   collect (type: TYPE): TYPE
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   adapt_for (type: TYPE): like Current
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := False
      end

   accept (visitor: OLD_MANIFEST_ARRAY_VISITOR)
      do
         visitor.visit_old_manifest_array(Current)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   simplify (type: TYPE): like Current
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty (indent_level: INTEGER)
      local
         i: INTEGER
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "<<")
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).pretty(indent_level + 1)
            i := i + 1
            if i <= list.upper then
               pretty_printer.put_string(once ", ")
               if pretty_printer.column > pretty_printer.wrap_limit then
                  pretty_printer.set_indent_level(indent_level + 1)
               end
            end
         end
         pretty_printer.put_string(once ">>")
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   short (type: TYPE)
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

   short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

feature {OLD_MANIFEST_ARRAY}
   set_list (l: like list)
      do
         list := l
      end

feature {}
   make (sp: like start_position; l: like list)
      require
         not sp.is_unknown
         l /= Void implies not l.is_empty
      do
         start_position := sp
         if l = Void then
            error_handler.add_position(sp)
            error_handler.append(once "Empty manifest array not allowed. (If you really need to do it, just replace it %
                                 %with something like:%Ncreate {ARRAY[ANY]}.make(1, 0)")
            error_handler.print_as_fatal_error
         end
         list := l
      ensure
         start_position = sp
         list = l
      end

   type_set_buffer: HASHED_SET[TYPE]
      once
         create Result.make
      end

   smallest_ancestor_from_type_set_buffer: TYPE_MARK
      require
         type_set_buffer.count >= 2
      local
         i: INTEGER; type, type_2: TYPE; expanded_flag: BOOLEAN
      do
         -- First loop to handle the simple situation where one TYPE of `type_set_buffer'
         -- can hold all other types:
         from
            i := type_set_buffer.lower
         until
            i > type_set_buffer.upper
         loop
            type_2 := type_set_buffer.item(i)
            if type = Void then
               -- Let start with `type_2':
               type := type_2
            elseif type.can_be_assigned_to(type_2) then
               type := type_2
            elseif type_2.can_be_assigned_to(type) then
               -- We stick to `type'.
            else
               -- Not a simple situation.
               type := Void
               i := type_set_buffer.upper
            end
            i := i + 1
         end
         if type = Void then
            -- Not a simple situation, first looking for some expanded:
            from
               i := type_set_buffer.lower
            until
               expanded_flag or else i > type_set_buffer.upper
            loop
               expanded_flag := type_set_buffer.item(i).is_expanded
               i := i + 1
            end
            if not expanded_flag then
               -- Now trying to search for some TYPE with only one parent TYPE:
               from
                  i := type_set_buffer.lower
               until
                  type /= Void or else i > type_set_buffer.upper
               loop
                  type := type_set_buffer.item(i).has_only_one_conformant_parent
                  if type = Void then
                     i := i + 1
                  end
               end
               if type /= Void then
                  type_set_buffer.remove(type_set_buffer.item(i))
                  type_set_buffer.add(type)
                  type := Void
                  if type_set_buffer.count = 1 then
                     type := type_set_buffer.item(1)
                  else
                     Result := smallest_ancestor_from_type_set_buffer
                  end
               end
            end
         end
         if type /= Void then
            Result := type.canonical_type_mark
         end
      end

invariant

   list.count > 0

end -- class OLD_MANIFEST_ARRAY
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
