-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class DECLARATION
   --
   -- To store the syntax of the user in a declaration list, a single
   -- declaration is a DECLARATION_1 and a group of variables with the
   -- the same type is a DECLARATION_GROUP.
   --

inherit
   VISITABLE

insert
   GLOBALS

feature {ANY}
   pretty_in (buffer: STRING)
      require
         buffer /= Void
      deferred
      end

   short (type: TYPE)
      deferred
      end

feature {DECLARATION_LIST}
   count: INTEGER
         -- One or more items.
      deferred
      ensure
         Result >= 1
      end

   specialize_in (type: TYPE): like Current
      require
         type /= Void
      deferred
      ensure
         Result.has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      require
         new_type.direct_thru_step(parent_type, parent_edge)
         has_been_specialized
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

feature {DECLARATION, DECLARATION_LIST}
   has_been_specialized: BOOLEAN
      deferred
      ensure
         Result
      end

feature {FORMAL_ARG_LIST}
   append_in_formal_arg_list (fal: FORMAL_ARG_LIST)
         -- Append current declaration in `fal'.
      require
         fal /= Void
      deferred
      end

feature {LOCAL_VAR_LIST}
   append_in_local_var_list (lvl: LOCAL_VAR_LIST)
         -- Append current declaration in `lvl'.
      require
         lvl /= Void
      deferred
      end

end -- class DECLARATION
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
