-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SYSTEM_TOOLS_CONSTANTS

feature {INSTALL_GLOBALS, SERC_FACTORY, C_SPLITTER} -- Currently handled system list:
   unix_system: STRING is "UNIX"

   windows_system: STRING is "Windows"

   cygwin_system: STRING is "Cygwin"

   beos_system: STRING is "BeOS"

   macintosh_system: STRING is "Macintosh"

   amiga_system: STRING is "Amiga"

   dos_system: STRING is "DOS"

   os2_system: STRING is "OS2"

   open_vms_system: STRING is "OpenVMS"

   elate_system: STRING is "Elate"

feature {INSTALL_GLOBALS} -- Currently handled C/C++ compiler list:
   gcc: STRING is "gcc"

   gpp: STRING is "g++"

   distcc: STRING is "distcc"

   lcc_win32: STRING is "lcc-win32"

   cc: STRING is "cc"

   cc_pp: STRING is "CC"

   wcl386: STRING is "wcl386"

   bcc32: STRING is "bcc32"

   cl: STRING is "cl"

   sas_c: STRING is "sc"

   dice: STRING is "dice"

   vbcc: STRING is "vbcc"

   ccc: STRING is "ccc"

   vpcc: STRING is "vpcc"

   open_vms_cc: STRING is "OpenVMS_CC"

   tcc: STRING is "tcc"

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
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
