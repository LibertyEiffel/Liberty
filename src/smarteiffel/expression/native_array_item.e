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
   make

feature {ANY}
   index: EXPRESSION
         -- The array index

   is_writable: BOOLEAN is True

   is_static: BOOLEAN is False

   is_result: BOOLEAN is False

   use_current (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   declaration_type: TYPE

   resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   adapt_for (type: TYPE): like Current is
      local
         i: like index; dt: like declaration_type
      do
         i := index.adapt_for(type)
         dt := type.generic_list.first
         if i = index and then dt = declaration_type then
            Result := Current
         else
            create Result.make(start_position, i, declaration_type)
         end
      end

   safety_check (type: TYPE) is
      do
         index.safety_check(type)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): like Current is
      local
         i: like index; dt: like declaration_type
      do
         i := index.simplify(type)
         dt := type.generic_list.first
         if i = index and then dt = declaration_type then
            Result := Current
         else
            create Result.make(start_position, i, dt)
         end
      end

   start_position: POSITION

   collect (type: TYPE): TYPE is
      do
         Result := index.collect(type)
         Result := declaration_type
      end

   accept (visitor: NATIVE_ARRAY_ITEM_VISITOR) is
      do
         visitor.visit_native_array_item(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (a_position: like start_position; a_index: like index; a_declaration_type: like declaration_type) is
      do
         start_position := a_position
         index := a_index
         declaration_type := a_declaration_type
      ensure
         start_position = a_position
         index = a_index
         declaration_type = a_declaration_type
      end

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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
