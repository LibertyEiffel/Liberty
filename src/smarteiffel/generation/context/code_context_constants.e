-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CODE_CONTEXT_CONSTANTS

feature {}
   C_direct_call: INTEGER is unique
         -- Target is sure not to be Void and there is only one possible type (target is 
         -- often Current, a manifest string or some expanded).

   C_create_instruction: INTEGER is unique
         -- Target has been just created with a create instruction and need to be initialized 
         -- with some create procedure call.

   C_create_expression: INTEGER is unique
         -- Target has been just created with a create expression and need to be initialized 
         -- inside the create function.

   C_inside_twin: INTEGER is unique
         -- In order to call the user's `copy'.

   C_precursor: INTEGER is unique
         -- For Precursor calls.

   C_inside_some_wrapper: INTEGER is unique
         -- The feature to be called is inside some wrapper using the most general convention.

end -- class CODE_CONTEXT_CONSTANTS
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
