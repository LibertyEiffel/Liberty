-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class JVM
   --
   -- Handling of Java Virtual Machine byte code generation.
   --

inherit
   CODE_PRINTER

creation {ANY}
   make

feature {}
   make is
      do
      end

feature {SMART_EIFFEL}
   compile is
      local
         lt: LIVE_TYPE; run_count, i: INTEGER
      do
         if nb_errors = 0 then
            prepare_output_directory
            from
               i := live_type_map.upper
            until
               i < live_type_map.lower
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then
                  run_count := run_count + 1
                  lt.compile_to_jvm
               end
               i := i - 1
            end
            echo.print_count(once "Used Type", run_count)
            agent_pool.customize_jvm_runtime
            write_jvm_root_class
            write_main_class(smart_eiffel.root_procedure)
            smart_eiffel.customize_runtime
         else
            error_handler.append("Cannot produce Java Byte Code.")
            error_handler.print_as_error
         end
      end

feature {}
   live_type_map: FAST_ARRAY[LIVE_TYPE] is
      do
         Result := smart_eiffel.live_type_map
      end

feature {ANY}
   current_frame: RUN_FEATURE
         -- Current method or current field.

   argument_offset_of (an: ARGUMENT_NAME1): INTEGER is
      require
         an /= Void
      do
         Result := current_frame.jvm_argument_offset(an)
      ensure
         Result >= 0
      end

   local_offset_of (ln: LOCAL_NAME1): INTEGER is
      require
         ln /= Void
      do
         Result := current_frame.jvm_local_variable_offset(ln)
      ensure
         Result >= 0
      end

   std_is_equal (lt: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]) is
         -- Produce byte code to compare two operands at top of stack.
         -- Result `1'   (True) or `0' (False) is left at top of stack.
      require
         not lt.canonical_type_mark.is_kernel_expanded
      local
         ca: like code_attribute; rf2: RUN_FEATURE_2; point, space, i: INTEGER; branch_index: INTEGER
      do
         ca := code_attribute
         branch_index := ca.get_branch_array_index
         if wa = Void then
            if lt.is_expanded then
               ca.opcode_pop2
               ca.opcode_iconst_1
            else
               ca.opcode_swap
               ca.opcode_pop
               lt.opcode_instanceof
            end
         else
            if lt.is_reference then
               ca.opcode_dup
               lt.opcode_instanceof
               ca.add_branch(ca.opcode_ifeq, branch_index)
            end
            from
               i := wa.upper
            until
               i = 0
            loop
               rf2 := wa.item(i)
               space := rf2.result_type.jvm_stack_space - 1
               ca.opcode_dup2
               space := lt.opcode_getfield(rf2)
               if space = 0 then
                  ca.opcode_swap
               else
                  ca.opcode_dup2_x1
                  ca.opcode_pop2
               end
               space := lt.opcode_getfield(rf2)
               if rf2.result_type.is_user_expanded then
                  std_is_equal_recurse(rf2.result_type.type.live_type,
                                       rf2.result_type.type.live_type.writable_attributes, branch_index)
               else
                  ca.add_branch(rf2.result_type.jvm_if_x_ne, branch_index)
               end
               i := i - 1
            end
            ca.opcode_pop2
            ca.opcode_iconst_1
            point := ca.opcode_goto
            ca.resolve_branches(branch_index)
            ca.opcode_pop2
            ca.opcode_iconst_0
            ca.resolve_u2_branch(point)
         end
         ca.release_branch_array_index
      end

   std_is_equal_recurse (lt: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]; calling_branch_index: INTEGER) is
         -- Produce byte code to compare two operands at top of stack.
         -- Called recursively from std_is_equal for user expanded types
         -- if all equal, fall through after taking off two top words on stack
         -- if any not equal, take two top words off stack and jump to std_is_equal last branch point
         -- lt is user expanded
      require
         not lt.canonical_type_mark.is_kernel_expanded
      local
         ca: like code_attribute; rf2: RUN_FEATURE_2; point, space, i: INTEGER; branch_index: INTEGER
      do
         ca := code_attribute
         branch_index := ca.get_branch_array_index
         if wa = Void then
            ca.opcode_swap
            ca.opcode_pop
            lt.opcode_instanceof
            ca.add_branch(ca.opcode_ifeq, calling_branch_index)
         else
            from
               i := wa.upper
            until
               i = 0
            loop
               rf2 := wa.item(i)
               space := rf2.result_type.jvm_stack_space - 1
               ca.opcode_dup2
               space := lt.opcode_getfield(rf2)
               if space = 0 then
                  ca.opcode_swap
               else
                  ca.opcode_dup2_x1
                  ca.opcode_pop2
               end
               space := lt.opcode_getfield(rf2)
               if rf2.result_type.is_user_expanded then
                  std_is_equal_recurse(rf2.result_type.type.live_type,
                                       rf2.result_type.type.live_type.writable_attributes, branch_index)
               else
                  ca.add_branch(rf2.result_type.jvm_if_x_ne, branch_index)
               end
               i := i - 1
            end
            ca.opcode_pop2
            point := ca.opcode_goto
            ca.resolve_branches(branch_index)
            ca.opcode_pop2
            ca.add_branch(ca.opcode_goto, calling_branch_index)
            ca.resolve_u2_branch(point)
         end
         ca.release_branch_array_index
      end

   fields_by_fields_copy (wa: ARRAY[RUN_FEATURE_2]) is
         -- Stack : ..., destination, model => ..., destination
         -- Assume the checkcast is already done.
      local
         ca: like code_attribute; rf2: RUN_FEATURE_2; idx, space, i: INTEGER
      do
         ca := code_attribute
         if wa /= Void then
            from
               i := wa.upper
            until
               i = 0
            loop
               ca.opcode_dup2
               rf2 := wa.item(i)
               idx := constant_pool.idx_fieldref(rf2)
               space := rf2.result_type.jvm_stack_space
               ca.opcode_getfield(idx, space - 1)
               ca.opcode_putfield(idx, - (space + 1))
               i := i - 1
            end
         end
         ca.opcode_pop
      end

   fields_by_fields_expanded_copy (wa: ARRAY[RUN_FEATURE_2]) is
         -- Stack : ..., destination, model => ..., destination
         -- Assume the checkcast is already done.
      local
         ca: like code_attribute; rf2: RUN_FEATURE_2; idx, space, i: INTEGER; lt: LIVE_TYPE
         wa1: ARRAY[RUN_FEATURE_2]; rt: TYPE_MARK
      do
         ca := code_attribute
         if wa /= Void then
            from
               i := wa.upper
            until
               i = 0
            loop
               rf2 := wa.item(i)
               rt := rf2.result_type
               if rt.is_kernel_expanded or else rt.is_reference or else rt.is_native_array then
                  ca.opcode_dup2
                  idx := constant_pool.idx_fieldref(rf2)
                  space := rt.jvm_stack_space
                  ca.opcode_getfield(idx, space - 1)
                  ca.opcode_putfield(idx, - (space + 1))
               else
                  -- is_expanded
                  ca.opcode_dup2
                  idx := constant_pool.idx_fieldref(rf2)
                  space := rt.jvm_stack_space
                  ca.opcode_getfield(idx, space - 1)
                  ca.opcode_swap
                  ca.opcode_getfield(idx, space - 1)
                  ca.opcode_swap
                  lt := rt.type.live_type
                  wa1 := lt.writable_attributes
                  fields_by_fields_expanded_copy(wa1)
                  ca.opcode_pop2
               end
               i := i - 1
            end
         end
      end

