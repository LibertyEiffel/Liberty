-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_ARRAY_ITEM
   --
   -- For the special array item access (only in generated code)
   --

inherit
   NON_WRITTEN_EXPRESSION

create {ANY}
   make, make_array

create {NATIVE_ARRAY_ITEM}
   make_

feature {ANY}
   array: EXPRESSION
         -- The array to access

   index: EXPRESSION
         -- The array index

   is_writable: BOOLEAN True

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   use_current (type: TYPE): BOOLEAN
      do
         Result := array = Void
      end

   declaration_type: TYPE

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   resolve_in (type: TYPE): TYPE
      do
         if array = Void then
            Result := declaration_type
         else
            Result := array.resolve_in(type).generic_list.first
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         if array = Void then
            Result := True
         else
            Result := array.side_effect_free(type)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         a: like array; i: like index; dt: like declaration_type
      do
         if array /= Void then
            a := array.adapt_for(type)
         else
            dt := type.generic_list.first
         end
         i := index.adapt_for(type)
         if a = array and then i = index and then dt = declaration_type then
            Result := Current
         else
            create Result.make_(start_position, a, i, declaration_type)
         end
      end

   safety_check (type: TYPE)
      do
         index.safety_check(type)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): like Current
      local
         a: like array; i: like index; dt: like declaration_type
      do
         if array /= Void then
            a := array.simplify(type)
         else
            dt := type.generic_list.first
         end
         i := index.simplify(type)
         if a = array and then i = index and then dt = declaration_type then
            Result := Current
         else
            create Result.make_(start_position, a, i, dt)
         end
      end

   start_position: POSITION

   collect (type: TYPE): TYPE
      do
         Result := index.collect(type)
         Result := resolve_in(type)
      end

   accept (visitor: NATIVE_ARRAY_ITEM_VISITOR)
      do
         visitor.visit_native_array_item(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make_ (a_position: like start_position; a_array: like array; a_index: like index; a_declaration_type: like declaration_type)
      do
         start_position := a_position
         array := a_array
         index := a_index
         declaration_type := a_declaration_type
      ensure
         start_position = a_position
         array = a_array
         index = a_index
         declaration_type = a_declaration_type
      end

   make (a_position: like start_position; a_index: like index; a_declaration_type: like declaration_type)
      do
         make_(a_position, Void, a_index, a_declaration_type)
      end

   make_array (a_position: like start_position; a_array: like array; a_index: like index)
      do
         make_(a_position, a_array, a_index, Void)
      end

invariant
   (array = Void) /= (declaration_type = Void)

end -- class NATIVE_ARRAY_ITEM
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
