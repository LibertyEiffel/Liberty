-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class MEMORY_HANDLER

insert
   GLOBALS

   --|**** TODO: renamings

feature {ANY}
   info_flag: BOOLEAN
         -- True when Garbage Collector Information need to be printed.

feature {MEMORY_HANDLER_FACTORY}
   set_info_flag
      do
         info_flag := True
      ensure
         info_flag
      end

feature {ACE}
   ace_option (txt: STRING)
         -- Puts the collect option in the ACE text
      require
         txt /= Void
      deferred
      end

feature {C_PRETTY_PRINTER} -- C code phases
   pre_customize_c_runtime
         -- Code customization: #defines
      deferred
      end

   customize_c_runtime
         -- Code customization
      deferred
      end

   define1
         -- GC definitions code (just after customize)
      deferred
      end

   define2
         -- Most GC code is generated here
      deferred
      ensure
         smart_eiffel.magic_count = old smart_eiffel.magic_count
      end

   pre_initialize_runtime
         -- Code for runtime customization before calling "initialize_eiffel_runtime". Used to set the stack
         -- bottom.
      deferred
      end

   initialize_runtime
         -- Code for runtime startup in the "initialize_eiffel_runtime" C function
      deferred
      end

   post_initialize_runtime
         -- Code for runtime customization in the "initialize_eiffel_runtime" C function, after precomputable
         -- objects (manifest strings, precomputable once objects) have been created
      deferred
      end

   initialize_thread
         -- Code for runtime customization at thread start. Used to set the stack bottom.
      deferred
      end

   gc_info_before_exit
         -- Code for runtime cleanup in the "atexit" C function
      deferred
      end

   pre_cecil_define
         -- Code for cecil calls
      deferred
      end

   cecil_define
         -- Code for cecil calls
      deferred
      end

   post_cecil_define
         -- Code for cecil calls
      deferred
      end

   echo_information
      deferred
      end

feature {C_PRETTY_PRINTER} -- specific objects
   manifest_string_in (c_code: STRING)
         -- Code to create a new Manifest STRING and assign it in the "s" local C variable.
      require
         string_type_used: smart_eiffel.is_at_run_time(as_string)
      deferred
      end

feature {C_PRETTY_PRINTER} -- memory-specific handling aspects
   add_extra_collectors
         -- Add memory-related extra LIVE_TYPE collectors
      deferred
      end

   may_need_size_table: BOOLEAN
      deferred
      end

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- allocators
   malloc (lt: LIVE_TYPE)
         -- Code to create an object of the given live type
      deferred
      end

   calloc (lt: LIVE_TYPE; n: PROCEDURE[TUPLE])
         -- Code to create many objects of the given live type
         -- `n' represents the code that gives the number of objects to create, and will be called at the
         -- right time.
      deferred
      end

   malloc_closure (lt: LIVE_TYPE)
      require
         lt.type.has_local_closure
      deferred
      end

feature {C_COMPILATION_MIXIN} -- GC switches (see MEMORY)
   gc_disable
         -- Code to disable garbage collection
      deferred
      end

   gc_enable
         -- Code to enable garbage collection
      deferred
      end

   gc_collect
         -- Code to start a full GC collect
      deferred
      end

   gc_is_collecting
         -- Code to check if the gc is collecting as an expression
      deferred
      end

   gc_counter
         -- Code that gives the number of GC cycles as an expression
      deferred
      end

   gc_allocated_bytes
         -- Code that gives the currently allocated bytes as an expression
      deferred
      end

feature {C_COMPILATION_MIXIN} -- see WEAK_REFERENCE
   weak_item (lt: LIVE_TYPE)
         -- Code to get the weak reference item
      require
         -- lt is a WEAK_REFERENCE type
      deferred
      end

   weak_set_item (lt: LIVE_TYPE)
         -- Code to set the weak reference item
      require
         -- lt is a WEAK_REFERENCE type
      deferred
      end

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- agents
   assign_agent_data (mold_id: STRING)
         -- At agent creation time: specific memory handling data may be assigned
         -- See also `define_agent_data' for the struct fields to define
      require
         mold_id /= Void
      deferred
      end

   generate_agent_data (agent_creation: AGENT_CREATION; type: TYPE; mold_id: STRING; generate_closed_operand: PROCEDURE[TUPLE[CLOSED_OPERAND]])
         -- Code (usually functions) that handle agents memory, assigned above, called below
      require
         agent_creation /= Void
         type /= Void
         mold_id /= Void
         generate_closed_operand /= Void
      deferred
      end

   define_agent_data (mold_id: STRING)
         -- At agent structure definition: specific memory handles may be added to the struct
      require
         mold_id /= Void
      deferred
      end

   define_agent_data_is_equal
         -- See C_LIVE_TYPE_COMPILER.is_equal_agent_creation_define_type_for
      deferred
      end

   define_agent_data_0
         -- See C_PRETTY_PRINTER.customize_agent_pool_runtime_1
      deferred
      end

