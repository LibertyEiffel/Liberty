-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class TYPE_ALIASING
--
-- Try to prepare for type aliasing variation (when we want to shift to 64-bit integers, or if we want to
-- give this possibility to the programmer via some command-line or ACE option)
--
-- By "type aliasing", we mean INTEGER and REAL implicit sizes being made explicit. Currently INTEGER
-- INTEGER_32, REAL is REAL_64, and NATURAL is NATURAL_32.
--
insert
   GLOBALS

feature {ANY}
   alias_of (string: STRING): STRING
      do
         inspect string
         when "INTEGER" then
            Result := integer_alias.to_string
         when "REAL" then
            Result := real_alias.to_string
         when "NATURAL" then
            Result := natural_alias.to_string
         else
            check Result = Void end
         end
      end

feature {ANY} -- INTEGER aliasing
   integer_alias: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_integer_32)
      end

   integer_bit_count: INTEGER 32

feature {ANY} -- NATURAL aliasing
   natural_alias: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_natural_32)
      end

   natural_bit_count: INTEGER 32

feature {ANY} -- REAL aliasing
   real_alias: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_real_64)
      end

   real_bit_count: INTEGER 64

end -- class TYPE_ALIASING
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
