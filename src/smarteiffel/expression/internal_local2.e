-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTERNAL_LOCAL2
   --
   -- An object of this class holds a special local variable that is internally generated when simplifying some
   -- code. Such variables don't need to be initialized.
   --

inherit
   NON_WRITTEN_EXPRESSION
   TAGGED
      rename
         tag as tagged_tag
      end

create {INSPECT_STATEMENT, FUNCTION_CALL, MANIFEST_STRING_INSPECTOR, IFTHEN, EXTERNAL_PROCEDURE, ASSIGNMENT}
   make

feature {ANY}
   start_position: POSITION

   original_expression: EXPRESSION
         -- The original expression which is stored in `Current'.

   collect_flag: BOOLEAN
         -- Indicate that `original_expression' must be collected.

   is_result: BOOLEAN False

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   use_current (type: TYPE): BOOLEAN
      do
      end

   safety_check (type: TYPE)
      do
      end

   accept (visitor: INTERNAL_LOCAL2_VISITOR)
      do
         visitor.visit_internal_local2(Current)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         -- Could be better when `result_type' is a leaf.
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := original_expression.written_declaration_type_mark
      end

   is_writable: BOOLEAN True

   resolve_in (type: TYPE): TYPE
      do
         Result := original_expression.resolve_in(type)
      end

   declaration_type: TYPE
      do
         Result := original_expression.declaration_type
      end

   collect (type: TYPE): TYPE
      do
         if collect_flag then
            Result := original_expression.collect(type)
         else
            Result := original_expression.resolve_in(type)
         end
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   is_static: BOOLEAN False

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

feature {ASSIGNMENT}
   unlock
      do
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {INTERNAL_LOCAL2_VISITOR}
   tag: STRING

feature {ANY}
   hash_tag: FIXED_STRING
      local
         buffer: STRING
      do
         Result := hash_tag_memory
         if Result = Void then
            buffer := once ""
            buffer.copy(tag)
            buffer.extend('@')
            to_pointer.append_in(buffer)
            Result := buffer.intern
            hash_tag_memory := Result
         end
      end

feature {}
   make (sp: like start_position; oe: like original_expression; t: like tag; cf: like collect_flag)
      require
         not sp.is_unknown
         oe /= Void
      do
         start_position := sp
         original_expression := oe
         tag := t
         collect_flag := cf
      ensure
         start_position = sp
         original_expression = oe
         tag = t
         collect_flag = cf
      end

   hash_tag_memory: FIXED_STRING

invariant
   not start_position.is_unknown

   original_expression /= Void

end -- class INTERNAL_LOCAL2
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
