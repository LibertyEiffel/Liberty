-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NULL_POINTER
   --
   -- Used to represent null POINTER or null NATIVE_ARRAY.
   --

inherit
   NON_WRITTEN_EXPRESSION

create {ANY}
   make

feature {ANY}
   start_position: POSITION

   type_mark: TYPE_MARK

   is_writable: BOOLEAN is False

   is_static: BOOLEAN is True

   is_result: BOOLEAN is False

   use_current (type: TYPE): BOOLEAN is
      do
      end

   collect (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   declaration_type: TYPE is
      once
         Result := smart_eiffel.type_pointer
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
      end

   adapt_for (type: TYPE): like Current is
      do
         Result := Current
      end

   safety_check (type: TYPE) is
      do
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         -- This is not Void:
         Result := resolve_in(type)
      end

   simplify (type: TYPE): EXPRESSION is
      do
         Result := Current
      end

   accept (visitor: NULL_POINTER_VISITOR) is
      do
         visitor.visit_null_pointer(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (sp: like start_position; tm: like type_mark) is
      require
         not sp.is_unknown
         tm.is_static
         tm.is_pointer or else tm.is_native_array
      do
         start_position := sp
         type_mark := tm
      ensure
         start_position = sp
         type_mark = tm
      end

invariant
   type_mark.is_static

   type_mark.is_pointer or else type_mark.is_native_array

end -- class NULL_POINTER
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
-- Copyright(C) 2011-2014: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
