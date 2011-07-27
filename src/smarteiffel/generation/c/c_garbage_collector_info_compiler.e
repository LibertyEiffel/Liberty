-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_INFO_COMPILER
   --
   -- Produce C code to print GC information.
   --

inherit
   C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER

create {GC_HANDLER}
   make

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      do
         function_body.append(once "if(")
         cpp.gc_handler.info_nb_in(visited, function_body)
         function_body.append(once ")%Nfprintf(SE_GCINFO,%"%%d\t%%d\t\t")
         function_body.append(visited.written_name.to_string)
         function_body.append(once "\n%",")
         cpp.gc_handler.info_nb_in(visited, function_body)
         function_body.extend(',')
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".space_used);%N")
      end

feature {}
   gc_reference (visited: TYPE_MARK) is
      do
         function_body.append(once ";%Nif(")
         cpp.gc_handler.info_nb_in(visited, function_body)
         function_body.append(once ")%Nfprintf(SE_GCINFO,%"%%d\t%%d\t%%d\t")
         function_body.append(visited.written_mark)
         function_body.append(once "\n%",")
         cpp.gc_handler.info_nb_in(visited, function_body)
         function_body.extend(',')
         cpp.gc_handler.info_nb_in(visited, function_body)
         function_body.append(once "*sizeof(T")
         visited.id.append_in(function_body)
         function_body.append(once "),")
         cpp.gc_handler.store_left_in(visited, function_body)
         function_body.append(once ");%N")
      end

   gc_expanded (visited: TYPE_MARK) is
      do
      end

end -- class C_GARBAGE_COLLECTOR_INFO_COMPILER
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
