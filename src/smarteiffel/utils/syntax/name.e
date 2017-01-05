-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NAME
   --
   -- Handling of all sort of names you can find in an Eiffel source file :
   --
   --   CLASS_NAME: a base class name.
   --   FEATURE_NAME: a feature name (not an EXPRESSION)
   --   WRITABLE_ATTRIBUTE_NAME: left-hand side or writable of create.
   --   LOCAL_ARGUMENT (deferred)
   --      LOCAL_NAME (deferred)
   --         LOCAL_NAME_DEF: in a declaration list.
   --         LOCAL_NAME_REF: used in an expression.
   --      ARGUMENT_NAME (deferred)
   --         ARGUMENT_NAME_DEF: in a declaration list.
   --         ARGUMENT_NAME_REF: used in an expression.
   --

inherit
   VISITABLE
insert
   GLOBALS

feature {ANY}
   extra_bracket_flag: BOOLEAN False

   start_position: POSITION
         -- The position of the first character of `to_string' in the text source.
      deferred
      end

   to_string: STRING
         -- The corresponding name (alone in a STRING).
      deferred
      ensure
         not Result.is_empty
         string_aliaser.registered_one(Result)
      end

   frozen line: INTEGER
      require
         not start_position.is_unknown
      do
         Result := start_position.line
      end

   frozen column: INTEGER
      require
         not start_position.is_unknown
      do
         Result := start_position.column
      end

   pretty (indent_level: INTEGER)
      deferred
      end

   frozen bracketed_pretty (indent_level: INTEGER)
      do
         pretty(indent_level)
      end

end -- class NAME
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
