-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTEGER_TYPE_MARK
   --
   -- Handling of the "INTEGER" type mark. This class handles all variants of the "INTEGER" type
   -- mark: "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64"
   --

inherit
   KERNEL_EXPANDED_TYPE_MARK
      redefine pretty_in, default_expression, resolve_in, class_text
      end

create {ANY}
   integer_8, integer_16, integer_32, integer_64, integer

feature {ANY}
   pretty_name: HASHED_STRING
         -- The one actually written in the source code (`as_integer_8', `as_integer_16', `as_integer'
         -- or `as_integer_64').

   class_text: CLASS_TEXT
      local
         ta: TYPE_ALIASING
      do
         Result := class_text_memory
         if Result = Void then
            if class_text_name.hashed_name = integer_name then
               class_text_name.set_hashed_name(ta.integer_alias)
               Result := Precursor
               class_text_name.set_hashed_name(integer_name)
            else
               Result := Precursor
            end
         end
      end

   bit_count: INTEGER
         -- Result is 8, 16, 32 or 64.
      do
         Result := bit_count_memory
      ensure
         (Result = 8) or (Result = 16) or (Result = 32) or (Result = 64)
      end

   id: INTEGER
      do
         inspect
            bit_count
         when 8 then
            Result := 1
         when 16 then
            Result := 10
         when 32 then
            Result := 2
         when 64 then
            Result := 11
         end
      end

   type: TYPE
      do
         inspect
            bit_count
         when 8 then
            Result := smart_eiffel.type_integer_8
         when 16 then
            Result := smart_eiffel.type_integer_16
         when 32 then
            Result := smart_eiffel.type_integer_32
         when 64 then
            Result := smart_eiffel.type_integer_64
         end
      end

   resolve_in (new_type: TYPE): TYPE
      do
         Result := type
      end

   default_expression (sp: POSITION): EXPRESSION
      do
         create {INTEGER_CONSTANT} Result.with(0, sp, Current)
      end

   accept (visitor: INTEGER_TYPE_MARK_VISITOR)
      do
         visitor.visit_integer_type_mark(Current)
      end

   written_name: HASHED_STRING
      do
         Result := class_text_name.hashed_name
      end

   pretty_in (buffer: STRING)
      do
         buffer.append(pretty_name.to_string)
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING
      do
         Result := class_text_name.hashed_name
      end

feature {LIVE_TYPE}
   structure_mark: CHARACTER
      do
         inspect
            bit_count
         when 8 then
            Result := 'c'
         when 16 then
            Result := 's'
         when 32 then
            Result := 'i'
         when 64 then
            Result := 'I'
         end
      end

feature {TYPE}
   can_be_assigned_to (other: TYPE_MARK): BOOLEAN
      local
         integer_type_mark: INTEGER_TYPE_MARK; real_type_mark: REAL_TYPE_MARK
      do
         if other.is_integer then
            integer_type_mark ::= other
            Result := bit_count <= integer_type_mark.bit_count
         elseif other.class_text_name.to_string = as_integer_general then
            -- We relax the rule only to be able to share code in INTEGER_GENERAL.
            Result := True
         elseif other.is_real then
            real_type_mark ::= other
            Result := real_type_mark.bit_count > bit_count
         end
      end

feature {}
   bit_count_memory: INTEGER
         -- (See `bit_count'.)

   integer_8 (sp: like start_position)
      do
         bit_count_memory := 8
         pretty_name := integer_8_name
         create class_text_name.make(integer_8_name, sp, False)
      end

   integer_16 (sp: like start_position)
      do
         bit_count_memory := 16
         pretty_name := integer_16_name
         create class_text_name.make(integer_16_name, sp, False)
      end

   integer_32 (sp: like start_position)
      do
         bit_count_memory := 32
         pretty_name := integer_32_name
         create class_text_name.make(integer_32_name, sp, False)
      end

   integer (sp: like start_position)
      local
         ta: TYPE_ALIASING
      do
         bit_count_memory := ta.integer_bit_count
         pretty_name := integer_name
         create class_text_name.make(ta.integer_alias, sp, False)
      end

   integer_64 (sp: like start_position)
      do
         bit_count_memory := 64
         pretty_name := integer_64_name
         create class_text_name.make(integer_64_name, sp, False)
      end

   integer_8_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer_8)
      end

   integer_16_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer_16)
      end

   integer_32_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer_32)
      end

   integer_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer)
      end

   integer_64_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer_64)
      end

   integer_general_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer_general)
      end

invariant
   written_mark.has_prefix(as_integer)

end -- class INTEGER_TYPE_MARK
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
