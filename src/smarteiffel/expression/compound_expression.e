-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class COMPOUND_EXPRESSION
   --
   -- An ordered sequence of INSTRUCTIONs followed by one EXPRESSION (natural indexing from 1 to
   -- `count').
   --

inherit
   NON_WRITTEN_EXPRESSION
      undefine out_in_tagged_out_memory
      end

insert
   TRAVERSABLE[CODE]

create {ANY}
   from_list

create {COMPOUND_EXPRESSION}
   set_list

feature {ANY}
   start_position: POSITION
      do
         Result := list.last.start_position
      end

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   resolve_in (type: TYPE): TYPE
      do
         Result := list.last.to_expression.resolve_in(type)
      end

   declaration_type: TYPE
      do
         check
            False -- Because they are created late.
         end
      end

   written_declaration_type_mark: TYPE_MARK
      do
         check False end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := list.last.to_expression.non_void_no_dispatch_type(type)
      end

   safety_check (type: TYPE)
      do
         not_yet_implemented
      end

   simplify (type: TYPE): EXPRESSION
      local
         l: like list; code1, code2: CODE; i, i2: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper or else code1 /= code2
         loop
            code1 := list.item(i)
            code2 := code1.simplify(type)
            i := i + 1
         end
         if code1 = code2 then
            -- Nothing done by all `simplify' calls:
            Result := Current
         else
            create l.with_capacity(list.count)
            from
               i2 := list.lower
            until
               i2 = i - 1
            loop
               simplify_add(l, list.item(i2))
               i2 := i2 + 1
            end
            -- Add the one at i - 1:
            simplify_add(l, code2)
            -- The remainder of the `list':
            from
            until
               i > list.upper
            loop
               simplify_add(l, list.item(i).simplify(type))
               i := i + 1
            end
            if l.count >= 2 then
               create {COMPOUND_EXPRESSION} Result.set_list(l)
            else
               Result := l.first.to_expression
            end
         end
      end

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            Result or else i > list.upper
         loop
            Result := list.item(i).use_current(type)
            i := i + 1
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := list.lower
            Result := True
         until
            not Result or else i > list.upper
         loop
            Result := list.item(i).side_effect_free(type)
            i := i + 1
         end
      end

   collect (type: TYPE): TYPE
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            Result := list.item(i).collect(type)
            i := i + 1
         end
      end

   adapt_for (type: TYPE): like Current
      local
         l: like list; code1, code2: CODE; i: INTEGER
      do
         from
            i := list.lower
         until
            code1 /= code2 or else i > list.upper
         loop
            code1 := list.item(i)
            code2 := code1.adapt_for(type)
            i := i + 1
         end
         if code1 = code2 then
            Result := Current
         else
            Result := twin
            l := list.twin
            Result.set_list(l)
            from
               l.put(code2, i - 1)
            until
               i > l.upper
            loop
               l.put(l.item(i).adapt_for(type), i)
               i := i + 1
            end
         end
      end

   accept (visitor: COMPOUND_EXPRESSION_VISITOR)
      do
         visitor.visit_compound_expression(Current)
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   lower: INTEGER
      do
         Result := list.lower
      end

   upper: INTEGER
      do
         Result := list.upper
      end

   count: INTEGER
      do
         Result := list.count
      end

   is_empty: BOOLEAN
      do
         check
            False
         end
      end

   item (i: INTEGER): CODE
      do
         Result := list.item(i)
      end

   first: like item
      do
         Result := list.first
      end

   last: like item
      do
         Result := list.last
      end

feature {}
   new_iterator: ITERATOR[INSTRUCTION]
      do
         check
            False -- Just use the usual pattern instead please.
         end
      end

feature {COMPOUND, COMPOUND_EXPRESSION_VISITOR}
   list: FAST_ARRAY[CODE]
         -- Contains at least 2 items (just because this is the canonical form to be enforced).

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).inline_dynamic_dispatch_(code_accumulator, type)
            i := i + 1
         end
      end

feature {COMPOUND_EXPRESSION}
   set_list (l: like list)
      require
         l.count >= 2
      do
         list := l
      ensure
         list = l
      end

feature {}
   from_list (l: FAST_ARRAY[CODE])
      require
         l.count >= 2
      local
         i: INTEGER
      do
         from
            create list.with_capacity(l.count)
            i := l.lower
         until
            i = l.upper
         loop
            list.add_last(l.item(i).to_instruction)
            i := i + 1
         end
         list.add_last(l.item(i).to_expression)
      ensure
         list /= l
         list.count = l.count
      end

   canonical_form (l: like list): BOOLEAN
      require
         canonical_form(l)
      local
         i: INTEGER
      do
         Result := True
         from
            i := l.lower
         until
            not Result or else (i = l.upper)
         loop
            Result := l.item(i).is_not_a_compound
            i := i + 1
         end
         Result := Result and then {EXPRESSION} ?:= l.item(i)
      ensure
         assertion_check_only: Result
      end

   simplify_add (l: like list; new_item: CODE)
      require
         l /= Void
         new_item /= Void
      local
         i: INTEGER; compound: COMPOUND; compound_expression: COMPOUND_EXPRESSION
      do
         if {COMPOUND} ?:= new_item then
            from
               compound ::= new_item
               i := compound.lower
            until
               i > compound.upper
            loop
               simplify_add(l, compound.item(i))
               i := i + 1
            end
         elseif {COMPOUND_EXPRESSION} ?:= new_item then
            from
               compound_expression ::= new_item
               i := compound_expression.lower
            until
               i > compound_expression.upper
            loop
               simplify_add(l, compound_expression.item(i))
               i := i + 1
            end
         else
            l.add_last(new_item)
         end
      ensure
         l.count > old l.count
      end

invariant
   list.count >= 2

   canonical_form(list)

end -- class COMPOUND_EXPRESSION
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