feature {FORMAL_ARG_LIST, BUILT_IN_EQ_NEQ, IMPLICIT_CAST, EFFECTIVE_ARG_LIST}
   frozen kernel_expanded_convert (source, destination: TYPE) is
      require
         source.can_be_assigned_to(destination)
      local
         real_source, real_destination: REAL_TYPE_MARK
         integer_source, integer_destination: INTEGER_TYPE_MARK
      do
         if source = destination then
            -- Nothing to do!
         elseif source.is_reference then
            check
               -- No more automatic boxing.
               destination.is_reference
            end
         elseif {REAL_TYPE_MARK} ?:= destination.canonical_type_mark then
            real_destination ::= destination.canonical_type_mark
            if {REAL_TYPE_MARK} ?:= source.canonical_type_mark then
               real_source ::= source.canonical_type_mark
               check
                  real_source.bit_count = 32
                  real_destination.bit_count = 64
               end
               code_attribute.opcode_f2d
            else
               integer_source ::= source.canonical_type_mark
               inspect
                  integer_source.bit_count
               when 8, 16, 32 then
                  inspect
                     real_destination.bit_count
                  when 32 then
                     code_attribute.opcode_i2f
                  when 64 then
                     code_attribute.opcode_i2l
                  end
               when 64 then
                  code_attribute.opcode_l2d
               end
            end
         else
            integer_destination ::= destination.canonical_type_mark
            integer_source ::= source.canonical_type_mark
            inspect
               integer_source.bit_count
            when 8, 16 then
               inspect
                  integer_destination.bit_count
               when 16 then
               when 32 then
               when 64 then
                  code_attribute.opcode_i2l
               end
            when 32 then
               check
                  integer_destination.bit_count = 64
               end
               code_attribute.opcode_i2l
            end
         end
      end

feature {RUN_FEATURE, NATIVE_BUILT_IN}
   add_field (rf: RUN_FEATURE) is
      require
         rf /= Void
      do
         check
            not fields.fast_has(rf)
         end
         fields.add_last(rf)
      ensure
         fields.fast_has(rf)
      end

