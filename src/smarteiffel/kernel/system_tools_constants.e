-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SYSTEM_TOOLS_CONSTANTS

feature {SERC_FACTORY, C_SPLITTER} -- Currently handled system list:
   unix_system: STRING "UNIX"

   windows_system: STRING "Windows"

   cygwin_system: STRING "Cygwin"

   dos_system: STRING "DOS"

feature {} -- Currently handled C/C++ compiler list:
   gcc: STRING "gcc"

   gpp: STRING "g++"

   distcc: STRING "distcc"

   lcc_win32: STRING "lcc-win32"

   cc: STRING "cc"

   cc_pp: STRING "CC"

   bcc32: STRING "bcc32"

   cl: STRING "cl"

   ccc: STRING "ccc"

   tcc: STRING "tcc"

end -- class SYSTEM_TOOLS_CONSTANTS
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
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
