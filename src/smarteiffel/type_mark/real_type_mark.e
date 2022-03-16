-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class REAL_TYPE_MARK
   --
   -- For the whole REAL_* family: REAL_32, REAL_64, REAL and REAL_80.
   --

inherit
   KERNEL_EXPANDED_TYPE_MARK
      redefine
         pretty_in, default_expression, resolve_in
      end

create {ANY}
   real_32, real_64, real, real_80, real_128, real_extended

feature {ANY}
   pretty_name: HASHED_STRING
         -- The one actually written in the source code (`as_real_32', `as_real_64', `as_real', `as_real_80',
         -- `as_real_128' or `as_real_extended').

   bit_count: INTEGER

   id: INTEGER
      do
         inspect
            bit_count
         when 32 then
            Result := 4
         when 64 then
            Result := 5
         else
            Result := 12
         end
      end

   written_name: HASHED_STRING
      do
         Result := class_text_name.hashed_name
      end

   pretty_in (buffer: STRING)
      do
         buffer.append(pretty_name.to_string)
      end

   type: TYPE
      do
         inspect
            bit_count
         when 32 then
            Result := smart_eiffel.type_real_32
         when 64 then
            Result := smart_eiffel.type_real_64
         else
            Result := smart_eiffel.type_real_extended
         end
      end

   resolve_in (new_type: TYPE): TYPE
      do
         Result := type
      end

   default_expression (sp: POSITION): EXPRESSION
      do
         create {REAL_CONSTANT} Result.make(sp, once "0.0", Current)
      end

   accept (visitor: REAL_TYPE_MARK_VISITOR)
      do
         visitor.visit_real_type_mark(Current)
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING
      do
         Result := class_text_name.hashed_name
      end

feature {TYPE}
   can_be_assigned_to (other: TYPE_MARK): BOOLEAN
      local
         real_type_mark: REAL_TYPE_MARK; integer_type_mark: INTEGER_TYPE_MARK
      do
         if other.is_real then
            real_type_mark ::= other
            Result := bit_count <= real_type_mark.bit_count
            if Result and then pretty_name = real_128_name then
               Result := real_type_mark.pretty_name /= real_80_name
            end
         elseif other.is_integer then
            integer_type_mark ::= other
            Result := bit_count < integer_type_mark.bit_count
         elseif other.class_text_name.to_string = as_real_general then
            -- We relax the rule only to be able to share code in REAL_GENERAL.
            Result := True
         end
      end

feature {LIVE_TYPE}
   structure_mark: CHARACTER
      do
         inspect
            bit_count
         when 32 then
            Result := 'f'
         when 64 then
            Result := 'd'
         else
            Result := 'D'
         end
      end

feature {}
   real_32 (sp: like start_position)
      do
         pretty_name := real_32_name
         bit_count := 32
         create class_text_name.make(real_32_name, sp, False)
      end

   real_64 (sp: like start_position)
      do
         pretty_name := real_64_name
         bit_count := 64
         create class_text_name.make(real_64_name, sp, False)
         -- It is not an error, the `class_text_name' is actually "REAL" internally.
      end

   real (sp: like start_position)
      local
         ta: TYPE_ALIASING
      do
         pretty_name := real_name
         bit_count := ta.real_bit_count
         create class_text_name.make(ta.real_alias, sp, False)
      end

   real_80 (sp: like start_position)
      do
         pretty_name := real_80_name
         bit_count := 80
         create class_text_name.make(real_extended_name, sp, False)
         -- It is not an error, the `class_text_name' is actually "REAL_EXTENDED" internally.
      end

   real_128 (sp: like start_position)
      do
         pretty_name := real_128_name
         bit_count := 80
         create class_text_name.make(real_extended_name, sp, False)
         -- It is not an error, the `class_text_name' is actually "REAL_EXTENDED" internally.
      end

   real_extended (sp: like start_position)
      do
         pretty_name := real_extended_name
         bit_count := 80
         create class_text_name.make(real_extended_name, sp, False)
      end

   real_32_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real_32)
      end

   real_64_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real_64)
      end

   real_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real)
      end

   real_80_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real_80)
      end

   real_128_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real_128)
      end

   real_extended_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real_extended)
      end

invariant
   written_mark.has_prefix(as_real)

end -- class REAL_TYPE_MARK
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
