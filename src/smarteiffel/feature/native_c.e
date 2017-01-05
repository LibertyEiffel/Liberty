-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_C
   --
   -- For the external "C ..." definition.
   --

inherit
   NATIVE

create {ANY}
   make

feature {ANY}
   accept (visitor: NATIVE_C_VISITOR)
      do
         visitor.visit_native_c(Current)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN
      do
         -- Without assertion, an external routine uses only its arguments.
         -- Note: assertion of the corresponding `er' may use `Current' and the check is done at
         -- the EXTERNAL_ROUTINE level.
      end

feature {EXTERNAL_ROUTINE}
   collect (t: TYPE; external_routine: EXTERNAL_ROUTINE)
      do
         notify_external_assignments(t, external_routine)
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE)
      do
         not_yet_implemented
      end

feature {NATIVE_C_VISITOR}
   parsing_done, need_prototype, prototype_dumped: BOOLEAN

   macro: BOOLEAN
         -- Is the "macro" keyword used?

   struct: STRING
         -- Non Void when the "struct" keyword is used. The value is then the
         -- appropriate C cast to access the corresponding C struct.

   access: STRING
         -- Non Void if we have to access this `struct' name field.

   type: STRING
         -- Non Void if the type is indicated.

   access_mode: INTEGER
         -- Either `set_access', `get_access' or `getset_access'

   set_access, get_access, getset_access: INTEGER unique

   signature: FAST_ARRAY[STRING]
         -- Non Void when some external `signature' is used.

   c_inline: BOOLEAN
         -- When the C inline is used.

feature {ANY}
   parse_external_tag
      local
         file_name: STRING
      do
         if not parsing_done then
            parsing_done := True
            from
               need_prototype := True
               mini_buffer.start_with(external_tag)
               mini_buffer.next
               mini_buffer.skip_separators
            until
               mini_buffer.is_off
            loop
               if mini_buffer.a_keyword(once "macro") then
                  macro := True
                  need_prototype := False
               elseif mini_buffer.a_keyword(once "struct") then
                  need_prototype := False
                  struct := mini_buffer.a_type_cast
                  if mini_buffer.a_keyword(once "set") then
                     access := mini_buffer.a_field_or_variable_name
                     access_mode := set_access
                  elseif mini_buffer.a_keyword(once "get") then
                     access := mini_buffer.a_field_or_variable_name
                     access_mode := get_access
                  elseif mini_buffer.a_keyword(once "access") then
                     access := mini_buffer.a_field_or_variable_name
                     access_mode := getset_access
                  else
                     bad_external("%"set%", %"get%", or %"access%" keyword expected.")
                  end
               elseif mini_buffer.a_keyword(once "type") then
                  type := mini_buffer.a_field_or_variable_name
               elseif mini_buffer.a_keyword(once "use") then
               elseif mini_buffer.a_keyword(once "inline") then
                  c_inline := True
                  need_prototype := False
               elseif mini_buffer.a_keyword(once "signature") then
                  signature := mini_buffer.a_signature
               elseif mini_buffer.item = '(' then
                  signature := mini_buffer.a_signature
               else
                  inspect
                     mini_buffer.item
                  when ',', '|' then
                     mini_buffer.next
                     mini_buffer.skip_separators
                  else
                     file_name := mini_buffer.a_include
                     need_prototype := False
                     cpp.include_register(start_position, file_name)
                  end
               end
            end
         end
      end

   bad_external (msg: STRING)
      do
         error_handler.add_position(start_position)
         error_handler.append(msg)
         error_handler.print_as_fatal_error
      end

end -- class NATIVE_C
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
