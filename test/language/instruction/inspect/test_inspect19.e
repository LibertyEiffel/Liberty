-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INSPECT19
-- Bug discovered in source code from Guillaume Lemaitre.
-- Bug isolated by Philippe Ribet
--
-- Bug exposed in simplify code, so only when compiled with -boost
-- flag. This code result in compiler crash.
--
-- WARNING: this bug is very volatile. It disapears with very small
-- changes like switching inherited class names, removing the
-- AUX_INSPECT19 class, removing one inspect case (probably changed
-- into "if").
--
-- It looks like argument() is inlined into arguments.item() but some
-- preliminary step may be wrong. It fails to find type of arguments.
-- Then it could not find 'item' in ANY. Not sure...

inherit
   AUX_INSPECT19

insert
   ARGUMENTS

create {}
   make

feature {}
   make
      do
         inspect argument( 0 )
         when once "-foo" then
         when once "-bar" then
         else
         end
      end
end -- class TEST_INSPECT19
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