feature {C_COMPILATION_MIXIN}
   checkpoint
      deferred
      end

feature {C_NATIVE_PROCEDURE_MAPPER}
   mark_item (rf7: RUN_FEATURE_7)
         -- the `mark_item' function code
      deferred
      end

feature {C_PRETTY_PRINTER}
   start_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      deferred
      end

   end_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      deferred
      end

feature {C_HEADER_PASS_0}
   register_wa_list (live_type: LIVE_TYPE)
      deferred
      end

feature {C_COMPILATION_MIXIN}
   need_struct_for (type_mark: TYPE_MARK): BOOLEAN
      require
         type_mark /= Void
      deferred
      end

   extra_c_struct (type_mark: TYPE_MARK)
      require
         type_mark /= Void
      deferred
      end

   extra_c_model (type_mark: TYPE_MARK)
      require
         type_mark /= Void
      deferred
      end

   assigned_native_array (assignment: ASSIGNMENT; type: TYPE)
      require
         type /= Void
         assignment.right_side.resolve_in(type).is_native_array
      deferred
      end

   put_ref_in_native_array (rf7: RUN_FEATURE_7)
      require
         rf7.type_of_current.generic_list.first.is_reference
      do
         cpp.pending_c_function_body.extend('(')
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once ")[")
         cpp.put_ith_argument(2)
         cpp.pending_c_function_body.append(once "]=(")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once ");%N")
      end

feature {ANY}
   allocation_of (internal_c_local: INTERNAL_C_LOCAL; created_live_type: LIVE_TYPE)
         -- Heap-allocation into `internal_c_local' of a new object of some `created_live_type'.
      require
         cpp.pending_c_function
         created_live_type.at_run_time
         created_live_type.is_reference
      do
         internal_c_local.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "=/*alloc*/((T0*)(")
         malloc(created_live_type)
         cpp.pending_c_function_body.append(once "));%N")
         if cpp.need_struct.for(created_live_type.canonical_type_mark) then
            cpp.pending_c_function_body.append(once "*((T")
            created_live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ")=M")
            created_live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
         initialize_user_expanded_attributes(internal_c_local, created_live_type)
      end

feature {}
   define_manifest_string_mark
      local
         i, mdc, ms_count, function_count, id, us_id: INTEGER; ms: MANIFEST_STRING
      do
         mdc := manifest_string_pool.collected_once_count

         function_count := 1
         cpp.prepare_c_function
         manifest_string_mark_signature(function_count)
         from
            i := 1
            if manifest_string_pool.first_unicode_manifest_string_collected_flag then
               us_id := manifest_string_pool.se_ums.type_of_current.live_type.id
            end
         until
            i > mdc
         loop
            if ms_count > 300 then
               ms_count := 0
               function_count := function_count + 1
               cpp.pending_c_function_body.append(once "manifest_string_mark")
               function_count.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "();%N")
               cpp.dump_pending_c_function(True)
               cpp.prepare_c_function
               manifest_string_mark_signature(function_count)
            end
            ms := manifest_string_pool.collected_once_item(i)
            if ms.unicode_flag then
               id := us_id
            else
               id := 7
            end

            manifest_string_mark(i, id)

            cpp.pending_c_function_body.append(once "((T")
            id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)")
            cpp.pending_c_function_body.append(ms.once_variable)
            cpp.pending_c_function_body.append(once ");%N")
            ms_count := ms_count + 1
            i := i + 1
         end
         cpp.dump_pending_c_function(True)
      end

   manifest_string_mark_signature (number: INTEGER)
      require
         cpp.pending_c_function
      do
         cpp.pending_c_function_signature.copy(once "void manifest_string_mark")
         number.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(void)")
      end

   manifest_string_mark (i, id: INTEGER)
      require
         i.in_range(1, manifest_string_pool.collected_once_count)
         manifest_string_pool.collected_once_item(i).unicode_flag implies (
            manifest_string_pool.first_unicode_manifest_string_collected_flag
            and then id = manifest_string_pool.se_ums.type_of_current.live_type.id
         )
         not manifest_string_pool.collected_once_item(i).unicode_flag implies (id = 7)
      deferred
      ensure
         cpp.pending_c_function_body.count > old cpp.pending_c_function_body.count
      end

