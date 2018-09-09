-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTERNAL_C_LOCAL
   --
   -- An internal extra variable introduced to generate C code. As an example, we need extra C local to handle,
   -- in some situations, user expanded types.
   --
   -- Note: unlike INTERNAL_LOCAL variables, INTERNAL_C_LOCAL variables are only useful for C code generation.
   --

insert
   GLOBALS

create {INTERNAL_C_LOCAL_LIST}
   make

feature {}
   eiffel_parser_stamp: INTEGER
         -- The 0 value indicates that `Current' is never used in the current `pending_c_function'. When
         -- greater than 0, the value is an `eiffel_parser_stamp'. The last case is -1 for an explicit `unlock'

   number: INTEGER
         -- The `number' of the "tmp" variable in C code (unique and immutable).

   doc_tag: STRING
         -- The `doc_tag' is used to make the C code more readable.

feature {INTERNAL_C_LOCAL, CODE_PRINTER}
   type: TYPE
         -- Corresponding `type' for this INTERNAL_C_LOCAL variable.

feature {ANY}
   append_in (buffer: STRING)
      require
         buffer /= Void
      do
         buffer.append(once "tmp")
         number.append_in(buffer)
         buffer.append(once "/*")
         buffer.append(doc_tag)
         buffer.append(once "*/")
      end

   unlock
      require
         eiffel_parser_stamp > 0
      do
         cpp.pending_c_function_body.append(once "/*tmp")
         number.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".unlock*/%N")
         eiffel_parser_stamp := -1
         doc_tag := Void
      ensure
         eiffel_parser_stamp = -1
      end

feature {INTERNAL_C_LOCAL_LIST}
   declaration_dump (buffer: STRING): BOOLEAN
      do
         if eiffel_parser_stamp = 0 then
            -- No need to consider the remainder.
            Result := True
         else
            c_type_in(buffer)
            buffer.append(once " tmp")
            number.append_in(buffer)
            buffer.append(once ";%N")
            -- To prepare the next `pending_c_function'.
            eiffel_parser_stamp := 0
            type := Void
            doc_tag := Void
         end
      end

   c_type_in (buffer: STRING)
      do
         if type.is_expanded then
            buffer.append(cpp.argument_type.for(type.canonical_type_mark))
         else
            buffer.append(once "T0*")
         end
      end

   can_be_recycle_with_type (t: like type): BOOLEAN
      require
         type /= Void
         t /= Void
      do
         if type = t then
            Result := True
         elseif type.is_reference then
            Result := t.is_reference
         end
      end

   lock_local (stamps_stack: FAST_ARRAY[INTEGER]; t: like type; dt: like doc_tag): like Current
      require
         not stamps_stack.is_empty
         t /= Void
         dt /= Void
      do
         if eiffel_parser_stamp = 0 then
            -- `Current' has never been used inside this `pending_c_function'.
            Result := Current
            type := t
            doc_tag := dt
            eiffel_parser_stamp := stamps_stack.last
         elseif (eiffel_parser_stamp < 0) and then can_be_recycle_with_type(t) then
            -- `Current' got an explicit `unlock'.
            cpp.pending_c_function_body.append(once "/*reusing tmp")
            number.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*/")
            Result := Current
            type := t
            doc_tag := dt
            eiffel_parser_stamp := stamps_stack.last
         elseif stamps_stack.fast_has(eiffel_parser_stamp) then
            -- `Current' is still active and then cannot be recycled.
         elseif can_be_recycle_with_type(t) then
            cpp.pending_c_function_body.append(once "/*auto-unlock tmp")
            number.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*/")
            Result := Current
            type := t
            doc_tag := dt
            eiffel_parser_stamp := stamps_stack.last
         else
            -- Cannot recycle because the `type' does not match.
         end
      end

feature {}
   make (eps: like eiffel_parser_stamp; t: like type; dt: like doc_tag)
      require
         eps > 0
         t /= Void
         dt /= Void
      do
         eiffel_parser_stamp := eps
         number := counter.item
         counter.next
         type := t
         doc_tag := dt
      ensure
         eiffel_parser_stamp = eps
         type = t
         doc_tag = dt
      end

feature {}
   counter: COUNTER
      once
         create Result
      end

end -- class INTERNAL_C_LOCAL
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
