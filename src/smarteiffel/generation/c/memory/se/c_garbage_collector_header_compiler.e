-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_HEADER_COMPILER
   --
   -- Define prototypes and C struct for the Garbage Collector
   --

inherit
   C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER

create {GC_HANDLER}
   make

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
         out_h.copy(once "%N#define gc_mark")
         visited.id.append_in(out_h)
         out_h.append(once "(x) (((se_agent0*)(x))->gc_mark_agent_mold((se_agent*)(x)))%N%N")
         cpp.write_out_h_buffer
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      do
         -- ------------------------------------ Declare na_envXXX :
         out_h.copy(once "na_env ")
         memory.na_env_in(visited, out_h)
         out_c.copy(once "{0,NULL,NULL,NULL,(void(*)(T0*))")
         memory.mark_in(visited, out_c, False)
         out_c.extend('}')
         cpp.write_extern_2(out_h, out_c)
         -- -------------------------------- Declare gc_info_nbXXX :
         if memory.info_flag then
            out_h.copy(once "int ")
            memory.info_nb_in(visited, out_h, False)
            cpp.write_extern_0(out_h)
         end
      end

feature {}
   gc_reference_ (visited: TYPE_MARK; for_closure: BOOLEAN) is
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type
         -- --------------- Define struct BXXX and typedef gcXXX :
         out_h.copy(once "typedef struct B")
         ltid_in(lt, out_h, False, for_closure)
         out_h.append(once " gc")
         ltid_in(lt, out_h, False, for_closure)
         out_h.append(once ";%Nstruct B")
         ltid_in(lt, out_h, False, for_closure)
         out_h.append(once "{T")
         lt.id.append_in(out_h)
         if for_closure then
            out_h.extend('*')
         else
            out_h.extend(' ')
         end
         out_h.append(once "object;union {void*flag;gc")
         ltid_in(lt, out_h, False, for_closure)
         out_h.append(once "*next;} header;};%N")
         cpp.write_out_h_buffer
         -- ----------------------------------- Declare storeXXX :
         out_h.copy(once "gc")
         ltid_in(lt, out_h, False, for_closure)
         out_h.extend('*')
         memory.store_in(visited, out_h, for_closure)
         cpp.write_extern_2(out_h, once "(void*)0")
         -- ------------------------------ Declare store_leftXXX :
         out_h.copy(once "int ")
         memory.store_left_in(visited, out_h, for_closure)
         cpp.write_extern_0(out_h)
         -- ----------------------------------- Declare store_chunkXXX :
         out_h.copy(once "fsoc*")
         memory.store_chunk_in(visited, out_h, for_closure)
         cpp.write_extern_2(out_h, once "(void*)0")
         -- --------------------------------- Declare gc_freeXXX :
         out_h.copy(once "gc")
         ltid_in(lt, out_h, False, for_closure)
         out_h.extend('*')
         memory.free_in(visited, out_h, for_closure)
         cpp.write_extern_2(out_h, once "(void*)0")
         -- -------------------------------- Declare gc_info_nbXXX :
         if memory.info_flag then
            out_h.copy(once "int ")
            memory.info_nb_in(visited, out_h, for_closure)
            cpp.write_extern_0(out_h)
         end
      end

   gc_reference (visited: TYPE_MARK) is
      do
         gc_reference_(visited, False)
         if visited.type.has_local_closure then
            gc_reference_(visited, True)
         end
      end

   gc_expanded (visited: TYPE_MARK) is
      do
      end

end -- class C_GARBAGE_COLLECTOR_HEADER_COMPILER
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