feature {COMPILE_TO_JVM, JVM_PLUGIN}

   sup_directory: STRING
         -- Superior directory set by the 'prepare_output_directory' routine.

   sub_directory: STRING
         -- Inferior directory set by the 'prepare_output_directory' routine.

feature {JVM_PLUGIN}

   compute_runtime_directory: STRING is
      local
         basic_directory: BASIC_DIRECTORY
         runtime: STRING
      once
         runtime := once "${sys}runtime"
         system_tools.environment_variable_substitution(Void, runtime)
         basic_directory.compute_subdirectory_with(runtime, once "java")
         Result := basic_directory.last_entry.twin
      end

feature {}

   compute_executable_name: STRING is
      once
         Result := ace.executable_name
         if Result = Void then
            Result := ace.root_class_name.to_string.twin
            Result.to_lower
         elseif Result.has_suffix(class_suffix) then
            Result.remove_suffix(class_suffix)
         end
      end

   prepare_output_directory is
         -- A new output directory is created or the content of the old
         -- existing one is cleared.
      require
         smart_eiffel.status.is_safety_checking
      local
         executable_name: STRING; basic_directory: BASIC_DIRECTORY
         ft: FILE_TOOLS; rt, src, cmd, cwd: STRING; cmd_res: INTEGER
         test: BOOLEAN
      do
         smart_eiffel.status.set_generating
         executable_name := compute_executable_name
         sup_directory := executable_name.twin
         basic_directory.compute_subdirectory_with(executable_name, executable_name)
         sub_directory := basic_directory.last_entry.twin

         -- New directory structure is created here

         clean_output_directory

         echo.put_string(once "Trying to prepare directory %"")
         echo.put_string(sup_directory)
         echo.put_string(once "%" to store Java byte code.%N")

         test := basic_directory.create_new_directory(executable_name)

         echo.put_string(once "Creating subdirectory %"")
         echo.put_string(sub_directory)
         echo.put_string(once "%"%N")

         test := basic_directory.create_new_directory(sub_directory)

         -- Copying Runtime

         rt := fz_se_runtime.twin
         rt.append(once ".class")
         src := once ""
         src.append(compute_runtime_directory)
         basic_directory.compute_file_path_with(src, rt)
         src := basic_directory.last_entry.twin

         if ft.is_readable(src) then
            echo.put_string(once "Copying runtime: ")
            echo.put_string(rt)
            echo.put_new_line
            basic_directory.compute_file_path_with(sup_directory, rt)
            ft.copy_to(src, basic_directory.last_entry)
         else
            rt := fz_se_runtime.twin
            rt.append(once ".java")
            src := once ""
            src.append(compute_runtime_directory)
            basic_directory.compute_file_path_with(src, rt)
            src := basic_directory.last_entry.twin
            if not ft.is_readable(src) then
               error_handler.append("Runtime is unavailable")
               error_handler.print_as_fatal_error
            end
            basic_directory.compute_file_path_with(sup_directory, rt)
            ft.copy_to(src, basic_directory.last_entry)
            if ace.java_compiler /= Void then
               cmd := ace.java_compiler.twin
               cmd.append(jvm_tools.get_compiler_flags(cmd))
               cmd.extend(' ')
               cmd.append(rt)
               cwd := basic_directory.current_working_directory.out
               basic_directory.change_current_working_directory(sup_directory)
               cmd_res := echo.system_call(cmd)
               ft.delete(rt)
               basic_directory.change_current_working_directory(cwd)
               if cmd_res /= 0 then
                  error_handler.append("Compilation of runtime failed")
                  error_handler.print_as_fatal_error
               end
            else
               error_handler.append("No external Java compiler found")
               error_handler.print_as_fatal_error
            end
         end
      ensure
         ace.executable_name /= Void
      end

feature {COMPILE_TO_JVM}

   clean_output_directory is
         -- Clear a potential existing output directory.
         --|*** FAIRE UN APPEL SYSTEME A LA COMMANDE clean ***
         --|*** Dom 1 10 2005 *** 
      require
         smart_eiffel.status.is_generating or else smart_eiffel.status.is_done
      local
         test: BOOLEAN
         ft: FILE_TOOLS; basic_directory: BASIC_DIRECTORY; directory: DIRECTORY
         rt, src: STRING; lt: LIVE_TYPE; i: INTEGER
      do
         if ace.hard_clean then

            echo.put_string(once "Try to remove recursively directory '")
            echo.put_string(sup_directory)
            echo.put_string(once "'...")
            echo.put_new_line

            test := basic_directory.remove_recursively(sup_directory)
            if not test then   -- File carring the same name ?
               ft.delete(sup_directory)
            end

         else

            -- Removing Runtime

            rt := fz_se_runtime.twin
            rt.append(once ".class")
            basic_directory.compute_file_path_with(sup_directory, rt)
            src := basic_directory.last_entry.twin

            if ft.file_exists(src) then
               echo.put_string(once "Removing runtime: ")
               echo.put_string(rt)
               echo.put_new_line
               ft.delete(src)
            end

            -- Removing classes

            basic_directory.compute_file_path_with(sup_directory, compute_executable_name)
            src := basic_directory.last_entry
            src.append(once ".class")

            if ft.file_exists(src) then
               echo.put_string(once "Removing class: ")
               echo.put_string(compute_executable_name)
               echo.put_string(once ".class")
               echo.put_new_line
               ft.delete(src)
            end

            basic_directory.compute_file_path_with(sub_directory, once "_any")
            src := basic_directory.last_entry
            src.append(once ".class")

            if ft.file_exists(src) then
               echo.put_string(once "Removing class: _any.class")
               echo.put_new_line
               ft.delete(src)
            end

            from
               i := live_type_map.upper
            until
               i < live_type_map.lower
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then

                  basic_directory.compute_file_path_with(sub_directory, lt.unqualified_name)
                  src := basic_directory.last_entry
                  src.append(once ".class")

                  if ft.file_exists(src) then
                     echo.put_string(once "Removing class: ")
                     echo.put_string(lt.unqualified_name)
                     echo.put_string(once ".class")
                     echo.put_new_line
                     ft.delete(src)
                  end

               end
               i := i - 1
            end

            -- Removing directories

            create directory.scan(sub_directory)
            if directory.count = 2 and then directory.item(1).is_equal(once ".")
               and then directory.item(2).is_equal(once "..") then    --|*** TODO : Fix the is_empty pb *** (CB Sept. 21th 2005) ***
               echo.put_string(once "Removing directory '")
               echo.put_string(sub_directory)
               echo.put_string(once "'")
               echo.put_new_line
               test := basic_directory.remove_directory(sub_directory)
            end

            create directory.scan(sup_directory)
            if directory.count = 2 and then directory.item(1).is_equal(once ".")
               and then directory.item(2).is_equal(once "..") then    --|*** TODO : Fix the is_empty pb *** (CB Sept. 21th 2005) ***
               echo.put_string(once "Removing directory '")
               echo.put_string(sup_directory)
               echo.put_string(once "'")
               echo.put_new_line
               test := basic_directory.remove_directory(sup_directory)
            end

         end

      end

   write_jvm_root_class is
      local
         idx: INTEGER; cp: like constant_pool; ca: like code_attribute
      do
         cp := constant_pool
         ca := code_attribute
         out_file_path.copy(sub_directory) -- New sub-directory
         system_tools.file_path(out_file_path, once "_any")
         out_file_path.append(class_suffix)
         bfw_connect(out_file, out_file_path)
         start_basic
         this_class_idx := cp.idx_class2(jvm_root_class)
         super_class_idx := cp.idx_java_lang_object -- Fields :
         args_field
         manifest_string_pool.jvm_define_fields
         once_routine_pool.jvm_define_fields
         if ace.no_check then
            field_info.add(9, cp.idx_utf8(once "check_flag"), cp.idx_utf8(once "B"))
         end
         -- Methods :
         method_info.add_init(once "java/lang/Object")
         -- The _initialize_eiffel_runtime static method :
         current_frame := Void
         method_info.start(9, once "_initialize_eiffel_runtime", once "([Ljava/lang/String;)V")
         -- Set `args' field to store command line arguments.
         ca.opcode_aload_0
         ca.opcode_putstatic(args_field_idx, -1)
         manifest_string_pool.jvm_initialize_fields
         once_routine_pool.jvm_initialize_fields
         if ace.no_check then
            idx := cp.idx_fieldref3(jvm_root_class, once "check_flag", once "B")
            ca.opcode_iconst_0
            ca.opcode_putstatic(idx, -1)
         end
         ca.opcode_return
         method_info.finish
         idx := cp.idx_class2(once "java/io/Serializable")
         interface_info.add(idx)
         finish_class
      end

   write_main_class (rf3: RUN_FEATURE_3) is
         -- Write Java Byte Code for main class to call `rf3'.
      require
         rf3 /= Void
         smart_eiffel.is_ready
      local
         idx: INTEGER; cp: like constant_pool; ca: like code_attribute
         basic_directory : BASIC_DIRECTORY
      do
         cp := constant_pool
         ca := code_attribute

         basic_directory.compute_file_path_with(ace.executable_name, ace.executable_name)
         out_file_path.copy(basic_directory.last_entry)
         out_file_path.append(class_suffix)
         
         bfw_connect(out_file, out_file_path)
         start_basic
         this_class_idx := cp.idx_class2(ace.executable_name)
         super_class_idx := cp.idx_java_lang_object
         -- Methods :
         --      The main method :
         current_frame := Void
         method_info.add_init(once "java/lang/Object")
         method_info.start(9, once "main", once "([Ljava/lang/String;)V")
         ca.opcode_aload_0
         idx := cp.idx_methodref3(jvm_root_class, once "_initialize_eiffel_runtime", once "([Ljava/lang/String;)V")
         ca.opcode_invokestatic(idx, 0)
         rf3.type_of_current.live_type.jvm_basic_new
         idx := cp.idx_methodref(rf3)
         ca.opcode_invokevirtual(idx, -1)
         ca.opcode_return
         method_info.finish
         finish_class
      end

feature {AGENT_POOL}
   write_super_agent_class is
         -- The deferred one, without attribute and only deferred
         -- wrappers.
      local
         cp: like constant_pool; ca: like code_attribute; executable_name, class_name: STRING
      do
         cp := constant_pool
         ca := code_attribute
         executable_name := ace.executable_name
         out_file_path.copy(executable_name)
         system_tools.file_path(out_file_path, once "_agent")
         out_file_path.append(class_suffix)
         bfw_connect(out_file, out_file_path)
         start_basic
         class_name := executable_name.twin
         class_name.extend('/')
         class_name.append(once "_agent")
         this_class_idx := cp.idx_class2(class_name)
         agent_pool.jvm_define_deferred_methods
         finish_class
      end

   write_agent_class (e_agent: AGENT_CREATION) is
         --|*** THIS IS DEAD CODE TO BE REMOVED ????
         --       D. Colnet (june 7 2003)
         --|*** 
         --|*** local
         --|*** cp: like constant_pool
         --|*** ca: like code_attribute
         --|*** executable_name: STRING
         --|*** class_name,descripteur:STRING
         --|*** i,place:INTEGER
         --|*** arg_courant:EXPRESSION
      do
         --|*** cp := constant_pool
         --|*** ca := code_attribute
         --|*** executable_name:=ace.executable_name
         --|*** out_file_path.copy(executable_name)
         --|*** system_tools.file_path(out_file_path,("_agent" + e_agent.launcher_id.to_string))
         --|*** out_file_path.append(class_suffix)
         --|*** bfw_connect(out_file,out_file_path)
         --|*** start_basic
         --|*** this_class_idx := cp.idx_class2("_agent"+e_agent.launcher_id.to_string)
         --|*** super_class_idx := cp.idx_class2("_agent")
         --|*** class_name:="_agent/_agent"+e_agent.launcher_id.to_string
         --|*** descripteur:=""
         --|*** from
         --|*** i := 1
         --|*** until
         --|*** i>e_agent.arguments.count
         --|*** loop
         --|*** if (e_agent.is_closed_argument(i)) then
         --|*** arg_courant:=e_agent.arguments.expression(i)
         --|*** arg_courant.result_type.jvm_descriptor_in(descripteur)
         --|*** place:=arg_courant.result_type.jvm_stack_space
         --|*** field_info.add(9,cp.idx_utf8(("a"+i.to_string)),cp.idx_utf8(descripteur))
         --|*** ca.opcode_dup
         --|*** end;--if
         --|*** i:=i+1
         --|*** end;--loop
         --|*** agent_pool.ajout_call_full(e_agent.launcher_id)
         --|*** finish_class
      end

feature {CODE_ATTRIBUTE}
   max_locals: INTEGER is
      do
         if current_frame /= Void then
            Result := current_frame.jvm_max_locals
         else
            Result := 4
         end
      end

feature {LIVE_TYPE}
   set_current_frame (cf: like current_frame) is
      do
         current_frame := cf
      end

feature {CP_INFO}
   b_put_u1 (byte: CHARACTER) is
      require
         byte.code.in_range(0, 255)
      do
         out_file.put_byte(byte.code)
      end

feature {CONSTANT_POOL, FIELD_INFO, METHOD_INFO, INTERFACE_INFO, CLASSFILE_ATTRIBUTE}
   b_put_u2 (u2: INTEGER) is
      do
         b_put_u1((u2 // 256).to_character)
         b_put_u1((u2 \\ 256).to_character)
      end

feature {CP_INFO, FIELD_INFO, METHOD_INFO, INTERFACE_INFO}
   b_put_byte_string (str: STRING) is
      require
         str /= Void
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > str.count
         loop
            b_put_u1(str.item(i))
            i := i + 1
         end
      end

feature {NATIVE}
   runtime_invokestatic (location_, module_name_, feature_name_: STRING; rf: RUN_FEATURE) is
         -- Invoke the corresponding one. Assume that target and arguments are already pushed.
      local
         idx, space: INTEGER; fal: FORMAL_ARG_LIST; rt: TYPE_MARK; prototype, full_name: STRING
      do
         fal := rf.arguments
         rt := rf.result_type
         if fal /= Void then
            space := - push_arguments
         end
         prototype := once "(....)."
         prototype.clear_count
         prototype.extend('(')
         if fal /= Void then
            fal.jvm_descriptor_in(prototype)
         end
         prototype.extend(')')
         if rt = Void then
            prototype.extend('V')
         else
            rt.jvm_descriptor_in(prototype)
            space := space + rt.jvm_stack_space
         end
         full_name := once "............"
         full_name.clear_count
         --|*** We should use the `location_' instead ! ***
         --| ... but I keep the old mangling (to be discussed with Cyril).
         --|*** (Dom sept 18th 2004) ***         
         full_name.append(once "fr/loria/smarteiffel/")
         --|*** *****************************
         full_name.append(module_name_)
         idx := constant_pool.idx_methodref3(full_name, feature_name_, prototype)
         code_attribute.opcode_invokestatic(idx, space)
      end

   plugin_invokestatic (module_name_, feature_name_: STRING; rf: RUN_FEATURE) is
         -- Invoke the corresponding one. Assume that target and arguments are already pushed.
      local
         idx, space: INTEGER; fal: FORMAL_ARG_LIST; rt: TYPE_MARK; prototype, full_name: STRING
      do
         fal := rf.arguments
         rt := rf.result_type
         if fal /= Void then
            space := - push_arguments
         end
         prototype := once "(....)."
         prototype.clear_count
         prototype.extend('(')
         if fal /= Void then
            fal.jvm_descriptor_in(prototype)
         end
         prototype.extend(')')
         if rt = Void then
            prototype.extend('V')
         else
            rt.jvm_descriptor_in(prototype)
            space := space + rt.jvm_stack_space
         end
         full_name := once "............"
         full_name.clear_count
         full_name.append(module_name_)
         idx := constant_pool.idx_methodref3(full_name, feature_name_, prototype)
         code_attribute.opcode_invokestatic(idx, space)
      end
   
feature {NATIVE_BUILT_IN}
   push_se_argc is
      local
         ca: like code_attribute
      do
         ca := code_attribute
         ca.opcode_getstatic(args_field_idx, 1)
         ca.opcode_arraylength
         ca.opcode_iconst_1
         ca.opcode_iadd
      end

   push_se_argv is
      local
         point1, point2, i: INTEGER; ca: like code_attribute
      do
         ca := code_attribute
         ca.opcode_getstatic(args_field_idx, 1)
         i := push_ith_argument(1)
         ca.opcode_dup
         point1 := ca.opcode_ifeq
         ca.opcode_iconst_1
         ca.opcode_isub
         ca.opcode_aaload
         point2 := ca.opcode_goto
         ca.resolve_u2_branch(point1)
         ca.opcode_pop2
         i := constant_pool.idx_string(ace.executable_name)
         ca.opcode_ldc(i)
         ca.resolve_u2_branch(point2)
         ca.opcode_java_string2eiffel_string
      end

feature {NON_VOID_NO_DISPATCH}
   invoke_static_0 (type: TYPE; rf: RUN_FEATURE) is
      do
         not_yet_implemented
      end

feature {NATIVE_BUILT_IN}
   has_method_name (n: STRING): BOOLEAN is
      local
         i: INTEGER; rf: RUN_FEATURE
      do
         from
            i := methods.upper
         until
            i < 0 or Result
         loop
            rf := methods.item(i)
            if n = rf.name.to_string then
               Result := True
            end
            i := i - 1
         end
      end

feature {LIVE_TYPE}
   prepare_fields is
      local
         i: INTEGER; rf: RUN_FEATURE
      do
         from
            i := fields.upper
         until
            i < 0
         loop
            rf := fields.item(i)
            rf.jvm_define
            i := i - 1
         end
      end

   prepare_methods is
      local
         i: INTEGER
      do
         from
            i := methods.upper
         until
            i < 0
         loop
            set_current_frame(methods.item(i))
            current_frame.jvm_define
            i := i - 1
         end
      end

   start_new_class (lt: LIVE_TYPE) is
      require
         ace.executable_name /= Void
      local
         name_idx, type_idx: INTEGER; cp: like constant_pool; executable_name: STRING
      do
         classfile_attribute.clear
         cp := constant_pool
         start_basic
         tmp_string.copy(lt.unqualified_name)
         executable_name := sub_directory -- New sub-directory
         out_file_path.copy(executable_name)
         system_tools.file_path(out_file_path, tmp_string)
         out_file_path.append(class_suffix)
         bfw_connect(out_file, out_file_path)
         this_class_idx := lt.jvm_constant_pool_index
         super_class_idx := cp.idx_jvm_root_class
         method_info.add_init(jvm_root_class)
         -- <clinit> :
         method_info.start(9, once "<clinit>", once "()V")
         if smart_eiffel.generating_type_used then
            name_idx := cp.idx_utf8(as_generating_type)
            type_idx := cp.idx_eiffel_string_descriptor
            field_info.add(9, name_idx, type_idx)
            name_idx := cp.idx_fieldref5(this_class_idx, name_idx, type_idx)
            code_attribute.opcode_aconst_null
            code_attribute.opcode_putstatic(name_idx, -1)
         end
         if smart_eiffel.generating_type_used then
            name_idx := cp.idx_utf8(as_generator)
            field_info.add(9, name_idx, type_idx)
            name_idx := cp.idx_fieldref5(this_class_idx, name_idx, type_idx)
            code_attribute.opcode_aconst_null
            code_attribute.opcode_putstatic(name_idx, -1)
         end
         code_attribute.opcode_return
         method_info.finish
         classfile_attribute.set(lt.name.to_string)
      end

   finish_class is
         -- Really print the class file.
      do
         put_magic
         put_minor_version
         put_major_version
         constant_pool.write_bytes
         b_put_u2(access_flags)
         b_put_u2(this_class_idx)
         b_put_u2(super_class_idx)
         -- interfaces_count :
         interface_info.write_bytes
         field_info.write_bytes
         method_info.write_bytes
         -- attributes_count :
         classfile_attribute.write_bytes
         out_file.disconnect
         classfile_attribute.clear
      end

   push_expanded_initialize (rf: RUN_FEATURE) is
      do
         not_yet_implemented
      end

feature {NATIVE}
   inside_twin (cpy: RUN_FEATURE) is
      do
         stack_push(C_inside_twin)
         stack_top.set_type(cpy.type_of_current)         
         stack_top.set_anonymous_feature(cpy.base_feature)
         cpy.mapping_jvm
         pop
      end

feature {CREATE_SUPPORT}
   inside_create_instruction (type: TYPE; rf: RUN_FEATURE; cpc: FEATURE_CALL) is
      require
         rf /= Void
         cpc /= Void
      do
         stack_push(C_create_instruction)
         stack_top.set_type(type)
         stack_top.set_anonymous_feature(rf.base_feature)
         stack_top.set_effective_arguments(cpc.arguments)
         rf.mapping_jvm
         pop
      end

feature {RUN_FEATURE, NATIVE}
   add_method (rf: RUN_FEATURE) is
      require
         rf /= Void
      do
         check
            not methods.fast_has(rf)
         end
         methods.add_last(rf)
      ensure
         methods.fast_has(rf)
      end

   target_position: POSITION is
      local
         code: INTEGER
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call, C_create_instruction then
            Result := stack_top.target.start_position
         end
      end

   push_target is
         -- Produce java byte code in order to push target on the jvm stack.
      local
         code: INTEGER
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            stack_top.target.compile_to_jvm(stack_top.type)
         when C_create_instruction then
            code_attribute.opcode_dup
         when C_inside_twin then
            code_attribute.opcode_aload_1
         end
      end

   push_target_as_target is
         -- Same as `push_target' but with class invariant check and the checkcast opcode.
      local
         target: EXPRESSION; code: INTEGER
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            target := stack_top.target
            target.compile_target_to_jvm(stack_top.type)
         when C_create_instruction then
            code_attribute.opcode_dup
         when C_inside_twin then
            code_attribute.opcode_aload_1
         when C_precursor then
            stack_top.type.canonical_type_mark.jvm_push_local(0)
         end
      end

   drop_target is
      local
         type: TYPE; target: EXPRESSION
      do
         target := stack_top.target
         if target /= Void then
            type := stack_top.type
            if not target.side_effect_free(type) then
               stack_top.target.compile_to_jvm(stack_top.type)
               if stack_top.type.canonical_type_mark.jvm_stack_space = 1 then
                  code_attribute.opcode_pop
               else
                  code_attribute.opcode_pop2
               end
            end
         end
      end

   drop_ith_argument (i: INTEGER) is
      local
         space: INTEGER
      do
         from
            space := push_ith_argument(i)
         until
            space = 0
         loop
            code_attribute.opcode_pop
            space := space - 1
         end
      end

   push_arguments: INTEGER is
      local
         code: INTEGER; af: ANONYMOUS_FEATURE; eal: EFFECTIVE_ARG_LIST; fal: FORMAL_ARG_LIST
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            eal := stack_top.effective_arguments
            if eal /= Void then
               af := stack_top.anonymous_feature
               fal := af.arguments
               Result := eal.compile_to_jvm(stack_top.type, fal)
            end
         when C_create_instruction then
            eal := stack_top.effective_arguments
            if eal /= Void then
               af := stack_top.anonymous_feature
               fal := af.arguments
               Result := eal.compile_to_jvm(stack_top.type, fal)
            end
         when C_inside_twin then
            Result := push_ith_argument(1)
         when C_precursor then
            eal := stack_top.effective_arguments
            if eal /= Void then
               af := stack_top.anonymous_feature
               fal := af.arguments
               Result := eal.compile_to_jvm(stack_top.type, fal)
            end
         end
      end

   arg_count: INTEGER is
      local
         code: INTEGER; eal: EFFECTIVE_ARG_LIST
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            eal := stack_top.effective_arguments
            if eal /= Void then
               Result := eal.count
            end
         when C_create_instruction then
            eal := stack_top.effective_arguments
            if eal /= Void then
               Result := eal.count
            end
         when C_inside_twin then
            Result := 1
         when C_precursor then
            eal := stack_top.effective_arguments
            if eal /= Void then
               Result := eal.count
            end
         end
      end

   push_ith_argument (i: INTEGER): INTEGER is
      local
         code: INTEGER; eal: EFFECTIVE_ARG_LIST; af: ANONYMOUS_FEATURE; fal: FORMAL_ARG_LIST
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            eal := stack_top.effective_arguments
            af := stack_top.anonymous_feature
            fal := af.arguments
            Result := eal.compile_to_jvm_ith(stack_top.type, fal, i)
         when C_create_instruction then
            eal := stack_top.effective_arguments
            af := stack_top.anonymous_feature
            fal := af.arguments
            Result := eal.compile_to_jvm_ith(stack_top.type, fal, i)
         when C_inside_twin then
            code_attribute.opcode_aload_0
            Result := 1
         end
      end

   assign_target (type: TYPE) is
      local
         code: INTEGER
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            stack_top.target.jvm_assign(type)
         when C_create_instruction, C_inside_twin then
            check
               False
            end
         end
      end

   ith_argument_as_manifest_string (i: INTEGER): STRING is
      local
         code: INTEGER; eal: EFFECTIVE_ARG_LIST; ms: MANIFEST_STRING
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            eal := stack_top.effective_arguments
            ms ?= eal.expression(i)
            if ms /= Void then
               Result := ms.to_string
            end
         when C_create_instruction, C_inside_twin then
            check
               False
            end
         end
      end

feature {}
   fields: FAST_ARRAY[RUN_FEATURE] is
      once
         create Result.with_capacity(4)
      end

   methods: FAST_ARRAY[RUN_FEATURE] is
      once
         create Result.with_capacity(64)
      end

   access_flags: INTEGER is 33
         -- To allow any external access.

   this_class_idx: INTEGER

   super_class_idx: INTEGER

   start_basic is
      do
         fields.clear_count
         methods.clear_count
         constant_pool.clear
         interface_info.clear
         field_info.clear
         method_info.clear
         top := -1
      end

   put_magic is
         -- The Magic CAFEBABE ;-)
      do
         b_put_byte_string(once "%/0xCAFEBABE/")
      end

   put_minor_version is
      do
         b_put_u2(3)
      end

   put_major_version is
      do
         b_put_byte_string(once "%/0/%/45/")
      end

   args_field is
         -- Define `args' field to store command line arguments.
      local
         args_idx, jaos_idx: INTEGER; cp: like constant_pool
      do
         cp := constant_pool
         args_idx := cp.idx_utf8(once "args")
         jaos_idx := cp.idx_utf8(once "[Ljava/lang/String;")
         field_info.add(9, args_idx, jaos_idx)
      end

   args_field_idx: INTEGER is
      local
         cp: like constant_pool
      do
         cp := constant_pool
         Result := cp.idx_fieldref3(jvm_root_class, once "args", once "[Ljava/lang/String;")
      end

   out_file: BINARY_FILE_WRITE is
         -- Current output class file.
      once
         create Result.make
      end

   out_file_path: STRING is
      once
         create Result.make(32)
      end

   tmp_string: STRING is
      once
         create Result.make(16)
      end

   opcode_check_id_for (type: TYPE; e: EXPRESSION) is
         -- Produce byte-code for `e' with non-Void check and id
         -- check.
         -- Finally, also add a `checkcast' opcode.
      require
         e.resolve_in(type).live_type.run_time_set.count = 1
      local
         point1, point2: INTEGER; lt: LIVE_TYPE; ca: like code_attribute
      do
         e.compile_to_jvm(type)
         lt := e.resolve_in(type).live_type.run_time_set.first
         if ace.no_check then
            ca := code_attribute
            ca.opcode_dup
            point1 := ca.opcode_ifnull
            ca.opcode_dup
            lt.opcode_instanceof
            point2 := ca.opcode_ifne
            ca.resolve_u2_branch(point1)
            ca.opcode_dup
            ca.runtime_error_bad_target(e.start_position, lt.type, Void)
            ca.resolve_u2_branch(point2)
         end
         lt.opcode_checkcast
      end

   bfw_connect (bfw: BINARY_FILE_WRITE; path: STRING) is
      require
         not bfw.is_connected
         path /= Void
      do
         bfw.connect_to(path)
         if bfw.is_connected then
            echo.put_string(once "Writing %"")
            echo.put_string(path)
            echo.put_string(once "%" file.%N")
         else
            echo.w_put_string("Cannot write file %"")
            echo.w_put_string(path)
            echo.w_put_string(once "%".%N")
            die_with_code(exit_failure_code)
         end
      ensure
         bfw.is_connected
      end

end -- class JVM
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
