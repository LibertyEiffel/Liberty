-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class MANIFEST_EXPRESSION
   --
   -- Common declaration type for all "obviously-static" manifest expressions. An obviously-static expression is an expression which
   -- cannot be changed because of some redefinition in a descendant and which is simple enough. Here are some obvious examples: 1,
   -- 2, True, False, 'a' or "foo". Note that even a simple expression like 1 + 1 is not considered as "obviously-static".
   --
   -- See `valid_manifest_expression_set' to have the exact list of allowed dynamic types (i.e. objects which are considered
   -- "obviously-static".
   --
   -- Actually, the purpose of this class is to have a more accurate declaration type mark for atomic and static manifest
   -- expressions. (Indeed, at some place, it is more accurate to use MANIFEST_EXPRESSION than simply EXPRESSION).
   --

inherit
   EXPRESSION

feature {ANY}
   frozen is_writable: BOOLEAN False

   frozen is_current: BOOLEAN False

   frozen is_implicit_current: BOOLEAN False

   frozen is_result: BOOLEAN False

   frozen use_current (type: TYPE): BOOLEAN
      do
      end

feature {}
   valid_manifest_expression: BOOLEAN
      do
         Result := valid_manifest_expression_set.has(generator)
      ensure
         Result -- (To force usage in assertion only.)
      end

   valid_manifest_expression_set: HASHED_SET[STRING]
      once
         Result := {HASHED_SET[STRING] << "INTEGER_CONSTANT",
                                          "REAL_CONSTANT",
                                          "MANIFEST_STRING",
                                          "CHARACTER_CONSTANT",
                                          "E_VOID",
                                          "E_TRUE",
                                          "E_FALSE">> }
      end

invariant
   valid_manifest_expression

end -- class MANIFEST_EXPRESSION
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