feature {}
   initialize_user_expanded_attributes (internal_c_local: INTERNAL_C_LOCAL; created_live_type: LIVE_TYPE)
         -- Produce C code to initialize, if any, expanded attributes of the newly `created_live_type' which
         -- currently stored in the `internal_c_local'.
      require
         smart_eiffel.is_ready
         internal_c_local /= Void
         created_live_type.is_reference
      local
         wa: ARRAY[RUN_FEATURE]; a: RUN_FEATURE; at: TYPE_MARK; i: INTEGER; rf3: RUN_FEATURE_3
         coma_flag: BOOLEAN
      do
         if created_live_type.class_text.name.to_string /= as_typed_internals then
            wa := created_live_type.writable_attributes
         end
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               a := wa.item(i)
               at := a.result_type
               if at.is_user_expanded then
                  rf3 := at.type.live_type.default_create_run_feature
                  if rf3 /= Void then
                     coma_flag := False
                     rf3.mapping_name_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.extend('(')
                     if ace.no_check then
                        cpp.pending_c_function_body.append(once "&ds")
                        coma_flag := True
                     end
                     if ace.profile then
                        if coma_flag then
                           cpp.pending_c_function_body.extend(',')
                        end
                        cpp.pending_c_function_body.append(once "&local_profile")
                        coma_flag := True
                     end
                     if rf3.use_current then
                        if coma_flag then
                           cpp.pending_c_function_body.extend(',')
                        end
                        if rf3.type_of_current.is_empty_expanded then
                           cpp.pending_c_function_body.extend('0')
                        else
                           cpp.pending_c_function_body.append(once "&(((T")
                           created_live_type.id.append_in(cpp.pending_c_function_body)
                           cpp.pending_c_function_body.append(once "*)")
                           internal_c_local.append_in(cpp.pending_c_function_body)
                           cpp.pending_c_function_body.append(once ")->_")
                           cpp.pending_c_function_body.append(a.name.to_string)
                           cpp.pending_c_function_body.extend(')')
                        end
                     end
                     cpp.pending_c_function_body.append(once ");%N")
                  end
               end
               i := i + 1
            end
         end
      end

feature {}
   generate_dispose (o: STRING; rf3: RUN_FEATURE_3; live_type: LIVE_TYPE)
         -- Append the extra C code for the MEMORY.dispose call if any.
      require
         not o.is_empty
         cpp.pending_c_function
         rf3 = live_type.get_memory_dispose
         not live_type.is_expanded
         not live_type.is_native_array
      local
         no_check: BOOLEAN
      do
         no_check := ace.no_check
         if no_check then
            cpp.pending_c_function_body.append(once "[
             se_frame_descriptor gcd={"Garbage Collector at work.\n"
             "dispose called (during sweep phase)",0,0,"",1};
             se_dump_stack ds = {NULL,NULL,0,NULL,NULL};
             ds.fd=&gcd;
             ds.caller=se_dst;
             ds.exception_origin=NULL;
             ds.locals=NULL;

            ]")
            cpp.set_dump_stack_top_for(rf3.type_of_current, once "&ds", once "link")
         end
         cpp.pending_c_function_body.extend('r')
         live_type.id.append_in(cpp.pending_c_function_body)
         rf3.name.mapping_c_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend('(')
         if no_check then
            cpp.pending_c_function_body.append(once "&ds,")
         end
         if ace.profile then
            cpp.pending_c_function_body.append(once "&gc_local_profile")
         end
         if no_check or else rf3.use_current then
            inspect
               cpp.pending_c_function_body.last
            when ',', '(' then
            else
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.extend('(')
            cpp.pending_c_function_body.append(cpp.target_type.for(live_type.canonical_type_mark))
            cpp.pending_c_function_body.extend(')')
            cpp.pending_c_function_body.append(o)
         end
         cpp.pending_c_function_body.append(once ");%N")
         if no_check then
            cpp.set_dump_stack_top_for(rf3.type_of_current, once "ds.caller", once "unlink")
         end
      end

end -- class MEMORY_HANDLER
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
