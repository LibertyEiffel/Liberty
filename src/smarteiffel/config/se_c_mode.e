-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SE_C_MODE
   --
   -- C mode as used by the compiler itself (different from C_MODE which is used by the installer)
   --

create {SERC}
   make

feature {SYSTEM_TOOLS, COMMAND_LINE_TOOLS}
   c_compiler: STRING

   c_compiler_path: STRING

   c_linker_path: STRING

   c_strip_path: STRING

   c_compiler_options: STRING

   c_linker_options: STRING

   cpp_compiler: STRING

   cpp_compiler_path: STRING

   cpp_strip_path: STRING

   cpp_linker_path: STRING

   cpp_compiler_options: STRING

   cpp_linker_options: STRING

   smarteiffel_options: STRING

feature {}
   make (a_c_compiler: like c_compiler; a_c_compiler_path: like c_compiler_path; a_c_linker_path: like c_linker_path
      a_c_strip_path: like c_strip_path; a_c_compiler_options: like c_compiler_options
      a_c_linker_options: like c_linker_options; a_cpp_compiler: like cpp_compiler
      a_cpp_compiler_path: like cpp_compiler_path; a_cpp_linker_path: like cpp_linker_path
      a_cpp_strip_path: like cpp_strip_path; a_cpp_compiler_options: like cpp_compiler_options
      a_cpp_linker_options: like cpp_linker_options; a_smarteiffel_options: like smarteiffel_options)
      do
         c_compiler := a_c_compiler
         c_compiler_path := a_c_compiler_path
         c_linker_path := a_c_linker_path
         c_strip_path := a_c_strip_path
         c_compiler_options := a_c_compiler_options
         c_linker_options := a_c_linker_options
         cpp_compiler := a_cpp_compiler
         cpp_compiler_path := a_cpp_compiler_path
         cpp_linker_path := a_cpp_linker_path
         cpp_strip_path := a_cpp_strip_path
         cpp_compiler_options := a_cpp_compiler_options
         cpp_linker_options := a_cpp_linker_options
         smarteiffel_options := a_smarteiffel_options
      end

end -- class SE_C_MODE
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
