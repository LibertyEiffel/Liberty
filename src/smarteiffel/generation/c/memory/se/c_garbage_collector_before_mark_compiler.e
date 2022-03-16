-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_BEFORE_MARK_COMPILER
   --
   -- Produce C code to print GC information.
   --

inherit
   C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER

create {GC_HANDLER}
   make

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         if visited.type.has_local_closure then
            memory.free_in(visited, function_body, True)
            function_body.append(once "=(void*)0;%N")
         end
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      do
         function_body.append(once "if(")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left>0){%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store->header.size=")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left;%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store->header.magic_flag=RSOH_FREE;%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left=0;%N}%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".chunk_list=NULL;%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_chunk=NULL;%N")
      end

feature {}
   gc_reference (visited: TYPE_MARK)
      do
         memory.free_in(visited, function_body, False)
         function_body.append(once "=(void*)0;%N")
         if visited.type.has_local_closure then
            memory.free_in(visited, function_body, True)
            function_body.append(once "=(void*)0;%N")
         end
      end

   gc_kernel_expanded (visited: TYPE_MARK)
      do
      end

   gc_expanded (visited: TYPE_MARK)
      do
      end

end -- class C_GARBAGE_COLLECTOR_BEFORE_MARK_COMPILER
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
