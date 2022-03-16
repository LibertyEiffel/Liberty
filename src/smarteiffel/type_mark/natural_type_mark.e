-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATURAL_TYPE_MARK
   --
   -- Handling of types "NATURAL_8", "NATURAL_16", "NATURAL_32" and "NATURAL_64"
   --

inherit
   KERNEL_EXPANDED_TYPE_MARK
      redefine pretty_in, default_expression, resolve_in, class_text
      end

create {ANY}
   natural_8, natural_16, natural_32, natural_64, natural

feature {ANY}
   pretty_name: HASHED_STRING
         -- The one actually written in the source code (`as_natural_8', `as_natural_16', `as_natural'
         -- or `as_natural_64').

   class_text: CLASS_TEXT
      local
         ta: TYPE_ALIASING
      do
         Result := class_text_memory
         if Result = Void then
            if class_text_name.hashed_name = natural_name then
               class_text_name.set_hashed_name(ta.natural_alias)
               Result := Precursor
               class_text_name.set_hashed_name(natural_name)
            else
               Result := Precursor
            end
         end
      end

   bit_count: INTEGER
         -- Can be 8, 16, 32 or 64.

   written_name: HASHED_STRING
         -- Can be: NATURAL_8, NATURAL_16, INTEGER_32 or INTEGER_64.
      do
         inspect
            bit_count
         when 8 then
            Result := natural_8_name
         when 16 then
            Result := natural_16_name
         when 32 then
            Result := natural_32_name
         when 64 then
            Result := natural_64_name
         end
      end

   pretty_in (buffer: STRING)
      do
         buffer.append(pretty_name.to_string)
      end

   id: INTEGER
      do
         Result := class_text.id
      end

   type: TYPE
      do
         inspect
            bit_count
         when 8 then
            Result := smart_eiffel.type_natural_8
         when 16 then
            Result := smart_eiffel.type_natural_16
         when 32 then
            Result := smart_eiffel.type_natural_32
         when 64 then
            Result := smart_eiffel.type_natural_64
         end
      end

   resolve_in (new_type: TYPE): TYPE
      do
         Result := type
      end

   default_expression (sp: POSITION): EXPRESSION
      do
         create {NATURAL_CONSTANT} Result.with(0.to_natural_64, sp, Current)
      end

   accept (visitor: NATURAL_TYPE_MARK_VISITOR)
      do
         visitor.visit_natural_type_mark(Current)
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
         natural_type_mark: NATURAL_TYPE_MARK
      do
         if other.is_natural then
            natural_type_mark ::= other
            Result := bit_count <= natural_type_mark.bit_count
         elseif other.class_text_name.to_string = as_natural_general then
            -- We relax the rule only to be able to share code in NATURAL_GENERAL.
            Result := True
         end
      end

feature {ANY}
   natural_8 (sp: like start_position)
      do
         bit_count := 8
         pretty_name := natural_8_name
         create class_text_name.make(natural_8_name, sp, False)
      end

   natural_16 (sp: like start_position)
      do
         bit_count := 16
         pretty_name := natural_16_name
         create class_text_name.make(natural_16_name, sp, False)
      end

   natural_32 (sp: like start_position)
      do
         bit_count := 32
         pretty_name := natural_32_name
         create class_text_name.make(natural_32_name, sp, False)
      end

   natural (sp: like start_position)
      local
         ta: TYPE_ALIASING
      do
         bit_count := ta.natural_bit_count
         pretty_name := natural_name
         create class_text_name.make(ta.natural_alias, sp, False)
      end

   natural_64 (sp: like start_position)
      do
         bit_count := 64
         pretty_name := natural_64_name
         create class_text_name.make(natural_64_name, sp, False)
      end

   natural_8_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_natural_8)
      end

   natural_16_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_natural_16)
      end

   natural_32_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_natural_32)
      end

   natural_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_natural)
      end

   natural_64_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_natural_64)
      end

end -- class NATURAL_TYPE_MARK
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
