-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CHARACTER_CONSTANT
   --
   -- For Manifest Constant CHARACTER.
   --

inherit
   BASE_TYPE_CONSTANT

create {EIFFEL_PARSER}
   make

create {ANY}
   with

feature {ANY}
   extra_bracket_flag: BOOLEAN False

   value: CHARACTER

   pretty_view: STRING
         -- To be used for `pretty'.

   declaration_type: TYPE
      once
         Result := smart_eiffel.type_character
      end

   frozen resolve_in (type: TYPE): TYPE
      do
         Result := declaration_type
      end

   to_string: STRING
      do
         if pretty_view /= Void then
            Result := pretty_view.twin
         else
            check
               (not smart_eiffel.pretty_flag) and then (not smart_eiffel.short_or_class_check_flag)
            end
            -- Probably trying to report an error. So we just rebuild
            -- a standard
            Result := once "......."
            Result.clear_count
            Result.extend('%'')
            inspect
               value
            when '@' .. '~' then
               Result.extend(value)
            else
               character_coding(value, Result)
            end
            Result.extend('%'')
         end
      end

   simplify_1_, simplify_2: like Current
      do
         Result := Current
      end

feature {ANY}
   accept (visitor: CHARACTER_CONSTANT_VISITOR)
      do
         visitor.visit_character_constant(Current)
      end

feature {}
   make (sp: like start_position; v: like value; pv: like pretty_view)
      require
         not sp.is_unknown
      do
         start_position := sp
         value := v
         pretty_view := pv
      ensure
         start_position = sp
         value = v
         pretty_view = pv
      end

   with (sp: like start_position; v: like value)
      require
         not sp.is_unknown
      do
         make(sp, v, Void)
      end

end -- class CHARACTER_CONSTANT
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
