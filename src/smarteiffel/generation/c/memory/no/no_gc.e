-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NO_GC

inherit
   MEMORY_HANDLER

create {MEMORY_HANDLER_FACTORY}
   make

feature {ACE}
   ace_option (txt: STRING)
      do
         txt.append("   collect(no)%N")
      end

feature {C_PRETTY_PRINTER} -- C code phases
   pre_customize_c_runtime
      do
      end

   customize_c_runtime
      do
      end

   define1
      do
         echo.put_string(once "Compiling without Garbage Collector!%N")
      end

   define2
      do
      end

   pre_initialize_runtime
      do
      end

   initialize_runtime
      do
      end

   post_initialize_runtime
      do
      end

   initialize_thread
      do
      end

   gc_info_before_exit
      do
         if info_flag then
            cpp.pending_c_function_body.append(once "fprintf(SE_ERR,%"No GC compiled in, no information available\n%");%N")
         end
      end

   pre_cecil_define
      do
      end

   cecil_define
      do
      end

   post_cecil_define
      do
      end

   echo_information
      do
      end

feature {C_PRETTY_PRINTER} -- specific objects
   manifest_string_in (c_code: STRING)
      do
         c_code.append(once "s=((T7*)se_malloc(sizeof(T7)));%N")
      end

feature {C_PRETTY_PRINTER} -- memory-specific handling aspects
   add_extra_collectors
      do
      end

   may_need_size_table: BOOLEAN False

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- allocators
   malloc (lt: LIVE_TYPE)
      do
         if cpp.need_struct.for(lt.canonical_type_mark) then
            cpp.pending_c_function_body.append(once "se_malloc(sizeof(T")
            lt.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "/*")
            cpp.pending_c_function_body.append(lt.structure_signature)
            cpp.pending_c_function_body.append(once "*/))")
         else
            cpp.pending_c_function_body.append(once "se_malloc(1)")
         end
      end

   malloc_closure (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "((T")
         lt.id.append_in(cpp.pending_c_function_body)
         if lt.is_reference then
            cpp.pending_c_function_body.extend('*')
         end
         cpp.pending_c_function_body.append(once "*)se_malloc(sizeof(void*)))")
      end

   calloc (lt: LIVE_TYPE; n: PROCEDURE[TUPLE])
      require
         lt.is_generic
      local
         et: TYPE
      do
         et := lt.type.generic_list.first
         cpp.pending_c_function_body.append(once "se_calloc(")
         n.call([])
         cpp.pending_c_function_body.append(once ",sizeof(T")
         if et.is_reference then
            cpp.pending_c_function_body.append(once "0*")
         else
            et.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "/*")
            cpp.pending_c_function_body.append(et.live_type.structure_signature)
            cpp.pending_c_function_body.append(once "*/")
         end
         cpp.pending_c_function_body.append(once "))")
      end

feature {C_COMPILATION_MIXIN} -- GC switches (see MEMORY)
   gc_disable
      do
      end

   gc_enable
      do
      end

   gc_collect
      do
      end

   gc_is_collecting
      do
         cpp.pending_c_function_body.append(once "(0)")
      end

   gc_counter
      do
         cpp.pending_c_function_body.append(once "(-1)")
      end

   gc_allocated_bytes
      do
         cpp.pending_c_function_body.append(once "(-1)")
      end

feature {C_COMPILATION_MIXIN} -- see WEAK_REFERENCE
   weak_item (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "(((T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "))->o)")
      end

   weak_set_item (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "(((T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "))->o)=(T0*)(")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once ");%N")
      end

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- agents
   assign_agent_data (mold_id: STRING)
      do
      end

   generate_agent_data (agent_creation: AGENT_CREATION; type: TYPE; mold_id: STRING; generate_closed_operand: PROCEDURE[TUPLE[CLOSED_OPERAND]])
      do
      end

   define_agent_data (mold_id: STRING)
      do
      end

   define_agent_data_is_equal
      do
      end

   define_agent_data_0
      do
      end

feature {C_COMPILATION_MIXIN}
   checkpoint
      do
      end

feature {C_NATIVE_PROCEDURE_MAPPER}
   mark_item (rf7: RUN_FEATURE_7)
      do
         cpp.pending_c_function_body.append(once "{/*mark_item*/}%N")
      end

feature {C_PRETTY_PRINTER}
   start_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      do
      end

   end_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      do
      end

feature {C_HEADER_PASS_0}
   register_wa_list (live_type: LIVE_TYPE)
      do
      end

feature {C_COMPILATION_MIXIN}
   need_struct_for (type_mark: TYPE_MARK): BOOLEAN
      do
         check not Result end
      end

   extra_c_struct (type_mark: TYPE_MARK)
      do
      end

   extra_c_model (type_mark: TYPE_MARK)
      do
      end

   assigned_native_array (assignment: ASSIGNMENT; type: TYPE)
      do
      end

feature {}
   make
      do
      end

   manifest_string_mark (i, id: INTEGER)
      do
      end

end -- class NO_GC
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
