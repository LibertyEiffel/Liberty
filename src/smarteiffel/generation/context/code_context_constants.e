-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CODE_CONTEXT_CONSTANTS

feature {}
   C_direct_call: INTEGER unique
         -- Target is sure not to be Void and there is only one possible type (target
         -- often Current, a manifest string or some expanded).

   C_create_instruction: INTEGER unique
         -- Target has just been created with a create instruction and needs to be initialised
         -- with some create procedure call.

   C_create_expression: INTEGER unique
         -- Target has just been created with a create expression and needs to be initialized
         -- inside the create function.

   C_inside_twin: INTEGER unique
         -- In order to call the user's `copy'.

   C_precursor: INTEGER unique
         -- For Precursor calls.

   C_inside_some_wrapper: INTEGER unique
         -- The feature to be called is inside some wrapper using the most general convention.

   C_cecil_create: INTEGER unique
         -- The target has just been created, the create instruction is called via CECIL

end -- class CODE_CONTEXT_CONSTANTS
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
