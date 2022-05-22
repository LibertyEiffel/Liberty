-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_PRETTY_PRINTER
   --
   -- Singleton in charge of handling C code pretty printing.
   -- This singleton is shared via the GLOBALS.`cpp' once function.
   --

inherit
   CODE_PRINTER
      export
         {PRECURSOR_CALL, C_EXPRESSION_COMPILATION_MIXIN} push_precursor
      end

insert
   PLATFORM
   STRING_HANDLER
   UNICODE_STRING_HANDLER

create {ANY}
   make

feature {ANY} -- Code generators
   header_pass_0: C_HEADER_PASS_0
   header_pass_1: C_HEADER_PASS_1
   header_pass_2: C_HEADER_PASS_2
   header_pass_3: C_HEADER_PASS_3
   header_pass_4: C_HEADER_PASS_4
   live_type_compiler: C_LIVE_TYPE_COMPILER
   mapper: C_MAPPER
   initializer: C_INITIALIZER
   target_mapper: C_TARGET_MAPPER
   arg_mapper: C_ARG_MAPPER
   code_compiler: C_CODE_COMPILER
   compound_expression_compiler: C_COMPOUND_EXPRESSION_COMPILER
   memory: MEMORY_HANDLER
   native_function_mapper: C_NATIVE_FUNCTION_MAPPER
   native_procedure_mapper: C_NATIVE_PROCEDURE_MAPPER
   native_c_definition: C_NATIVE_C_DEFINITION
   introspection_function: C_INTROSPECTION_FUNCTION
   introspection_display: C_INTROSPECTION_DISPLAY

feature {ANY} -- C-related type properties
   target_type: C_TYPE_FOR_TARGET
   result_type: C_TYPE_FOR_RESULT
   external_type: C_TYPE_FOR_EXTERNAL
   argument_type: C_TYPE_FOR_ARGUMENT
   va_arg_type: C_TYPE_FOR_VA_ARG
   need_struct: C_NEED_STRUCT
   native_need_wrapper: C_NATIVE_NEED_WRAPPER

feature {}
   make
      do
         create header_pass_0.make
         create header_pass_1.make
         create header_pass_2.make
         create header_pass_3.make
         create header_pass_4.make
         create live_type_compiler.make
         create mapper.make
         create initializer.make
         create target_mapper.make
         create arg_mapper.make
         create code_compiler.make
         create compound_expression_compiler.make
         create native_function_mapper.make
         create native_procedure_mapper.make
         create native_c_definition.make
         create introspection_function.make
         create introspection_display.make

         create target_type.make
         create result_type.make
         create external_type.make
         create argument_type.make
         create va_arg_type.make
         create need_struct.make
         create native_need_wrapper.make

         create registered_natives.make
      end

feature {SMART_EIFFEL}
   compile
      do
         check
            ace.splitter /= Void
         end
         if nb_errors = 0 then
            check
               smart_eiffel.root_procedure /= Void
            end
            get_started
            check
               smart_eiffel.is_ready
            end
            -- ---------------------------------------------------------
            if ace.boost then
               out_h.put_string(once "#define SE_BOOST 1%N")
            end
            if ace.sedb then
               out_h.put_string(once "#define SE_SEDB 1%N")
            end
            if smart_eiffel.thread_used then
               out_h.put_string(once "#define SE_THREAD 1%N")
            end
            memory.pre_customize_c_runtime
            if exceptions_handler.used then
               out_h.put_string(once "#define SE_EXCEPTIONS 1%N")
            end
            -- ---------------------------------------------------------
            if ace.profile then
               sys_runtime_h_and_c(once "profile")
            end
            -- ---------------------------------------------------------
            smart_eiffel.customize_runtime
            -- ---------------------------------------------------------
            smart_eiffel.show_live_types
            -- ---------------------------------------------------------
            header_pass_0.compile
            header_pass_1.compile
            header_pass_2.compile
            header_pass_3.compile
            header_pass_4.compile
            -- ---------------------------------------------------------
            if not smart_eiffel.is_at_run_time(as_native_array_character) then
               -- Force definition of T9:
               out_h_buffer.copy(once "/*Force definition of non-live NATIVE_ARRAY[CHARACTER] for manifest strings*/%Ntypedef T3* T9;%N")
               write_out_h_buffer
               if ace.no_check then
                  prepare_c_function
                  pending_c_function_signature.append(once "void se_prinT9(FILE* file, T9*o)")
                  pending_c_function_body.append(once "fprintf(file, %"NATIVE_ARRAY[CHARACTER]#%%p\n%",(void*)*o);")
                  dump_pending_c_function(True)
               end
            end
            c_define1_manifest_string_pool
            customize_runtime
            -- ---------------------------------------------------------
            memory.define1
            -- ---------------------------------------------------------
            compile_routines
            cecil_define
            customize_agent_pool_runtime_2
            -- ---------------------------------------------------------
            if ace.sedb then
               prepare_introspection
            end
            -- ---------------------------------------------------------
            split_c_file_padding_here
            c_define2_manifest_string_pool
            memory.define2
            define_main(smart_eiffel.root_procedure)
            c_define_manifest_generic_functions
            c_define_assignment_test_functions
            debug
               echo.put_string(once "Very Final magic_count : ")
               echo.put_integer(smart_eiffel.magic_count)
               echo.put_character('%N')
            end
            write_make_file
            echo_information
         else
            error_handler.append(once "Cannot produce C code.")
            error_handler.print_as_error
         end
      end

feature {}
   live_type_map: TRAVERSABLE[LIVE_TYPE]
      do
         Result := smart_eiffel.live_type_map
      end

   agent_switches: FAST_ARRAY[TYPE]
      do
         Result := smart_eiffel.agent_switches
      end

   agent_creations: FAST_ARRAY[AGENT_CREATION]
      do
         Result := smart_eiffel.agent_creations
      end

   class_invariants: FAST_ARRAY[LIVE_TYPE]
      do
         Result := smart_eiffel.class_invariants
      end

   run_features: FAST_ARRAY[RUN_FEATURE]
      do
         Result := smart_eiffel.run_features
      end

   prepare_introspection
         -- Creates the introspection features
      require
         ace.no_check
      local
         i: INTEGER
      do
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            introspection_function.compile(live_type_map.item(i))
            i := i + 1
         end
      end

   compile_routines
         -- Try to give the best order to the C output.
      require
         smart_eiffel.root_procedure.set_is_root
      local
         lt, lt_string: LIVE_TYPE; ct: TYPE_MARK; depth, i: INTEGER; stop: BOOLEAN; ctn: STRING
         cn, current_class_name: CLASS_NAME
      do
         if ace.no_check then
            echo.put_string(once "Compiling routines for ")
            echo.put_integer(live_type_map.count)
            echo.put_string(once " run classes :%N")
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then
                  cn := lt.class_text_name
                  if cn /= current_class_name then
                     current_class_name := cn
                  end
                  live_type_compiler.compile(lt, 0)
               end
               i := i + 1
            end
         else
            echo.put_string(once "Compiling/Sorting ")
            echo.put_integer(live_type_map.count)
            echo.put_string(once " live TYPEs:%N")
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then
                  ct := lt.canonical_type_mark
                  if ct.is_kernel_expanded then
                     live_type_compiler.compile(lt, 0)
                  elseif ct.is_string then
                     lt_string := lt
                  end
               end
               i := i + 1
            end
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               i := i + 1
            end
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then
                  ctn := lt.class_text_name.to_string
                  if as_native_array = ctn then
                     live_type_compiler.compile(lt, 0)
                  end
               end
               i := i + 1
            end
            if lt_string /= Void then
               if lt_string.at_run_time then
                  live_type_compiler.compile(lt_string, 0)
               end
            end
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then
                  ct := lt.canonical_type_mark
                  ctn := ct.class_text_name.to_string
                  if as_array = ctn or else as_fixed_array = ctn then
                     live_type_compiler.compile(lt, 0)
                  end
               end
               i := i + 1
            end
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time and then lt.is_generic then
                  live_type_compiler.compile(lt, 0)
               end
               i := i + 1
            end
            from
               -- General sorting:
               depth := 8
            variant
               depth + 1
            until
               stop
            loop
               from
                  stop := True
                  i := live_type_map.lower
               until
                  i > live_type_map.upper
               loop
                  lt := live_type_map.item(i)
                  if lt.at_run_time then
                     live_type_compiler.compile(lt, depth)
                     if not live_type_compiler.is_compiled(lt) then
                        stop := False
                     end
                  end
                  i := i + 1
               end
               depth := depth - 1
            end
         end
      end

   show_profile
      require
         ace.profile
      local
         n, i, a, sa: INTEGER
      do
         n := run_features.count
         if class_invariants /= Void then
            i := class_invariants.count
         end
         if agent_creations /= Void then
            a := agent_creations.count
         end
         if agent_switches /= Void then
            sa := agent_switches.count
         end
         pending_c_function_body.append(once "{%N%
                             %FILE *profile_file = fopen(%"profile.se%", %"w%");%N%
                             %if (profile_file!=NULL) {%N%
                             %int i;%N%
                             %se_profile_t sorted_profile[")
         n.append_in(pending_c_function_body)
         if i > 0 then
            pending_c_function_body.append(once "];%Nse_profile_t sorted_inv_profile[")
            i.append_in(pending_c_function_body)
         end
         if a > 0 then
            pending_c_function_body.append(once "];%Nse_profile_t sorted_agent_profile[")
            a.append_in(pending_c_function_body)
         end
         if sa > 0 then
            pending_c_function_body.append(once "];%Nse_profile_t sorted_agent_switch_profile[")
            sa.append_in(pending_c_function_body)
         end
         pending_c_function_body.append(once "];%Nse_profile_t sorted_all_profile[")
         (n + i + a + sa + 3).append_in(pending_c_function_body)

         -- sorting profiles

         pending_c_function_body.append(once "];%Nmemcpy(sorted_profile, profile, ")
         n.append_in(pending_c_function_body)
         pending_c_function_body.append(once "*sizeof(se_profile_t));%Nqsort(sorted_profile, ")
         n.append_in(pending_c_function_body)
         pending_c_function_body.append(once ", sizeof(se_profile_t), profile_comparator);%N")
         pending_c_function_body.append(once "memcpy(sorted_all_profile, profile, ")
         n.append_in(pending_c_function_body)
         pending_c_function_body.append(once "*sizeof(se_profile_t));%N")
         if i > 0 then
            pending_c_function_body.append(once "memcpy(sorted_inv_profile, inv_profile, ")
            i.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*sizeof(se_profile_t));%Nqsort(sorted_inv_profile, ")
            i.append_in(pending_c_function_body)
            pending_c_function_body.append(once ", sizeof(se_profile_t), profile_comparator);%N")
            pending_c_function_body.append(once "memcpy(sorted_all_profile+")
            n.append_in(pending_c_function_body)
            pending_c_function_body.append(once ", inv_profile, ")
            i.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*sizeof(se_profile_t));%N")
         end
         if a > 0 then
            pending_c_function_body.append(once "memcpy(sorted_agent_profile, agent_profile, ")
            a.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*sizeof(se_profile_t));%Nqsort(sorted_agent_profile, ")
            a.append_in(pending_c_function_body)
            pending_c_function_body.append(once ", sizeof(se_profile_t), profile_comparator);%N")
            pending_c_function_body.append(once "memcpy(sorted_all_profile+")
            (n + i).append_in(pending_c_function_body)
            pending_c_function_body.append(once ", agent_profile, ")
            a.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*sizeof(se_profile_t));%N")
         end
         if sa > 0 then
            pending_c_function_body.append(once "memcpy(sorted_agent_switch_profile, agent_switch_profile, ")
            sa.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*sizeof(se_profile_t));%Nqsort(sorted_agent_switch_profile, ")
            sa.append_in(pending_c_function_body)
            pending_c_function_body.append(once ", sizeof(se_profile_t), profile_comparator);%N")
            pending_c_function_body.append(once "memcpy(sorted_all_profile+")
            (n + i + a).append_in(pending_c_function_body)
            pending_c_function_body.append(once ", agent_switch_profile, ")
            sa.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*sizeof(se_profile_t));%N")
         end
         pending_c_function_body.append(once "sorted_all_profile[")
         (n + i + a + sa).append_in(pending_c_function_body)
         pending_c_function_body.append(once "]=root_profile;%N")
         pending_c_function_body.append(once "sorted_all_profile[")
         (n + i + a + sa + 1).append_in(pending_c_function_body)
         pending_c_function_body.append(once "]=runinit_profile;%N")
         pending_c_function_body.append(once "sorted_all_profile[")
         (n + i + a + sa + 2).append_in(pending_c_function_body)
         pending_c_function_body.append(once "]=atexit_profile;%N")
         pending_c_function_body.append(once "qsort(sorted_all_profile, ")
         (n + i + a + sa + 3).append_in(pending_c_function_body)
         pending_c_function_body.append(once ", sizeof(se_profile_t), profile_comparator);%N")

         -- summary

         pending_c_function_body.append(once "fprintf(profile_file, %"===============================================================================\nSummary:\n%");%N")
         pending_c_function_body.append(once "start_sumup_profile(profile_file);%Ni=")
         (n + i + a + sa + 3).append_in(pending_c_function_body)
         pending_c_function_body.append(once ";while (i-->0) {%Nsumup_profile(profile_file, sorted_all_profile+i);%N}%N")

         -- detailed printing

         pending_c_function_body.append(once "fprintf(profile_file, %"\n===============================================================================\nDetailed profile:\n%");%N")
         pending_c_function_body.append(once "start_print_profile(profile_file);%N")
         pending_c_function_body.append(once "print_profile(profile_file, &root_profile);%N")
         pending_c_function_body.append(once "print_profile(profile_file, &runinit_profile);%N")
         pending_c_function_body.append(once "print_profile(profile_file, &atexit_profile);%N")
         pending_c_function_body.append(once "fprintf(profile_file, %"\n-------------------------------------------------------------------------------\n%");%Ni=")
         n.append_in(pending_c_function_body)
         pending_c_function_body.append(once ";while (i-->0) {%Nprint_profile(profile_file, sorted_profile+i);%N}%N")
         if i > 0 then
            pending_c_function_body.append(once "fprintf(profile_file, %"\n-------------------------------------------------------------------------------\n%");%Ni=")
            i.append_in(pending_c_function_body)
            pending_c_function_body.append(once ";while (i-->0) {%Nprint_profile(profile_file, sorted_inv_profile+i);%N}%N")
         end
         if a > 0 then
            pending_c_function_body.append(once "fprintf(profile_file, %"\n-------------------------------------------------------------------------------\n%");%Ni=")
            a.append_in(pending_c_function_body)
            pending_c_function_body.append(once ";while (i-->0) {%Nprint_profile(profile_file, sorted_agent_profile+i);%N}%N")
         end
         if sa > 0 then
            pending_c_function_body.append(once "fprintf(profile_file, %"\n-------------------------------------------------------------------------------\n%");%Ni=")
            sa.append_in(pending_c_function_body)
            pending_c_function_body.append(once ";while (i-->0) {%Nprint_profile(profile_file, sorted_agent_switch_profile+i);%N}%N")
         end

         pending_c_function_body.append(once "fprintf(profile_file, %"\n===============================================================================\n%");%N")
         pending_c_function_body.append(once "fclose(profile_file);}%N")
         pending_c_function_body.append(once "else fprintf(SE_ERR, %"Cannot open profile.se for writing.\n%");%N}%N")
      end

   define_extern_tables
      local
         size: INTEGER
      do
         size := id_provider.max_id + 1
         macro_def(once "SE_MAXID", size)
         if smart_eiffel.generator_used then
            write_extern_array_2(once "T7*g", size)
         end
         if smart_eiffel.generating_type_used then
            write_extern_array_2(once "T7*t", size)
         end
         if ace.boost then
            if memory.may_need_size_table and then smart_eiffel.weak_reference_used then
               initialize_size_table
            end
         else
            write_extern_array_2(once "char*p", size)
            c_code.copy(once "void(*se_prinT[")
            size.append_in(c_code)
            c_code.append(once "])(FILE*,void*)")
            write_extern_1(c_code)
            initialize_size_table
            if ace.sedb then
               c_code.copy(once "void*(*se_introspecT[")
               size.append_in(c_code)
               c_code.append(once "])(void*,char*,int*,int*)")
               write_extern_1(c_code)
               c_code.copy(once "char* se_atT[")
               size.append_in(c_code)
               c_code.append(once "]")
               write_extern_1(c_code)
            end
         end
         if ace.profile then
            write_extern_array_2(once "se_profile_t profile", run_features.count)
            if agent_creations /= Void then
               write_extern_array_2(once "se_profile_t agent_profile", agent_creations.count)
            end
            if agent_switches /= Void then
               write_extern_array_2(once "se_profile_t agent_switch_profile", agent_switches.count)
            end
            if class_invariants /= Void then
               write_extern_array_2(once "se_profile_t inv_profile", class_invariants.count)
            end
            write_extern_1(once "se_profile_t root_profile")
            write_extern_1(once "se_profile_t runinit_profile")
            write_extern_1(once "se_profile_t atexit_profile")
            write_extern_1(once "se_local_profile_t global_profile")
         end
      end

   initialize_size_table
         -- initialize se_strucT
      require
         not smart_eiffel.status.is_analyzing
      local
         i_ltm, i_c, nb_types: INTEGER; a_type: LIVE_TYPE
      do
         nb_types := id_provider.max_id + 1
         out_c_buffer.clear_count
         smart_eiffel.sort_live_type_map
         from
            i_ltm := 0
            i_c := 0
         until
            i_ltm > live_type_map.upper
         loop
            a_type := live_type_map.item(i_ltm)
            from
            until
               i_c >= a_type.id
            loop
               if out_c_buffer.count >= 100 then
                  out_c_buffer.extend('%N')
               end
               out_c_buffer.append(once "0,")
               i_c := i_c + 1
            end
            check
               a_type.id = i_c
            end
            if out_c_buffer.count >= 100 then
               out_c_buffer.extend('%N')
            end
            if a_type.at_run_time then
               out_c_buffer.append(once "sizeof(T")
               i_c.append_in(out_c_buffer)
               out_c_buffer.append(once "),")
            else
               out_c_buffer.append(once "0,")
            end
            i_ltm := i_ltm + 1
            i_c := i_c + 1
         end
         -- last items are automatically zeroed by C compiler
         check
            out_c_buffer.last = ','
         end
         out_c_buffer.remove_last
         write_extern_array_1(once "int se_strucT", nb_types, out_c_buffer)
      ensure
         id_provider.max_id = old id_provider.max_id
      end

   initialize_path_table_of (ct: CLASS_TEXT)
      require
         pending_c_function
      local
         id: INTEGER
      do
         id := ct.id
         if id > 0 then
            pending_c_function_body.append(once "p[")
            id.append_in(pending_c_function_body)
            pending_c_function_body.append(once "]=")
            string_to_c_code(ct.path, pending_c_function_body)
            pending_c_function_body.append(once ";%N")
         end
      end

   initialize_path_table
      require
         ace.no_check
      local
         i: INTEGER; lt: LIVE_TYPE
      do
         pending_c_function_body.append(once "p[0]=%"???%";%N")
         pending_c_function_body.append(once "se_prinT[0]=((void(*)(FILE*,void*))se_prinT0);%N") -- should never be accessed, but in case of bugs it may
         ace.for_all(agent initialize_path_table_of(?))
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               pending_c_function_body.append(once "se_prinT[")
               lt.id.append_in(pending_c_function_body)
               pending_c_function_body.append(once "]=((void(*)(FILE*,void*))se_prinT")
               lt.id.append_in(pending_c_function_body)
               pending_c_function_body.append(once ");%N")
               if lt.is_generic then
                  pending_c_function_body.append(once "p[")
                  lt.id.append_in(pending_c_function_body)
                  pending_c_function_body.append(once "]=p[")
                  lt.class_text.id.append_in(pending_c_function_body)
                  pending_c_function_body.append(once "];%N")
               end
               if ace.sedb then
                  pending_c_function_body.append(once "se_introspecT[")
                  lt.id.append_in(pending_c_function_body)
                  pending_c_function_body.append(once "]=((void*(*)(void*,char*,int*,int*))se_introspecT")
                  lt.id.append_in(pending_c_function_body)
                  pending_c_function_body.append(once ");%N")
                  introspection_display.compile(lt)
               end
            end
            i := i + 1
         end
      end

   initialize_generator_of (ct: CLASS_TEXT)
      require
         pending_c_function
      local
         id: INTEGER; n, a: STRING; ta: TYPE_ALIASING
      do
         id := ct.id
         if id >= 0 then
            array_access('g', id)
            pending_c_function_body.extend('=')
            n := ct.name.to_string
            a := ta.alias_of(n)
            if a /= Void then
               n := a
            end
            se_string(n)
            pending_c_function_body.append(once ";%N")
         end
      end

   initialize_generator
      local
         i: INTEGER; ct: CLASS_TEXT; lt: LIVE_TYPE
      do
         ace.for_all(agent initialize_generator_of(?))
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.generator_used then
               ct := lt.class_text
               if ct.name.hashed_name /= lt.name then
                  array_access('g', lt.id)
                  pending_c_function_body.extend('=')
                  array_access('g', ct.id)
                  pending_c_function_body.append(once ";%N")
               end
            end
            i := i + 1
         end
      end

   initialize_generating_type
      local
         i: INTEGER; lt: LIVE_TYPE; ct: CLASS_TEXT; rtm: STRING
      do
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.generating_type_used then
               array_access('t', lt.id)
               pending_c_function_body.extend('=')
               ct := lt.class_text
               rtm := lt.name.to_string
               if ct.name.to_string /= rtm then
                  se_string(rtm)
               else
                  array_access('g', lt.id)
               end
               pending_c_function_body.append(once ";%N")
            end
            i := i + 1
         end
      end

   initialize_profile
      require
         ace.profile
      local
         i: INTEGER; b: STRING; rf: RUN_FEATURE; lt: LIVE_TYPE; t: TYPE; ac: AGENT_CREATION
      do
         from
            b := once "......................................."
            i := run_features.lower
         until
            i > run_features.upper
         loop
            rf := run_features.item(i)
            pending_c_function_body.append(once "init_profile(profile+")
            i.append_in(pending_c_function_body)
            pending_c_function_body.extend(',')
            b.copy(rf.type_of_current.name.to_string)
            b.extend('.')
            rf.name.complete_name_in(b)
            string_to_c_code(b, pending_c_function_body)
            pending_c_function_body.append(once ");%N")
            i := i + 1
         end
         if class_invariants /= Void then
            from
               b := once ""
               i := class_invariants.lower
            until
               i > class_invariants.upper
            loop
               lt := class_invariants.item(i)
               pending_c_function_body.append(once "init_profile(inv_profile+")
               i.append_in(pending_c_function_body)
               pending_c_function_body.extend(',')
               b.copy(once "invariant of ")
               b.append(lt.name.to_string)
               string_to_c_code(b, pending_c_function_body)
               pending_c_function_body.append(once ");%N")
               i := i + 1
            end
         end
         if agent_creations /= Void then
            from
               b := once ""
               i := agent_creations.lower
            until
               i > agent_creations.upper
            loop
               ac := agent_creations.item(i)
               pending_c_function_body.append(once "init_profile(agent_profile+")
               i.append_in(pending_c_function_body)
               pending_c_function_body.extend(',')
               b.clear_count
               pretty_printer.expression_in(b, ac)
               string_to_c_code(b, pending_c_function_body)
               pending_c_function_body.append(once ");%N")
               i := i + 1
            end
         end
         if agent_switches /= Void then
            from
               b := once ""
               i := agent_switches.lower
            until
               i > agent_switches.upper
            loop
               t := agent_switches.item(i)
               pending_c_function_body.append(once "init_profile(agent_switch_profile+")
               i.append_in(pending_c_function_body)
               pending_c_function_body.extend(',')
               b.copy(once "agents ")
               b.append(t.canonical_type_mark.written_mark)
               string_to_c_code(b, pending_c_function_body)
               pending_c_function_body.append(once ");%N")
               i := i + 1
            end
         end
      end

   c_code: STRING
      once
         create Result.make(128)
      end

feature {ANY} -- Set of features to bufferize the next C function to be generated:
   pending_c_function: BOOLEAN
         -- Indicates that a new C function is being prepared.

   has_closures: BOOLEAN
         -- Indicates that the new C function creates closures (locals are not generated in the same way)

   pending_c_function_signature: STRING
         -- The signature of the `pending_c_function' being prepared.
      once
         create Result.with_capacity(128)
      end

   pending_c_function_body: STRING
         -- The body of the `pending_c_function' being prepared.
      once
         create Result.with_capacity(1024)
      end

   pending_c_function_counter: INTEGER
         -- Changed each time a new `pending_c_function' is generated.

   prepare_c_function
         -- Start the preparation of the next C function. Information about the next function to
         -- generate is bufferized until `dump_pending_c_function' is called.
      require
         not pending_c_function
      do
         pending_c_function := True
         has_closures := False
         pending_c_function_counter := pending_c_function_counter + 1
         function_count_in_file := function_count_in_file + 1
      ensure
         pending_c_function
         pending_c_function_counter = 1 + old pending_c_function_counter
      end

   dump_pending_c_function (shared: BOOLEAN)
         -- Actually dump the `pending_c_function' on `out_h' / `out_c'.
      require
         pending_c_function
      do
         out_c.put_character('%N')
         -- The signature first:
         if shared then
            out_h.put_string(pending_c_function_signature)
            out_h.put_string(once ";%N")
         else
            out_c.put_string(once "static ")
         end
         out_c.put_string(pending_c_function_signature)
         out_c.put_string(once "{%N")
         pending_c_function_signature.clear_count
         internal_c_local_list.declaration_dump(out_c)
         -- Then the body:
         out_c.put_string(pending_c_function_body)
         pending_c_function_body.clear_count
         out_c.put_string(once "}/*--*/%N")
         -- Finally:
         pending_c_function := False
      ensure
         not pending_c_function
      end

   pending_c_function_lock_local (type: TYPE; tag: STRING): INTERNAL_C_LOCAL
         -- Reuse some un-locked variable of the `pending_c_function_locals' or add/create a new one.
         -- When possible, the caller is supposed to call feature `unlock' of INTERNAL_C_LOCAL.
      require
         type /= Void
         tag /= Void
      do
         Result := internal_c_local_list.lock_local(internal_c_local_stamps_stack, type, tag)
      ensure
         Result /= Void
      end

feature {COMPOUND, C_CODE_COMPILER}
   eiffel_parser_stamp_push (eiffel_parser_stamp: INTEGER)
      require
         eiffel_parser_stamp > 0
      do
         internal_c_local_stamps_stack.add_last(eiffel_parser_stamp)
      end

   eiffel_parser_stamp_pop
      do
         internal_c_local_stamps_stack.remove_last
      end

feature {ANY} -- Low-level set of feature to be used when one cannot use the `pending_c_function' mode,
   -- i.e. when one is not defining some code inside some C function:
   out_h_buffer: STRING
         -- Common buffer to write on the *.h file.
      once
         create Result.with_capacity(128)
      end

   write_out_h_buffer
         -- Actually write the `out_h_buffer'.
      do
         out_h.put_string(out_h_buffer)
      end

   out_c_buffer: STRING
         -- Common buffer to write on the *.c file.
      once
         create Result.with_capacity(128)
      end

   write_out_c_buffer
         -- Actually write the `out_c_buffer'.
      do
         out_c.put_string(out_c_buffer)
      end

feature {ANY}
   prepare_memory
      require
         memory = Void
      local
         mhf: MEMORY_HANDLER_FACTORY
      do
         memory := mhf.create_memory_handler
         memory.add_extra_collectors
      ensure
         memory /= Void
      end

feature {SMART_EIFFEL, MANIFEST_STRING_POOL, MEMORY_HANDLER, MANIFEST_GENERIC_POOL}
   split_c_file_padding_here
         -- Must be called only if we are sure that we will output something after that call.
      do
         split_c_file_now(0)
      end

feature {C_COMPILATION_MIXIN}
   assertion_checks_disabled: BOOLEAN

   set_assertion_checks_disabled (i: like assertion_checks_disabled)
      do
         assertion_checks_disabled := i
      ensure
         assertion_checks_disabled = i
      end

   split_c_file_now (features_count: INTEGER)
      do
         if ace.splitter.should_split(features_count + function_count_in_file) then
            ace.splitter.split_now
         end
      end

   set_live_type (a_live_type: LIVE_TYPE)
      do
         ace.splitter.set_live_type(a_live_type)
      end

feature {}
   function_count_in_file: INTEGER

feature {C_SPLITTER}
   begin_c_file
      do
         function_count_in_file := 0
         begin_c_linkage(out_c)
         add_first_include(path_h)
      end

   end_c_file
      do
         if out_c /= Void and then out_c.is_connected then
            end_c_linkage(out_c)
            out_c.disconnect
         end
      end

feature {ANY}
   write_extern_0 (type_variable: STRING)
      do
         out_h.put_string(once "extern ")
         out_h.put_string(type_variable)
         out_h.put_string(once ";%N")
         --
         out_c.put_string(type_variable)
         out_c.put_string(once "=0;%N")
      end

   write_extern_1 (type_variable: STRING)
      do
         out_h.put_string(once "extern ")
         out_h.put_string(type_variable)
         out_h.put_string(once ";%N")
         --
         out_c.put_string(type_variable)
         out_c.put_string(once ";%N")
      end

   write_extern_2 (type_variable: STRING; init: STRING)
      do
         out_h.put_string(once "extern ")
         out_h.put_string(type_variable)
         out_h.put_string(once ";%N")
         --
         out_c.put_string(type_variable)
         out_c.put_character('=')
         out_c.put_string(init)
         out_c.put_string(once ";%N")
      end

   write_extern_array_1 (type_variable: STRING; array_size: INTEGER; array_content: STRING)
      do
         out_h.put_string(once "extern ")
         out_h.put_string(type_variable)
         out_h.put_string(once "[];%N")
         --
         out_c.put_string(type_variable)
         out_c.put_character('[')
         out_c.put_integer(array_size)
         out_c.put_string(once "]={")
         out_c.put_string(array_content)
         out_c.put_string(once "};%N")
      end

   write_extern_array_2 (type_variable: STRING; array_size: INTEGER)
      do
         out_h.put_string(once "extern ")
         out_h.put_string(type_variable)
         out_h.put_string(once "[];%N")
         --
         out_c.put_string(type_variable)
         out_c.put_character('[')
         out_c.put_integer(array_size)
         out_c.put_string(once "];%N")
      end

   put_position (p: POSITION)
      require
         pending_c_function
      do
         pending_c_function_body.append(once "0x")
         p.mangling.to_hexadecimal_in(pending_c_function_body)
         put_position_comment_in(pending_c_function_body, p)
      end

   put_position_in_ds (p: POSITION)
      require
         pending_c_function
      do
         pending_c_function_body.append(once "ds.p=")
         put_position(p)
         pending_c_function_body.append(once ";%N")
      end

   put_target_as_target (target_formal_type: TYPE)
         -- Produce C code to pass the current stacked target as a target of a new call: user expanded are
         -- passed by address and class invariant code is produced.
         -- ***
         -- *** Choisir un nouveau nom pour cette methode et voir si *** stack_top.static_type ***
         -- *** sert encore. Dom April 30 th 2008 ***
      require
         smart_eiffel.is_ready
      local
         code: INTEGER; type: TYPE; target: EXPRESSION
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            target := stack_top.target
            type := stack_top.type
            target_mapper.compile(target, type, target_formal_type)
         else
            common_put_target
         end
      end

   put_target_as_value
         -- Produce C code for a simple access to the stacked target.
         -- User's expanded values are not given using a pointer.
         -- There is no C code to check the class invariant.
      require
         smart_eiffel.is_ready
      local
         code: INTEGER
      do
         code := stack_top.code
         inspect
            code
         when C_direct_call then
            code_compiler.compile(stack_top.target, stack_top.type)
         else
            common_put_target
         end
      end

   put_error0 (msg: STRING)
         -- Print `msg' and then stop execution. Also print stack when not -boost.
      require
         pending_c_function
      do
         if ace.boost then
            pending_c_function_body.append(once "/*")
            pending_c_function_body.append(msg)
            pending_c_function_body.append(once "*/%Nse_signal_handler(14/*System_level_type_error*/);%N")
         else
            pending_c_function_body.append(once "error0(")
            string_to_c_code(msg, pending_c_function_body)
            pending_c_function_body.append(once ",NULL);%N")
         end
      end

   put_position_comment (p: POSITION)
      require
         pending_c_function
      do
         put_position_comment_in(pending_c_function_body, p)
      end

   define_main (rf3: RUN_FEATURE_3)
      do
         -- Declare eiffel_root_object :
         out_h_buffer.clear_count
         out_h_buffer.extend('T')
         rf3.type_of_current.live_type.id.append_in(out_h_buffer)
         out_h_buffer.append(once "*eiffel_root_object")
         write_extern_2(out_h_buffer, once "(void*)0")
         -- Save argv argc :
         write_extern_1(once "int se_argc")
         write_extern_1(once "char**se_argv")
         define_initialize_eiffel_runtime(rf3)
         if not ace.no_main then
            really_define_c_main(rf3)
         end
      end

feature {}
   se_string (c_string: STRING)
      require
         pending_c_function
      do
         pending_c_function_body.append(once "(T7*)se_string(")
         if ace.no_check then
            pending_c_function_body.append(once "&ds,")
         end
         if ace.profile then
            pending_c_function_body.append(once "&local_profile,")
         end
         c_string.count.append_in(pending_c_function_body)
         pending_c_function_body.extend(',')
         string_to_c_code(c_string, pending_c_function_body)
         pending_c_function_body.extend(')')
      end

   array_access (array_name: CHARACTER; value: INTEGER)
      require
         pending_c_function
      do
         pending_c_function_body.extend(array_name)
         pending_c_function_body.extend('[')
         value.append_in(pending_c_function_body)
         pending_c_function_body.extend(']')
      end

   get_started
      require
         smart_eiffel.status.is_safety_checking
      do
         system_tools.next_path
         smart_eiffel.status.set_generating
         internal_c_local_stamps_stack.add_last(1)
         echo.file_removing(path_make)
         top := -1
         ace.splitter.connect(path_c)
         h_connect(path_h)
         begin_c_linkage(out_h)
         put_banner(out_h)
         out_h.put_character('%N')
         sys_runtime_h_and_c(once "base")
      end

   echo_information
      do
         echo.print_count(once "Procedure", procedure_count)
         echo.print_count(once "Function", function_count)
         echo.print_count(once "Procedure without Current", real_procedure_count)
         echo.print_count(once "Function without Current", real_function_count)
         echo.print_count(once "Precursor routine", precursor_routine_count)
         internal_c_local_list.echo_information
         echo.put_string(once "Internal stacks size used: ")
         echo.put_integer(context_stack.count)
         echo.put_character('%N')
         smart_eiffel.echo_polymorphic_inspect_distribution(once "during C code generation (backend)")
         memory.echo_information
      end

   customize_runtime
      do
         if ace.no_check then
            sys_runtime_h_and_c(fz_no_check)
            if ace.sedb then
               write_extern_0(once "int se_general_trace_switch")
               sys_runtime_h_and_c(once "sedb")
            end
         else
            sys_runtime_h_and_c(fz_boost)
         end
         exceptions_handler.customize_c_runtime
         memory.customize_c_runtime
         customize_agent_pool_runtime_1
         if smart_eiffel.deep_features_used then
            sys_runtime_h_and_c(as_deep_twin)
         end
         if smart_eiffel.thread_used then
            sys_runtime_h_and_c(once "thread")
            system_tools.add_pthread_lib
            customize_thread_pool_runtime
         end
         if ace.profile then
            system_tools.add_lib_profile
            system_tools.add_lib_math
         end
      end

feature {C_LIVE_TYPE_COMPILER}
   defined_agent_creation: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(32)
      end

feature {} -- Threading
   customize_thread_pool_runtime
      require
         not pending_c_function
         smart_eiffel.thread_used
      local
         i, n: INTEGER; type, status_type: TYPE; call: EXPRESSION
         fs_status: FEATURE_STAMP
      do
         n := thread_pool.count
         if n > 0 and then ace.profile then
            echo.w_put_line("Threads don't support profile! Feel free to contribute.")
            crash
         end

         echo.print_count(once "Thread root function", n)

         from
            i := 1
         until
            i > n
         loop
            type := thread_pool.type(i)
            call := thread_pool.call(i)
            fs_status := type.feature_stamp_of(fs_status_name)
            status_type := fs_status.anonymous_feature(type).result_type.resolve_in(type)

            prepare_c_function
            pending_c_function_signature.copy(once "void thread_run")
            type.id.append_in(pending_c_function_signature)
            pending_c_function_signature.append(once "(/*thread context*/T")
            type.id.append_in(pending_c_function_signature)
            pending_c_function_signature.append(once "*C,void(*signal)(void*),void*sigdata)")

            pending_c_function_body.append(result_type.for(status_type.canonical_type_mark))
            if pending_c_function_body.last /= '*' then
               pending_c_function_body.extend(' ')
            end
            pending_c_function_body.append("R=")
            pending_c_function_body.append(initializer.for(type.canonical_type_mark))
            pending_c_function_body.append(once ";%N")

            pending_c_function_body.append(once "T0*_tuple_args=(void*)0;%N")

            if ace.no_check then
               pending_c_function_body.append(once "[
                                                    se_frame_descriptor fd={"<thread root>",0,0,"",1};
                                                    se_dump_stack ds;
                                                    ds.fd=&fd;
                                                    ds.p=0;
                                                    ds.caller=NULL;
                                                    ds.exception_origin=NULL;
                                                    ds.locals=NULL;
                                                    ds.depth=0;

                                                    se_dst=&ds;

                                                    ]")
            end

            memory.initialize_thread
            pending_c_function_body.append(once "*(volatile T6*)&(C->_is_started)=1;%N%
                                                %signal(sigdata);%N")

            if call /= Void then
               compound_expression_compiler.compile(once "R=", call, once ";%N", type)
            end

            pending_c_function_body.append(once "*(volatile ")
            pending_c_function_body.append(result_type.for(status_type.canonical_type_mark))
            pending_c_function_body.append(once "*)&(C->_status)=R;%N%
                                                %*(volatile T6*)&(C->_is_finished)=1;%N")

            dump_pending_c_function(True)

            i := i + 1
         end
      end

   fs_status_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_status)
      end

feature {}
   customize_agent_pool_runtime_1
      local
         boost: BOOLEAN
      do
         boost := ace.boost
         if agent_pool.agent_creation_collected_flag then
            out_h_buffer.copy(once "/*The generic se_agent0 definition:*/%N%
                                   %struct _se_agent0{%N%
                                   %Tid id;%N%
                                   %Tid creation_mold_id;%N%
                                   %void(*afp)(")
            if not boost then
               out_h_buffer.append(once "se_dump_stack*,")
            end
            if ace.profile then
               out_h_buffer.append(once "se_local_profile_t*,")
            end
            out_h_buffer.append(once "se_agent*);%N")
            memory.define_agent_data_0
            out_h_buffer.append(once "int(*eq)(se_agent*,se_agent*);%N};%N")
            write_out_h_buffer
         end
      end

   customize_agent_pool_runtime_2
      require
         not pending_c_function
      local
         i: INTEGER; mold_id: STRING; agent_args: AGENT_ARGS
      do
         if agent_pool.agent_creation_collected_flag then
            echo.print_count(once "Agent call wrapper", agent_pool.launcher_collected_memory.count)
            from
               i := agent_pool.launcher_collected_memory.lower
            until
               i > agent_pool.launcher_collected_memory.upper
            loop
               agent_args := agent_pool.launcher_collected_memory.item(i)
               agent_pool.agent_definition_set.add(agent_args.signature)
               define_agent_launcher_args(agent_args)
               i := i + 1
            end

            out_h_buffer.copy(once "union _se_agent{T0 s0;se_agent0 u0;%N")
            from
               i := defined_agent_creation.lower
            until
               i > defined_agent_creation.upper
            loop
               mold_id := defined_agent_creation.item(i)
               out_h_buffer.append(once "se_")
               out_h_buffer.append(mold_id)
               out_h_buffer.append(once " u")
               out_h_buffer.append(mold_id)
               out_h_buffer.append(once ";%N")
               i := i + 1
            end
            out_h_buffer.append(once "};%N")
            write_out_h_buffer

            sys_runtime_h_and_c(once "agents")
         end
      end

   define_agent_launcher_args (agent_args: AGENT_ARGS)
      do
         prepare_c_function
         define_agent_launcher_heading(agent_args, once "(live)")
         if agent_args.agent_result /= Void then
            pending_c_function_body.append(result_type.for(agent_args.agent_result.canonical_type_mark))
            if pending_c_function_body.last /= '*' then
               pending_c_function_body.extend(' ')
            end
            pending_c_function_body.append("R=")
            if agent_args.agent_result.is_reference then
               pending_c_function_body.append(once "NULL;%N")
            else
               pending_c_function_body.append(once "M")
               agent_args.agent_result.live_type.id.append_in(pending_c_function_body)
               pending_c_function_body.append(once ";%N")
            end
         end
         if ace.profile then
            local_profile
            start_profile_agent_switch(agent_args.agent_type)
         end
         agent_pool_switch_in(pending_c_function_body, agent_args, agent_args.agent_type, agent_args.agent_result)
         if ace.profile then
            stop_profile
         end
         if agent_args.agent_result /= Void then
            pending_c_function_body.append(once "return R;%N")
         end
         dump_pending_c_function(True)
      end

   define_agent_launcher_heading (agent_args: AGENT_ARGS; tag: STRING)
      local
         i: INTEGER; ar: TYPE; open: ARRAY[TYPE]
      do
         echo.put_string(once "Defining ")
         echo.put_string(tag)
         echo.put_string(once " agent wrapper: ")
         echo.put_string(agent_args.signature)
         echo.put_string(once "%N")
         ar := agent_args.agent_result
         if ar = Void then
            pending_c_function_signature.append(once "void")
         else
            pending_c_function_signature.append(result_type.for(ar.canonical_type_mark))
         end
         pending_c_function_signature.extend(' ')
         pending_c_function_signature.append(agent_args.signature)
         pending_c_function_signature.extend('(')
         if not ace.boost then
            pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         pending_c_function_signature.append(once "/*agent*/T0*a")
         open := agent_args.agent_type.open_arguments
         if open /= Void then
            from
               i := open.lower
            until
               i > open.upper
            loop
               pending_c_function_signature.extend(',')
               pending_c_function_signature.append(argument_type.for(open.item(i).canonical_type_mark))
               pending_c_function_signature.extend(' ')
               pending_c_function_signature.extend('a')
               i.append_in(pending_c_function_signature)
               i := i + 1
            end
         end
         pending_c_function_signature.extend(')')
      end

   agent_pool_switch_in (buffer: STRING; agent_args: AGENT_ARGS; launcher_type, agent_result: TYPE)
      require
         agent_result = launcher_type.agent_result
      local
         mold_id: STRING; type_idx, agent_creation_idx, idx: INTEGER
         agent_creation_list: FAST_ARRAY[AGENT_CREATION]; agent_creation: AGENT_CREATION
         type, agent_creation_type: TYPE; need_switch: BOOLEAN
      do
         pending_c_function_body.append(once "/*")
         pending_c_function_body.append(agent_args.agent_type.name.to_string)
         pending_c_function_body.append(once "*/")
         need_switch := not (ace.boost and then agent_pool_has_only_one_case_for(launcher_type, agent_result))
         if need_switch then
            pending_c_function_body.append(once "switch(((se_agent0*)a)->creation_mold_id){%N")
         end
         from
            type_idx := agent_pool.creation_collected_memory.lower
         until
            type_idx > agent_pool.creation_collected_memory.upper
         loop
            type := agent_pool.creation_collected_memory.key(type_idx)
            agent_creation_list := agent_pool.creation_collected_memory.item(type_idx)
            from
               agent_creation_idx := agent_creation_list.lower
            until
               agent_creation_idx > agent_creation_list.upper
            loop
               agent_creation := agent_creation_list.item(agent_creation_idx)
               agent_creation_type := agent_creation.resolve_in(type)
               if agent_creation_type.can_be_assigned_to(launcher_type) then
                  mold_id := once "..........................."
                  mold_id.clear_count
                  agent_creation.mold_id_in(type, mold_id)
                  idx := defined_agent_creation.first_index_of(mold_id)
                  if defined_agent_creation.valid_index(idx) then
                     if need_switch then
                        buffer.append(once "case ")
                        idx.append_in(buffer)
                        buffer.append(once ":%N")
                        agent_pool_call_in(buffer, mold_id, launcher_type, agent_result, agent_creation_type)
                        buffer.append(once "break;%N")
                     else
                        agent_pool_call_in(buffer, mold_id, launcher_type, agent_result, agent_creation_type)
                     end
                  end
               end
               agent_creation_idx := agent_creation_idx + 1
            end
            type_idx := type_idx + 1
         end
         if not ace.boost then
            check
               need_switch
            end
            pending_c_function_body.append(once "default:%Nerror0(%"Internal error in agent launcher (")
            pending_c_function_body.append(agent_args.agent_type.name.to_string)
            pending_c_function_body.append(once ").%",NULL);%N")
         end
         if need_switch then
            pending_c_function_body.append(once "}%N")
         end
      end

   agent_pool_has_only_one_case_for (launcher_type, agent_result: TYPE): BOOLEAN
      require
         ace.boost
      local
         mold_id: STRING; type_idx, agent_creation_idx, idx: INTEGER
         agent_creation_list: FAST_ARRAY[AGENT_CREATION]; agent_creation: AGENT_CREATION
         type, agent_creation_type: TYPE
         count: INTEGER
      do
         from
            type_idx := agent_pool.creation_collected_memory.lower
         until
            type_idx > agent_pool.creation_collected_memory.upper or else count > 1
         loop
            type := agent_pool.creation_collected_memory.key(type_idx)
            agent_creation_list := agent_pool.creation_collected_memory.item(type_idx)
            from
               agent_creation_idx := agent_creation_list.lower
            until
               agent_creation_idx > agent_creation_list.upper or else count > 1
            loop
               agent_creation := agent_creation_list.item(agent_creation_idx)
               agent_creation_type := agent_creation.resolve_in(type)
               if agent_creation_type.can_be_assigned_to(launcher_type) then
                  mold_id := once "..........................."
                  mold_id.clear_count
                  agent_creation.mold_id_in(type, mold_id)
                  idx := defined_agent_creation.first_index_of(mold_id)
                  if defined_agent_creation.valid_index(idx) then
                     count := count + 1
                  end
               end
               agent_creation_idx := agent_creation_idx + 1
            end
            type_idx := type_idx + 1
         end
         Result := count < 2
      end

   agent_pool_call_in (buffer, mold_id: STRING; launcher_type, agent_result, agent_creation_type: TYPE)
      require
         agent_creation_type.can_be_assigned_to(launcher_type)
      local
         open_args: ARRAY[TYPE]
         arg_idx, open_count: INTEGER
      do
         if agent_result /= Void then
            buffer.append(once "R=(")
            buffer.append(result_type.for(agent_result.canonical_type_mark))
            buffer.append(once ")(")
         end
         buffer.append(once "((se_")
         buffer.append(mold_id)
         buffer.append(once "*)a)->afp(")
         if not ace.boost then
            buffer.append(once "caller,")
         end
         if ace.profile then
            buffer.append(once "&local_profile,")
         end
         buffer.append(once "((/*agent*/void*)a)")
         open_args := agent_creation_type.open_arguments
         if open_args /= Void then
            open_count := open_args.count
            from
               arg_idx := 1
            until
               arg_idx > open_count
            loop
               buffer.append(once ",a")
               arg_idx.append_in(buffer)
               arg_idx := arg_idx + 1
            end
         end
         buffer.extend(')')
         if agent_result /= Void then
            buffer.extend(')')
         end
         buffer.append(once ";%N")
      end

feature {C_COMPILATION_MIXIN}
   target_cannot_be_dropped: BOOLEAN
         -- True when top target cannot be dropped because we are not sure that
         -- target is non Void or that target has no side effects. When Result is True,
         -- printed C code is : "(((void)(<target>))"
      require
         smart_eiffel.is_ready
      local
         target: EXPRESSION; type, type_of_target: TYPE
      do
         inspect
            stack_top.code
         when C_direct_call then
            target := stack_top.target
            type := stack_top.type
            type_of_target := target.resolve_in(type)
            Result := not target.side_effect_free(type)
            if Result then
               pending_c_function_body.append(once "((/*UT*/(void)(")
               if type_of_target = Void then
                  --|*** How can it be Void ?? (Dom march 29th2004) ***
                  put_target_as_target(type_of_target)
               elseif type_of_target.is_user_expanded then
                  put_target_as_value
               else
                  put_target_as_target(type_of_target)
               end
               pending_c_function_body.append(once "))")
            end
         else
         end
      end

   arguments_cannot_be_dropped: BOOLEAN
         -- True when arguments cannot be dropped. Printed C code looks like:
         --  "(((void)<exp1>), ((void)<exp2>), ...((void)<expN>)"
      local
         args: EFFECTIVE_ARG_LIST; arg: EXPRESSION; i: INTEGER
      do
         inspect
            stack_top.code
         when C_direct_call, C_create_instruction then
            args := stack_top.effective_arguments
            if args = Void then
               -- Nothing to generate.
            else
               from
                  i := 1
               until
                  i > args.count
               loop
                  arg := args.expression(i)
                  if not arg.side_effect_free(stack_top.type) then
                     if not Result then
                        Result := True
                        pending_c_function_body.append(once "(/*UA*/((void)(")
                     else
                        pending_c_function_body.append(once ",((void)(")
                     end
                     put_ith_argument(i)
                     pending_c_function_body.append(once "))")
                  end
                  i := i + 1
               end
            end
         else
            -- Nothing to generate.
         end
      end

   cannot_drop_all: BOOLEAN
         -- Result is True when something (target or one argument)
         -- cannot be dropped. Thus when something cannot be dropped,
         -- Result is True and C code is printed :
         --  "(((void)<exp1>), ((void)<exp2>), ...((void)<expN>)"
      do
         if target_cannot_be_dropped then
            Result := True
            pending_c_function_body.extend(',')
            if arguments_cannot_be_dropped then
               pending_c_function_body.extend(')')
            else
               pending_c_function_body.extend('0')
            end
         else
            Result := arguments_cannot_be_dropped
         end
      end

feature {ANY}
   put_arguments (arguments_count: INTEGER)
         -- Produce code to access to the whole effective arguments list.
      require
         smart_eiffel.is_ready
         arguments_count > 0
         current_call_has_arguments: stack_top.effective_arguments /= Void
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > arguments_count
         loop
            put_ith_argument(i)
            if i < arguments_count then
               pending_c_function_body.extend(',')
            end
            i := i + 1
         end
      end

   put_ith_argument (index: INTEGER)
         -- Produce code to access to the ith argument.
      require
         smart_eiffel.is_ready
         index >= 1
         current_call_has_arguments: stack_top.effective_arguments /= Void
      local
         code: INTEGER; fal: FORMAL_ARG_LIST; type: TYPE
      do
         code := stack_top.code
         inspect
            code
         when C_create_expression, C_inside_some_wrapper, C_cecil_create then
            pending_c_function_body.extend('a')
            index.append_in(pending_c_function_body)
         when C_inside_twin then
            check
               index = 1
            end
            if stack_top.type.is_reference then
               pending_c_function_body.append(once "((T0*)C)")
            else
               pending_c_function_body.append(once "*C")
            end
         when C_create_instruction, C_direct_call, C_precursor then
            fal := stack_top.anonymous_feature.arguments
            type := stack_top.type
            args_compile_to_c_ith(type, stack_top.effective_arguments, fal, index)
         end
      end

feature {C_EXPRESSION_COMPILATION_MIXIN}
   args_compile_to_c_ith (type: TYPE; args: EFFECTIVE_ARG_LIST; fal: FORMAL_ARG_LIST; index: INTEGER)
         -- Produce C code for expression `index'.
      require
         args /= Void and then args.count = fal.count
         args /= Void and then index.in_range(1, args.count)
      local
         e: EXPRESSION; boolean_cast_flag: BOOLEAN
      do
         e := args.expression(index)
         if e.is_void then
            arg_mapper.compile(e, type)
         else
            boolean_cast_flag := e.resolve_in(type).is_boolean
            if boolean_cast_flag then
               pending_c_function_body.append(once "(T6)(")
            end
            arg_mapper.compile(e, type)
            if boolean_cast_flag then
               pending_c_function_body.extend(')')
            end
         end
      end

feature {C_COMPILATION_MIXIN}
   put_c_inline_h(code: STRING)
      do
         if not c_inline_h_mem.fast_has(code) then
            c_inline_h_mem.add_last(code)
            out_h.put_string(code)
            out_h.put_character('%N')
         end
      end

   put_trace_switch
         -- The {ANY}.trace_switch feature
      require
         pending_c_function
      do
         if ace.sedb then
            pending_c_function_body.append(once "se_general_trace_switch=(")
            put_ith_argument(1)
            pending_c_function_body.append(once ");%N")
         end
      end

   put_sedb_breakpoint
      require
         pending_c_function
      local
         target: EXPRESSION; p: POSITION
      do
         if ace.sedb then
            inspect
               stack_top.code
            when C_direct_call then
               target := stack_top.target
               if target /= Void then
                  p := target.start_position
               end
            when C_inside_some_wrapper then
               -- Well, we cannot put an `sedb_breakpoint' here.
            when C_inside_twin, C_create_instruction, C_create_expression, C_precursor, C_cecil_create then
               check
                  False
               end
            end
            if not p.is_unknown then
               pending_c_function_body.append(once "sedb_breakpoint(&ds,")
               put_position(p)
               pending_c_function_body.append(once ");%N")
            end
         end
      end

   put_target_generating_type (type_of_current: TYPE)
      require
         pending_c_function
      local
         live_type_of_current: LIVE_TYPE
      do
         live_type_of_current := type_of_current.live_type
         pending_c_function_body.append(once "(T0*)(t[")
         if type_of_current.is_reference then
            if live_type_of_current.is_tagged then
               pending_c_function_body.extend('(')
               put_target_as_value
               pending_c_function_body.append(once ")->id")
            else
               live_type_of_current.id.append_in(pending_c_function_body)
            end
         else
            live_type_of_current.id.append_in(pending_c_function_body)
         end
         pending_c_function_body.append(once "])")
      end

   put_target_generator (type_of_current: TYPE)
      require
         pending_c_function
      local
         live_type_of_current: LIVE_TYPE
      do
         live_type_of_current := type_of_current.live_type
         pending_c_function_body.append(once "(T0*)(g[")
         if type_of_current.is_reference then
            if live_type_of_current.is_tagged then
               pending_c_function_body.extend('(')
               put_target_as_value
               pending_c_function_body.append(once ")->id")
            else
               live_type_of_current.id.append_in(pending_c_function_body)
            end
         else
            live_type_of_current.id.append_in(pending_c_function_body)
         end
         pending_c_function_body.append(once "])")
      end

   target_position_in_error_handler
         -- Add the target position into the `error_handler'.
      local
         target: EXPRESSION
      do
         target := stack_top.target
         if target /= Void then
            error_handler.add_position(target.start_position)
         end
      end

   put_object_size (t: TYPE)
      require
         pending_c_function
         t /= Void
      local
         tcbd: BOOLEAN
      do
         tcbd := target_cannot_be_dropped
         if tcbd then
            pending_c_function_body.extend(',')
         end
         pending_c_function_body.append(once "sizeof(T")
         t.live_type.id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "/*")
         pending_c_function_body.append(t.live_type.structure_signature)
         pending_c_function_body.append(once "*/)")
         if tcbd then
            pending_c_function_body.extend(')')
         end
      end

feature {CECIL_FILE}
   connect_cecil_out_h (user_path_h: STRING)
      do
         create out_h.make
         echo.tfw_connect(out_h, user_path_h)
         out_h.put_string(once "#ifdef _BASE_H%N%
                               %#define _HAD_BASE_H%N%
                               %#endif%N")
         system_tools.mandatory_sys_runtime(once "base", 'h')
         put_file(tmp_file_read, out_h)
         out_h.put_string(once "#ifndef _HAD_BASE_H%N%
                               %extern void*eiffel_root_object;%N%N%
                               %typedef T3*T9;%N%
                               %#endif%N%
                               %/* Available Eiffel routines via -cecil:%N*/%N")
      end

   disconnect_cecil_out_h
      do
         out_h.disconnect
      end

feature {C_MAPPER}
   use_c_function_call_for_attribute_read: BOOLEAN
      require
         not ace.boost
      local
         e: EXPRESSION
      do
         inspect
            stack_top.code
         when C_direct_call then
            e := stack_top.target
            Result := not (e.is_current or assertion_checks_disabled)
         when C_inside_twin, C_inside_some_wrapper, C_create_instruction, C_create_expression, C_precursor, C_cecil_create then
            Result := False
         end
      end

feature {C_COMPILATION_MIXIN}
   push_inside_some_wrapper (af: ANONYMOUS_FEATURE)
      do
         stack_push(C_inside_some_wrapper)
         stack_top.set_anonymous_feature(af)
      end

   push_create_expression (type: TYPE; fs: FEATURE_STAMP; internal_c_local: INTERNAL_C_LOCAL)
      require
         type /= Void
         fs /= Void
      local
         rf: RUN_FEATURE
      do
         stack_push(C_create_expression)
         stack_top.set_type(type)
         rf := fs.run_feature_for(type)
         stack_top.set_static_type(rf.type_of_current)
         stack_top.set_internal_c_local(internal_c_local)
      end

   push_cecil_create (type: TYPE; rf: RUN_FEATURE)
      do
         stack_push(C_cecil_create)
         stack_top.set_type(type)
         stack_top.set_static_type(rf.type_of_current)
      end

feature {CREATE_INSTRUCTION, LOCAL_VAR_LIST, ONCE_ROUTINE_POOL, CECIL_POOL, C_COMPILATION_MIXIN}
   push_create_instruction (type: TYPE; rf: RUN_FEATURE; args: EFFECTIVE_ARG_LIST; internal_c_local: INTERNAL_C_LOCAL)
         -- Where `internal_c_local' holds the newly allocated object.
      require
         type /= Void
         rf /= Void
      do
         stack_push(C_create_instruction)
         stack_top.set_type(type)
         stack_top.set_anonymous_feature(rf.base_feature)
         stack_top.set_effective_arguments(args)
         stack_top.set_static_type(rf.type_of_current)
         stack_top.set_internal_c_local(internal_c_local)
      end

feature {C_COMPILATION_MIXIN}
   inside_twin (type: TYPE; cpy: RUN_FEATURE)
      require
         type /= Void
         cpy /= Void
      do
         stack_push(C_inside_twin)
         stack_top.set_type(cpy.type_of_current)
         mapper.compile(cpy)
         pop
      end

feature {C_COMPILATION_MIXIN}
   check_assertion (type: TYPE; e: EXPRESSION; check_assertion_mode, tag_name: STRING)
         -- Produce a standard C instruction to check a mandatory ASSERTION.
      require
         pending_c_function
         e.resolve_in(type).is_boolean
         avoid_useless_code: not ({E_TRUE} ?:= e)
                                             not check_assertion_mode.is_empty
                                             not tag_name.is_empty
      local
         continue, finish: STRING
      do
         continue := once "........"
         continue.copy(check_assertion_mode)
         continue.extend('(')

         finish := once "................................"
         finish.copy(once ",")
         string_to_c_code(tag_name, finish)
         finish.append(once ");%N")

         compound_expression_compiler.compile(continue, e, finish, type)
      end

   inspect_local_push (expression: EXPRESSION)
      do
         inspect_local_stack.push(expression)
      end

   inspect_local_pop
      do
         inspect_local_stack.pop
      end

   inspect_local_compile_to_c (type: TYPE)
      do
         code_compiler.compile(inspect_local_stack.top, type)
      end

   inspect_local_type (type: TYPE)
      do
         pending_c_function_body.extend('T')
         inspect_local_stack.top.resolve_in(type).id.append_in(pending_c_function_body)
         pending_c_function_body.extend('*')
      end

feature {}
   inspect_local_stack: STACK[EXPRESSION]
      once
         create Result.make
      end

feature {ANY} -- Printing Current, local or argument :
   print_current
      do
         pending_c_function_body.extend('C')
      end

   print_argument (rank: INTEGER)
      do
         pending_c_function_body.extend('a')
         rank.append_in(pending_c_function_body)
      end

   print_local (name: STRING)
      require
         pending_c_function
         not name.is_empty
      do
         pending_c_function_body.extend('_')
         pending_c_function_body.append(name)
      end

feature {C_COMPILATION_MIXIN}
   variant_check (type: TYPE; loop_variant: EXPRESSION)
      require
         pending_c_function
         loop_variant /= Void
      do
         compound_expression_compiler.compile(once "v=ac_lvc(c++,v,", loop_variant, once ");%N", type)
      end

   current_class_invariant (type_of_current: TYPE)
         -- Add some C code to check class invariant with Current at the end of a routine for `Current'.
      require
         type_of_current /= Void
      local
         live_type_of_current: LIVE_TYPE
      do
         live_type_of_current := need_invariant(type_of_current)
         if live_type_of_current /= Void then
            if live_type_of_current.is_reference then
               pending_c_function_body.append(once "if(se_rci(caller,C))")
            end
            pending_c_function_body.append(once "se_i")
            live_type_of_current.id.append_in(pending_c_function_body)
            if ace.profile then
               pending_c_function_body.append(once "(&ds,&local_profile,C);%N")
            else
               pending_c_function_body.append(once "(&ds,C);%N")
            end
         end
      end

feature {ANY}
   class_invariant_call_opening (type_of_target: TYPE; extra_cast_flag: BOOLEAN): INTEGER
         -- Add extra code to call the class invariant when `type_of_target' actually has an invariant.
         -- A 0 `Result' indicate that there is no invariant.
      require
         type_of_target /= Void
      local
         lt: LIVE_TYPE
      do
         lt := need_invariant(type_of_target)
         if lt /= Void then
            pending_c_function_body.append(once "se_i")
            lt.id.append_in(pending_c_function_body)
            pending_c_function_body.append(once "(&ds,")
            if ace.profile then
               pending_c_function_body.append(once "&local_profile,")
            end
            if type_of_target.is_reference then
               if extra_cast_flag then
                  pending_c_function_body.append(once "((T")
                  type_of_target.live_type.id.append_in(pending_c_function_body)
                  pending_c_function_body.append(once "*)(")
                  Result := 3
               else
                  Result := 1
               end
            else
               Result := 1
            end
         end
      end

   class_invariant_call_closing (integer_flag: INTEGER; semicolon_flag: BOOLEAN)
      do
         inspect
            integer_flag
         when 0 then
         when 1 then
            pending_c_function_body.extend(')')
         when 3 then
            pending_c_function_body.append(once ")))")
         end
         if semicolon_flag then
            pending_c_function_body.extend(';')
         end
      end

feature {ANY}
   macro_def (str: STRING; id: INTEGER)
      do
         out_h_buffer.copy(once "#define ")
         out_h_buffer.append(str)
         out_h_buffer.extend(' ')
         id.append_in(out_h_buffer)
         out_h_buffer.extend('%N')
         write_out_h_buffer
      end

feature {}
   write_make_file
      local
         cmd: STRING
      do
         --
         end_c_linkage(out_h)
      out_h.disconnect
      end_c_linkage(out_c)
      out_c.disconnect
      --
      c_plus_plus_definitions
   --
   echo.tfw_connect(out_make, path_make)
do_write_make_file
         if not executable_is_up_to_date then
            cmd := system_tools.strip_executable
            if cmd /= Void then
               out_make.put_line(cmd)
            end
         end
         out_make.disconnect
         if nb_errors > 0 then
            echo.file_removing(path_make)
         end
      end

   do_write_make_file
      local
         no_change: BOOLEAN; executable_name: STRING; file_tools: FILE_TOOLS
      do
         if ace.precompile_header then
            out_make.put_line(system_tools.h_precompiler_command(path_h))
         elseif system_tools.precompiled_header_suffix /= Void then
            tmp_string.copy(path_h)
            tmp_string.remove_tail(2)
            tmp_string.append(system_tools.precompiled_header_suffix)
            echo.file_removing(tmp_string)
         end
         out_make.put_line(fz_begin_c_compile)
         no_change := not ace.splitter.write_make_file(out_make)
         out_make.put_line(fz_end_c_compile)
         executable_name := ace.executable_name
         if no_change and then executable_name /= Void then
            no_change := file_tools.is_readable(executable_name)
         else
            no_change := False
         end
         if no_change and then not system_tools.is_linking_mandatory then
            executable_is_up_to_date := True
            echo.put_string(once "Executable is up-to-date (no C compilation, no linking done).%N")
         else
            tmp_string.copy(path_h)
            tmp_string.remove_tail(2)
            out_make.put_line(ace.splitter.linker_command(tmp_string))
         end
      end

feature {FEATURE_CALL, C_EXPRESSION_COMPILATION_MIXIN}
   put_monomorphic_or_void_call (type: TYPE; feature_stamp: FEATURE_STAMP; target: EXPRESSION; arguments: EFFECTIVE_ARG_LIST)
         -- Unfortunately, because `simplify' can reduce the number of elements in RUN_TIME_SET objects,
         -- long after `inline_dynamic_dispatch_', we still  have this special case for Void in the
         -- back-end (the best way would be to create VOID_PROC_CALL and VOID_CALL objects far before).
         -- When `assigned_to' then the call is the expression of a variable to write to.
      require
         type /= Void
         feature_stamp /= Void
         target /= Void
      local
         tgt_type: TYPE; live_type: LIVE_TYPE; anonymous_feature: ANONYMOUS_FEATURE; run_feature: RUN_FEATURE
         code: CODE
      do
         tgt_type := target.resolve_in(type)
         live_type := tgt_type.live_type
         if live_type.run_time_set.count = 0 then
            anonymous_feature := feature_stamp.anonymous_feature(tgt_type)
            pending_c_function_body.append(once "/* Void call detected in back-end (function called: {")
            pending_c_function_body.append(tgt_type.canonical_type_mark.written_mark)
            pending_c_function_body.append(once "}.")
            pending_c_function_body.append(anonymous_feature.names.first.to_string)
            pending_c_function_body.append(once ") */ ")
            if anonymous_feature.result_type = Void then
               create {VOID_PROC_CALL} code.make(target.start_position, feature_stamp, tgt_type)
            else
               assignment_evobt := True -- see below `start_assignment' and `check_assignment'
               create {VOID_CALL} code.make(target.start_position, feature_stamp, tgt_type)
            end
            code_compiler.compile(code, type)
         else
            if live_type.run_time_set.count = 1 then
               tgt_type := live_type.run_time_set.first.type
            end
            run_feature := feature_stamp.run_feature_for(tgt_type)
            push_direct(run_feature, type, target, arguments)
            mapper.compile(run_feature)
            pop
         end
      end

feature {C_CODE_COMPILER}
   start_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
         -- Called just before compiling the left (written to) expression of an assignment
      require
         not in_assignment
      do
         in_assignment := True
         assignment_evobt := False
         memory.start_assignment(assignment, type)
      ensure
         in_assignment
      end

   check_assignment: BOOLEAN
         -- Called after having compiled the left (written to) expression of an assignment to know if the
         -- assignment should be completed by compiling the right expression. If an evobt was raised then the
         -- right expression will not be compiled (see `put_monomorphic_or_void_call').
      require
         in_assignment
      do
         Result := not assignment_evobt
      ensure
         in_assignment
      end

   end_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      require
         in_assignment
      do
         memory.end_assignment(assignment, type)
         in_assignment := False
      ensure
         not in_assignment
      end

   in_assignment: BOOLEAN

feature {}
   assignment_evobt: BOOLEAN

feature {ANY}
   put_direct (type: TYPE; dynamic_feature: RUN_FEATURE; target: EXPRESSION; arguments: EFFECTIVE_ARG_LIST)
      do
         push_direct(dynamic_feature, type, target, arguments)
         mapper.compile(dynamic_feature)
         pop
      end

feature {ANY}
   sys_runtime_h_and_c (name: STRING)
         -- Inline corresponding SmartEiffel/sys/runtime/`name'.[hc] file. At least, one file should be
         -- found.
      local
         ok: BOOLEAN
      do
         system_tools.sys_runtime(name, 'h')
         if tmp_file_read.is_connected then
            ok := True
            put_file(tmp_file_read, out_h)
         end
         system_tools.sys_runtime(name, 'c')
         if tmp_file_read.is_connected then
            ok := True
            put_file(tmp_file_read, out_c)
         end
         if not ok then
            error_handler.append(once "No support found in directory sys/runtime for %"")
            error_handler.append(name)
            error_handler.append(once "%" (i.e. file(s) %"")
            tmp_path.remove_last
            error_handler.append(tmp_path)
            error_handler.append(once "[hc]%" not found).")
            error_handler.print_as_fatal_error
         end
      end

feature {PLUGIN}
   put_c_file (tfr: TEXT_FILE_READ)
      require
         not tfr.end_of_input
      do
         put_file(tfr, out_c)
      ensure
         not tfr.is_connected
      end

   put_h_file (tfr: TEXT_FILE_READ)
      require
         not tfr.end_of_input
      do
         put_file(tfr, out_h)
      ensure
         not tfr.is_connected
      end

feature {MEMORY, LIVE_TYPE, RUN_FEATURE, C_COMPILATION_MIXIN, MEMORY_HANDLER}
   recompilation_comment (lt: LIVE_TYPE)
      require
         lt /= Void
      do
         pending_c_function_body.append(once "/*")
         pending_c_function_body.append(lt.structure_signature)
         pending_c_function_body.append(once "*/")
      end

feature {NATIVE}
   include_register (origin: POSITION; include_name: STRING)
      do
         if include_memory = Void then
            create {HASHED_SET[STRING]} include_memory.make
         end
         if not include_memory.has(include_name) then
            include_memory.add(include_name)
            put_position_comment_on(out_h, origin)
            add_include_on(out_h, include_name)
            put_position_comment_on(out_h, origin)
         end
      end

feature {ANY}
   set_dump_stack_top_for (t: TYPE; ds, comment: STRING)
      require
         pending_c_function
      do
         pending_c_function_body.append(once "set_dump_stack_top(")
         pending_c_function_body.append(ds)
         pending_c_function_body.append(once ");/*")
         pending_c_function_body.append(comment)
         pending_c_function_body.append(once "*/%N")
      end

feature {C_COMPILATION_MIXIN}
   stop_recursive_assertion_opening (inside_feature_flag: BOOLEAN)
      do
         if ace.no_check then --|*** should be require_check?
            if ace.flat_check then
               pending_c_function_body.append(once "if(assertion_depth){%Nassertion_depth--;%N")
               else
                  if inside_feature_flag then
                     pending_c_function_body.append(once "if(fd.assertion_flag){%Nfd.assertion_flag=0;%N")
                     else
                        pending_c_function_body.append(once "if(ds.fd->assertion_flag){%Nds.fd->assertion_flag=0;%N")
                        end
                     end
                  end
               end

               stop_recursive_assertion_closing (inside_feature_flag: BOOLEAN)
      do
         if ace.no_check then
            if ace.flat_check then
               pending_c_function_body.append(once "assertion_depth++;%N}%N")
            else
               if inside_feature_flag then
                  pending_c_function_body.append(once "fd.assertion_flag=1;%N}%N")
               else
                  pending_c_function_body.append(once "ds.fd->assertion_flag=1;%N}%N")
               end
            end
         end
      end

   c_frame_descriptor_in (type_mark: TYPE_MARK; buffer: STRING)
         -- Update `c_frame_descriptor_format' accordingly.
      require
         type_mark.is_static
         buffer /= Void
      local
         lt: LIVE_TYPE
      do
         buffer.extend('%%')
         if type_mark.is_reference then
            lt := type_mark.type.live_type
            buffer.extend('R')
            if lt = Void then
               buffer.extend('0')
            else
               lt.id.append_in(buffer)
            end
         else
            buffer.extend('E')
            type_mark.id.append_in(buffer)
         end
         buffer.extend('%%')
      end

   c_frame_descriptor_closure_in (type_mark: TYPE_MARK; buffer: STRING)
         -- Update `c_frame_descriptor_format' accordingly (for closure locals and arguments).
      require
         type_mark.is_static
         buffer /= Void
      local
         lt: LIVE_TYPE
      do
         buffer.extend('%%')
         lt := type_mark.type.live_type
         buffer.extend('R')
         if lt = Void then
            buffer.extend('0')
         else
            lt.id.append_in(buffer)
         end
         buffer.extend('%%')
      end

feature {}
   begin_c_linkage (output: TEXT_FILE_WRITE)
         -- Begin wrap for C linkage
      do
         output.put_string(once "#ifdef __cplusplus%Nextern %"C%" {%N#endif%N")
      end

   end_c_linkage (output: TEXT_FILE_WRITE)
         -- End wrap for C linkage
      do
         output.put_string(once "%N#ifdef __cplusplus%N}%N#endif%N")
      end

   c_plus_plus_definitions
      local
         cpp_path_h, cpp_path_c: STRING; i: INTEGER
      do
         if has_c_plus_plus then
            ace.splitter.set_dont_split(True)
            echo.put_string(once "C++ external definitions.%N")
            cpp_path_h := system_tools.path_h.twin
            cpp_path_h.remove_tail(2)
            cpp_path_h.append(once "_external_cpp")
            cpp_path_c := cpp_path_h.twin
            cpp_path_h.append(h_suffix)
            cpp_path_c.append(c_plus_plus_suffix)
            echo.tfw_connect(out_h, cpp_path_h)
            echo.tfw_connect(out_c, cpp_path_c)
            begin_c_linkage(out_c)
            begin_c_linkage(out_h)
            add_first_include(cpp_path_h)
            system_tools.add_c_plus_plus_file(cpp_path_c)
            sys_runtime_h_and_c(once "c_plus_plus")

            from
               i := registered_natives.lower
            until
               i > registered_natives.upper
            loop
               native_c_definition.compile(registered_natives.key(i), registered_natives.item(i))
               i := i + 1
            end

            end_c_linkage(out_c)
            end_c_linkage(out_h)
            out_h.disconnect
            out_c.disconnect
            ace.splitter.set_dont_split(False)
         end
      end

   out_c: TEXT_FILE_WRITE
         -- The current *.c output file.
      do
         Result := ace.splitter.out_c
      end

   out_h: TEXT_FILE_WRITE
         -- The *.h output file.

   in_h: TEXT_FILE_READ
         -- The *.h, when copied in the symbols file

   out_make: TEXT_FILE_WRITE
         -- The *.make output file.
      once
         create Result.make
      end

   c_inline_h_mem: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(4)
      end

feature {C_EXPRESSION_COMPILATION_MIXIN}
   se_evobt (return_type: TYPE_MARK; type: TYPE; target: EXPRESSION; is_target: BOOLEAN)
         -- `is_target' is False when compiling an argument, True otherwise (i.e. when compiling a target)
      require
         target /= Void
      local
         p: POSITION; internal_c_local: INTERNAL_C_LOCAL
      do
         p := target.start_position
         --error_handler.add_position(p)
         --error_handler.append(once "Target is always Void here. Expect a crash at runtime.")
         --error_handler.append(once "The context type is ")
         --error_handler.append(type.canonical_type_mark.written_mark)
         --error_handler.print_as_warning

         if return_type /= Void then
            if return_type.is_reference then
               -- Because of a Borland C compiler bug we have to add this extra cast:
               pending_c_function_body.append(once "(T0*)")
            end
            pending_c_function_body.extend('(')
         end
         if ace.no_check then
            pending_c_function_body.append(once "se_evobt")
            pending_c_function_body.extend('(')
            code_compiler.compile(target, type)
            pending_c_function_body.extend(',')
            put_position(p)
            pending_c_function_body.extend(')')
         else
            pending_c_function_body.append(once "/*se_evobt*/")
            put_position_comment_on(out_c, p)
            code_compiler.compile(target, type)
            pending_c_function_body.extend(',')
            exceptions_handler.se_evobt
         end
         if return_type /= Void then
            pending_c_function_body.extend(',')
            if return_type.is_reference or else return_type.is_native_array then
               internal_c_local := pending_c_function_lock_local(return_type.type, once "evobt");
               internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.extend('=')
               pending_c_function_body.append(initializer.for(return_type))
            elseif is_target and then not return_type.is_kernel_expanded and then not return_type.type.is_empty_expanded then
               internal_c_local := pending_c_function_lock_local(return_type.type, once "evobt");
               pending_c_function_body.extend('(')
               internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.append(once "=M")
               return_type.type.id.append_in(pending_c_function_body)
               pending_c_function_body.append(once ",&")
               internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.extend(')')
            else
               pending_c_function_body.extend('M')
               return_type.type.id.append_in(pending_c_function_body)
            end
            pending_c_function_body.extend(')')
         else
            pending_c_function_body.append(once ";%N")
         end
      end

feature {}
   define_initialize_eiffel_runtime (rf3: RUN_FEATURE_3)
      require
         rf3.is_root
      local
         no_check: BOOLEAN; lt: LIVE_TYPE; se_atexit_stamp: FEATURE_STAMP
         internal_c_local: INTERNAL_C_LOCAL
      do
         no_check := ace.no_check
         lt := rf3.type_of_current.live_type
         echo.put_string(once "Define initialize stuff.%N")
         define_extern_tables
         c_variables_for_precomputable_routines
         -- Define atexit() function, if useful (i.e. std_output is used):
         se_atexit_stamp := smart_eiffel.se_atexit_stamp

         prepare_c_function
         pending_c_function_signature.append(once "void se_atexit(void)")
         if ace.profile then
            pending_c_function_body.append(once "se_local_profile_t local_profile, *parent_profile;%N")
         end
         if no_check then
            pending_c_function_body.append(once "[
                                                 se_frame_descriptor fd={"<atexit wrapper>",0,0,"",1};
                                                 se_dump_stack ds;
                                                 ds.fd=&fd;
                                                 ds.p=0;
                                                 ds.caller=NULL;
                                                 ds.exception_origin=NULL;
                                                 ds.locals=NULL;
                                                 ds.depth=0;

                                                 ]")
         end
         if ace.profile then
            pending_c_function_body.append(once "parent_profile=&global_profile;%N")
            pending_c_function_body.append(once "local_profile.profile=&atexit_profile;%N")
            pending_c_function_body.append(once "start_profile(parent_profile, &local_profile);%N")
         end
         if se_atexit_stamp /= Void then
            -- Add the C code to call it knowing that the corresponding feature is a procedure which does not
            -- use  `Current' (See {ANY}.se_atexit definition).
            if ace.sedb then
               -- (Calling Eiffel function flush would result in running sedb again whereas the user said s/he
               -- wanted to exit.)
               pending_c_function_body.append("if (sedb_status != SEDB_EXIT_MODE) ")
            end
            pending_c_function_body.extend('r')
            smart_eiffel.se_atexit_id.append_in(pending_c_function_body)
            pending_c_function_body.append(once "se_atexit(")
            if not ace.boost then
               pending_c_function_body.append(once "&ds")
            end
            if ace.profile then
               if pending_c_function_body.last /= '(' then
                  pending_c_function_body.extend(',')
               end
               pending_c_function_body.append(once "&local_profile")
            end
            if not ace.boost then
               if pending_c_function_body.last /= '(' then
                  pending_c_function_body.extend(',')
               end
               pending_c_function_body.append(once "NULL/*Unused Target*/")
            end
            pending_c_function_body.append(once ");%N")
         end
         memory.gc_info_before_exit
         if ace.profile then
            pending_c_function_body.append(once "stop_profile(parent_profile, &local_profile);%N")
         end
         if ace.profile then
            show_profile
         end
         dump_pending_c_function(True)

         --|*** if (not ace.no_split) and then split_count > 10 then
         --|***    -- We are producing a quite large system, so just use a brand new file right-now:
         --|***    ace.splitter.split_now
         --|*** end
         prepare_c_function
         pending_c_function_signature.append(once "void initialize_eiffel_runtime(int argc,char*argv[])")
         if ace.profile then
            pending_c_function_body.append(once "se_local_profile_t local_profile, *parent_profile;%N")
         end
         if no_check then
            pending_c_function_body.append(once "[
                                                 se_frame_descriptor irfd={"<runtime init>",0,0,"",1};
                                                 se_dump_stack ds = {NULL,NULL,0,NULL,NULL,0};
                                                 ds.fd=&irfd;

                                                 ]")
            set_dump_stack_top_for(rf3.type_of_current, once "&ds", once "link")
         end
         pending_c_function_body.append(once "se_argc=argc;%Nse_argv=argv;%N")
         pending_c_function_body.append(once "atexit(se_atexit);%N")
         if ace.profile then
            pending_c_function_body.append(once "parent_profile=&global_profile;%N")
            pending_c_function_body.append(once "local_profile.profile=&runinit_profile;%N")
            pending_c_function_body.append(once "start_profile(parent_profile, &local_profile);%N")
         end
         memory.initialize_runtime
         exceptions_handler.initialize_runtime
         if no_check then
            initialize_path_table
         end
         if smart_eiffel.generator_used then
            initialize_generator
         end
         if smart_eiffel.generating_type_used then
            initialize_generating_type
         end
         if ace.profile then
            initialize_profile
         end
         if not exceptions_handler.used then
            if ace.no_check then
               pending_c_function_body.append(once "[
#ifdef SIGINT
                                                    signal(SIGINT,se_signal_handler);
#endif
#ifdef SIGTERM
                                                    signal(SIGTERM,se_signal_handler);
#endif

                                                       ]")
            end
            pending_c_function_body.append(once "[
#ifdef SIGQUIT
                                                 signal(SIGQUIT,se_signal_handler);
#endif
#ifdef SIGILL
                                                 signal(SIGILL,se_signal_handler);
#endif
#ifdef SIGABRT
                                                 signal(SIGABRT,se_signal_handler);
#endif
#ifdef SIGFPE
                                                 signal(SIGFPE,se_signal_handler);
#endif
#ifdef SIGSEGV
                                                 signal(SIGSEGV,se_signal_handler);
#endif
#ifdef SIGBUS
                                                 signal(SIGBUS,se_signal_handler);
#endif
#ifdef SIGSYS
                                                 signal(SIGSYS,se_signal_handler);
#endif
#ifdef SIGTRAP
                                                 signal(SIGTRAP,se_signal_handler);
#endif
#ifdef SIGXCPU
                                                 signal(SIGXCPU,se_signal_handler);
#endif
#ifdef SIGXFSZ
                                                 signal(SIGXFSZ,se_signal_handler);
#endif

                                                 ]")
         end
         c_call_initialize_manifest_strings
         c_code_for_precomputable_routines
         memory.post_initialize_runtime
         if ace.sedb then
            pending_c_function_body.append(once "se_general_trace_switch=1;%N")
         end
         if smart_eiffel.thread_used then
            pending_c_function_body.append(once "se_thread_register();%N")
         end
         internal_c_local := pending_c_function_lock_local(lt.type, once "root")
         memory.allocation_of(internal_c_local, lt)
         pending_c_function_body.append(once "eiffel_root_object=((T")
         lt.id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "*)")
         internal_c_local.append_in(pending_c_function_body)
         pending_c_function_body.append(once ");%N")

         internal_c_local.unlock
         system_tools.auto_init_plugins
         if ace.no_check then
            set_dump_stack_top_for(rf3.type_of_current, once "(void*)0", once "unlink")
         end
         if ace.profile then
            pending_c_function_body.append(once "stop_profile(parent_profile, &local_profile);%N")
         end
         dump_pending_c_function(True)
      end

   c_call_initialize_manifest_strings
      require
         cpp.pending_c_function
      do
         if manifest_string_pool.collected_once_count > 0 then
            cpp.pending_c_function_body.append(once "se_msi1(")
            if ace.no_check then
               cpp.pending_c_function_body.append(once "&ds")
            end
            if ace.profile then
               if ace.no_check then
                  cpp.pending_c_function_body.extend(',')
               end
               cpp.pending_c_function_body.append(once "&local_profile")
            end
            cpp.pending_c_function_body.append(once ");%N")
         end
      ensure
         cpp.pending_c_function
      end

   check_id (type: TYPE; e: EXPRESSION; id: INTEGER)
         -- Produce a C expression checking that `e' is not Void and that `e' is really of type `id'.
         -- The result of the C expression is the pointer to the corresponding Object.
      require
         e.resolve_in(type).is_reference
         id > 0
      do
         if ace.no_check then
            pending_c_function_body.append(once "((T")
            id.append_in(pending_c_function_body)
            pending_c_function_body.append(once "*)ci(")
            id.append_in(pending_c_function_body)
            pending_c_function_body.extend(',')
            code_compiler.compile(e, type)
            pending_c_function_body.extend(',')
            put_position(e.start_position)
            pending_c_function_body.append(once "))")
         else
            code_compiler.compile(e, type)
         end
      end

   tmp_string: STRING
      once
         create Result.make(256)
      end

   need_invariant (type_of_target: TYPE): LIVE_TYPE
         -- Give the corresponding LIVE_TYPE when `type_of_target' actually needs some class invariant checking.
      require
         type_of_target /= Void
      do
         if type_of_target.class_text.invariant_check and then not assertion_checks_disabled then
            Result := type_of_target.live_type
            if Result /= Void and then Result.at_run_time and then Result.class_invariant /= Void then
               -- Let `Result'unchanged.
            else
               Result := Void
            end
         end
      end

   path_h: STRING
      do
         Result := system_tools.path_h
      ensure
         Result.has_suffix(h_suffix)
      end

   path_c: STRING
      do
         Result := system_tools.path_c
      ensure
         Result.has_suffix(c_suffix)
      end

   path_make: STRING
      do
         Result := system_tools.path_make
      ensure
         Result.has_suffix(system_tools.make_suffix)
      end

   add_first_include (the_first_include: STRING)
      do
         put_banner(out_c)
         add_include_on(out_c, the_first_include)
      end

   put_banner (output: TEXT_FILE_WRITE)
      require
         output.is_connected
      do
         output.put_string(once "/*%NANSI C code generated by ")
         output.put_string(smart_eiffel.copyright)
         output.put_string(once "C Compiler options used: ")
         output.put_string(system_tools.c_compiler_options)
         output.put_string(once "%N*/%N")
      end

   c_code_saved: BOOLEAN

   h_connect (h_path: STRING)
      do
         if out_h = Void then
            create {TEXT_FILE_WRITE} out_h.make
         end
         out_h.connect_to(h_path)
      end

   executable_is_up_to_date: BOOLEAN
         -- When the executable seems to be already correct (no C
         -- compilation and no linking is to be done).

   common_put_target
      local
         created_type: TYPE
      do
         inspect
            stack_top.code
         when C_inside_twin then
            created_type := stack_top.type
            if created_type.is_reference then
               pending_c_function_body.append(once "((")
               pending_c_function_body.append(target_type.for(created_type.canonical_type_mark))
               pending_c_function_body.append(once ")R)")
            else
               pending_c_function_body.append(once "&R")
            end
         when C_create_instruction, C_create_expression then
            created_type := stack_top.static_type
            if created_type.is_reference then
               pending_c_function_body.append(once "((T")
               created_type.id.append_in(pending_c_function_body)
               pending_c_function_body.append(once "*)")
               stack_top.internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.append(once ")")
            else
               if created_type.is_user_expanded and then not created_type.is_empty_expanded then
                  pending_c_function_body.extend('&')
               end
               stack_top.internal_c_local.append_in(pending_c_function_body)
            end
         when C_precursor, C_inside_some_wrapper, C_cecil_create then
            pending_c_function_body.extend('C')
         end
      end

   put_file (tfr: TEXT_FILE_READ; output: TEXT_FILE_WRITE)
      require
         not tfr.end_of_input
      do
         split_c_file_padding_here
         from
            tfr.read_character
         until
            tfr.end_of_input
         loop
            output.put_character(tfr.last_character)
            tfr.read_character
         end
         tfr.disconnect
      ensure
         not tfr.is_connected
      end

   really_define_c_main (rf3: RUN_FEATURE_3)
      require
         not ace.no_main
      local
         class_invariant_flag: INTEGER; type: TYPE; ct: TYPE_MARK
         internal_c_local: INTERNAL_C_LOCAL
      do
         echo.put_string(once "Define C main function.%N")
         prepare_c_function
         type := rf3.type_of_current
         ct := type.canonical_type_mark
         system_tools.main_function_return_type_in(pending_c_function_signature)
         pending_c_function_signature.append(once " main(int argc,char*argv[])")
         if ace.no_check then
            pending_c_function_body.append(once "se_frame_descriptor root={%"<system root>%",1,0,%"")
            c_frame_descriptor_in(ct, pending_c_function_body)
            pending_c_function_body.append(once "%",1};%Nse_dump_stack ds;%N")
         end
         if ace.profile then
            pending_c_function_body.append(once "se_local_profile_t local_profile, master_profile;%N")
            pending_c_function_body.append(once "master_profile.profile=NULL;%N")
            pending_c_function_body.append(once "init_profile(&root_profile, %"<root>%");%N")
            pending_c_function_body.append(once "init_profile(&runinit_profile, %"<runinit>%");%N")
            pending_c_function_body.append(once "init_profile(&atexit_profile, %"<atexit>%");%N")
            pending_c_function_body.append(once "global_profile.profile=&root_profile;%N")
            pending_c_function_body.append(once "get_profiler_started(&master_profile);%N")
            pending_c_function_body.append(once "start_profile(&master_profile, &global_profile);%N")
         end
         memory.pre_initialize_runtime
         pending_c_function_body.append(once "initialize_eiffel_runtime(argc,argv);%N")
         if ace.profile then
            pending_c_function_body.append(once "local_profile=global_profile;%N")
         end
         internal_c_local := pending_c_function_lock_local(type, once "prof")
         internal_c_local.append_in(pending_c_function_body)
         pending_c_function_body.append(once "=((T0*)eiffel_root_object);%N")
         if ace.no_check then
            pending_c_function_body.append(once "ds.fd=&root;%N%
                                                 %ds.current=((void*)(&")
            internal_c_local.append_in(pending_c_function_body)
            pending_c_function_body.append(once "));%N")
            put_position_in_ds(rf3.start_position)
            pending_c_function_body.append(once "ds.caller=NULL;%Nds.exception_origin=NULL;%Nds.locals=NULL;%N")
            set_dump_stack_top_for(rf3.type_of_current, once "&ds", once "link")
         end
         push_create_instruction(type, rf3, Void, internal_c_local)
         mapper.compile(rf3)
         pop
         class_invariant_flag := class_invariant_call_opening(rf3.type_of_current, True)
         if class_invariant_flag > 0 then
            if internal_c_local.type.has_external_type or else (internal_c_local.type.is_expanded and then cpp.need_struct.for(internal_c_local.type.canonical_type_mark)) then
               pending_c_function_body.extend('&')
            end
            internal_c_local.append_in(pending_c_function_body)
            class_invariant_call_closing(class_invariant_flag, True)
         end
         if smart_eiffel.thread_used then
            pending_c_function_body.append(once "se_thread_stop();%N")
         end
         pending_c_function_body.append(once "handle(SE_HANDLE_NORMAL_EXIT, NULL);%N");
         if ace.no_check then
            set_dump_stack_top_for(rf3.type_of_current, once "NULL", once "unlink")
         end
         if ace.profile then
            pending_c_function_body.append(once "global_profile=local_profile;%N")
            pending_c_function_body.append(once "stop_profile(&master_profile, &global_profile);%N")
         end
         internal_c_local.unlock
         system_tools.main_function_exit_in(pending_c_function_body)
         dump_pending_c_function(True)
      end

   include_memory: SET[STRING]

feature {}
   put_position_comment_on (output: TEXT_FILE_WRITE; p: POSITION)
         -- See also `put_position_comment_in'.
      local
         buffer: STRING
      do
         buffer := once "........ local buffer ........"
         buffer.clear_count
         put_position_comment_in(buffer, p)
         output.put_string(buffer)
      end

feature {C_CODE_COMPILER}
   put_position_comment_in (buffer: STRING; p: POSITION)
         -- See also `put_position_comment_on'.
      local
         i: INTEGER; path: STRING; stop: BOOLEAN
      do
         if p.is_unknown then
            buffer.append(once "/*unknown position*/")
         else
            buffer.append(once "/*l")
            p.line.append_in(buffer)
            buffer.extend('c')
            p.column.append_in(buffer)
            path := p.path
            from
               i := path.count
            until
               stop
            loop
               if i <= 1 then
                  buffer.extend(' ')
                  stop := True
               else
                  inspect
                     path.item(i)
                  when '/', '\' then
                     stop := True
                  else
                     i := i - 1
                  end
               end
            end
            from
            until
               i > path.count
            loop
               buffer.extend(path.item(i))
               i := i + 1
            end
            buffer.append(once "*/")
         end
      end

   internal_c_local_stamps_stack: FAST_ARRAY[INTEGER]
      once
         create Result.with_capacity(32)
      end

   internal_c_local_list: INTERNAL_C_LOCAL_LIST
      once
         create Result
      end

feature {C_COMPILATION_MIXIN}
   string_to_c_code (s: STRING; buffer: STRING)
         -- Add in the `buffer' the C language view of the Eiffel `s' STRING.
         -- (Replace all strange characters of `s' with the appropriate C backslash escape sequences).
      do
         native_array_to_c_code(s.count, s.storage, buffer)
      end

feature {}
   native_array_to_c_code (capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]; buffer: STRING)
      local
         break, i: INTEGER
      do
         buffer.extend('%"')
         from
         until
            i >= capacity
         loop
            character_to_c_code(storage.item(i), buffer)
            i := i + 1
            break := break + 1
            if break > 1024 then
               -- Because of a limitation of the Visual C/C++ compiler which do not like too long lines:
               buffer.append(once "%"%N%"")
               break := 0
            end
         end
         buffer.extend('%"')
      end

   character_to_c_code (c: CHARACTER; buffer: STRING)
      do
         if c = '%N' then
            buffer.extend('\')
            buffer.extend('n')
         elseif c = '\' then
            buffer.extend('\')
            buffer.extend('\')
         elseif c = '?' then
            buffer.extend('\')
            buffer.extend('?')
         elseif c = '%"' then
            buffer.extend('\')
            buffer.extend('%"')
         elseif c = '%'' then
            buffer.extend('\')
            buffer.extend('%'')
         elseif c.code < 32 or else 122 < c.code then
            buffer.extend('\')
            c.code.low_8.to_octal_in(buffer)
            buffer.append(once "%"%"")
         else
            buffer.extend(c)
         end
      end

feature {}
   c_define1_manifest_string_pool
      local
         i, j, upper: INTEGER; ms: MANIFEST_STRING; us: UNICODE_STRING; storage: NATIVE_ARRAY[INTEGER_16]
         lsv: FAST_ARRAY[INTEGER_16]; lsi: FAST_ARRAY[INTEGER]
      do
         from
            out_c_buffer.copy(once "/*Aliased storage area or unicode storage.*/%N")
            write_out_c_buffer
            i := 1
         until
            i > manifest_string_pool.storage_alias_count
         loop
            ms := manifest_string_pool.storage_alias_item(i)
            if ms.unicode_flag then
               us := ms.unicode_string
               upper := us.count
               if upper > 0 then
                  -- Preparing `write_extern_array_1' call:
                  out_h_buffer.copy(once "uint16_t s")
                  out_h_buffer.append(ms.initial_storage_id)
                  out_c_buffer.clear_count
                  from
                     storage := us.storage
                     j := 0
                  until
                     j >= upper
                  loop
                     if j > 0 then
                        out_c_buffer.extend(',')
                     end
                     storage.item(j).append_in(out_c_buffer)
                     j := j + 1
                  end
                  write_extern_array_1(out_h_buffer, upper, out_c_buffer)
                  upper := upper - 1
               end
               lsv := us.low_surrogate_values
               if lsv /= Void and then lsv.count > 0 then
                  -- Preparing `write_extern_array_1' call:
                  out_h_buffer.copy(once "uint16_t lsv")
                  out_h_buffer.append(ms.initial_storage_id)
                  out_c_buffer.clear_count
                  from
                     j := lsv.lower
                  until
                     j > lsv.upper
                  loop
                     if j > lsv.lower then
                        out_c_buffer.extend(',')
                     end
                     lsv.item(j).append_in(out_c_buffer)
                     j := j + 1
                  end
                  write_extern_array_1(out_h_buffer, upper, out_c_buffer)
               end
               lsi := us.low_surrogate_indexes
               if lsi /= Void and then lsi.count > 0 then
                  -- Preparing `write_extern_array_1' call:
                  out_h_buffer.copy(once "uint32_t lsi")
                  out_h_buffer.append(ms.initial_storage_id)
                  out_c_buffer.clear_count
                  from
                     j := lsi.lower
                  until
                     j > lsi.upper
                  loop
                     if j > lsi.lower then
                        out_c_buffer.extend(',')
                     end
                     lsi.item(j).append_in(out_c_buffer)
                     j := j + 1
                  end
                  write_extern_array_1(out_h_buffer, upper, out_c_buffer)
               end
            elseif ms.alias_link /= Void then
               out_h_buffer.copy(once "char*s")
               out_h_buffer.append(ms.initial_storage_id)
               out_c_buffer.clear_count
               string_to_c_code(ms.to_string, out_c_buffer)
               write_extern_2(out_h_buffer, out_c_buffer)
            end
            i := i + 1
         end
      end

   nb_ms_per_function: INTEGER 50

   c_define2_manifest_string_pool
      local
         i, j, fn_count, mdc, id: INTEGER; ms: MANIFEST_STRING; no_check: BOOLEAN; lt: LIVE_TYPE
         internal_c_local: INTERNAL_C_LOCAL; se_msi_signature, se_msi_call: STRING
      do
         split_c_file_padding_here
         no_check := ace.no_check
         mdc := manifest_string_pool.collected_once_count
         echo.print_count(once "Manifest String", mdc)
         if mdc > 0 then
            from
               -- For the *.h file:
               i := 1
            until
               i > manifest_string_pool.collected_once_count
            loop
               ms := manifest_string_pool.collected_once_item(i)
               out_h_buffer.copy(once "T0*")
               out_h_buffer.append(ms.once_variable)
               write_extern_1(out_h_buffer)
               i := i + 1
            end
         end
         --
         if smart_eiffel.is_at_run_time(as_string) and then manifest_string_pool.is_string_collected then
            lt := manifest_string_pool.se_ms.type_of_current.live_type
            check
               lt.id = 7
            end

            prepare_c_function
            pending_c_function_signature.copy(once "T0*se_string(")
            if no_check then
               pending_c_function_signature.append("se_dump_stack*caller,")
            end
            if ace.profile then
               pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
            end
            pending_c_function_signature.append(once "int c,char*e)")
            pending_c_function_body.copy(once "/* Allocate an Eiffel STRING given its size and native storage */%N")
            if ace.profile then
               pending_c_function_body.append(once "se_local_profile_t local_profile;%Nstatic se_profile_t prof;%Nstatic int prof_init=0;%N")
            end
            pending_c_function_body.append(once "T7*")
            memory.manifest_string_in(pending_c_function_body)
            if ace.profile then
               pending_c_function_body.append(once "if (!prof_init){memset(&prof,0,sizeof(prof));prof_init=1;}%N")
               pending_c_function_body.append(once "local_profile.profile=&prof;%N")
               pending_c_function_body.append(once "start_profile(parent_profile, &local_profile);%N")
            end
            pending_c_function_body.append(once "*s=M7;%N")
            pending_c_function_body.append(once "r7from_external_sized_copy(")
            if ace.no_check then
               pending_c_function_body.append(once "caller,")
            end
            if ace.profile then
               pending_c_function_body.append(once "&local_profile,")
            end
            pending_c_function_body.append(once "s,e,c);%N")
            if ace.profile then
               pending_c_function_body.append(once "stop_profile(parent_profile, &local_profile);%N")
            end
            pending_c_function_body.append(once "return((T0*)s);%N")
            dump_pending_c_function(True)
         end
         --
         if mdc > 0 then
            se_msi_signature := once ""
            se_msi_signature.clear_count
            se_msi_call := once ""
            se_msi_call.clear_count
            if no_check then
               se_msi_signature.append(once "se_dump_stack*caller")
               se_msi_call.append(once "&ds")
            end
            if ace.profile then
               if not se_msi_signature.is_empty then
                  se_msi_signature.extend(',')
                  check not se_msi_call.is_empty end
                  se_msi_call.extend(',')
               end
               se_msi_signature.append(once "se_local_profile_t*parent_profile")
               se_msi_call.append(once "&local_profile")
            end
            if se_msi_signature.is_empty then
               se_msi_signature.copy(once "void")
               check se_msi_call.is_empty end
            end
            from
               -- For the *.c file:
               i := 1
               fn_count := 1
            until
               fn_count > 1 and then i > mdc
            loop
               prepare_c_function
               pending_c_function_signature.copy(once "void se_msi")
               fn_count.append_in(pending_c_function_signature)
               pending_c_function_signature.extend('(')
               pending_c_function_signature.append(se_msi_signature)
               pending_c_function_signature.extend(')')
               if ace.profile then
                  pending_c_function_body.append(once "se_local_profile_t local_profile;%Nstatic se_profile_t prof;%Nstatic int prof_init=0;%N")
               end
               if no_check then
                  pending_c_function_body.append(once "se_frame_descriptor fd={%"<global-once-")
                  fn_count.append_in(pending_c_function_body)
                  pending_c_function_body.append(once ">%",0,0,%"%",1};%N")
                  pending_c_function_body.append(once "[
                                                        se_dump_stack ds;
                                                        ds.fd=&fd;
                                                        ds.p=0;
                                                        ds.caller=caller;
                                                        ds.exception_origin=NULL;
                                                        ds.locals=NULL;
                                                        ds.depth=0;

                                                        ]")
               end
               if ace.profile then
                  pending_c_function_body.append(once "if (!prof_init){memset(&prof,0,sizeof(prof));prof_init=1;}%N")
                  pending_c_function_body.append(once "local_profile.profile=&prof;%N")
                  pending_c_function_body.append(once "init_profile(&prof, %"se_msi")
                  fn_count.append_in(pending_c_function_body)
                  pending_c_function_body.append(once "%");%Nstart_profile(parent_profile, &local_profile);%N")
               end
               from
                  j := nb_ms_per_function
               until
                  j = 0 or else i > mdc
               loop
                  ms := manifest_string_pool.collected_once_item(i)
                  pending_c_function_body.append(ms.once_variable)
                  pending_c_function_body.extend('=')
                  if ms.unicode_flag then
                     se_ums_c_call_in(pending_c_function_body, ms)
                  else
                     se_ms_c_call_in(pending_c_function_body, ms)
                  end
                  pending_c_function_body.append(once ";%N")
                  j := j - 1
                  i := i + 1
               end
               fn_count := fn_count + 1
               if i <= mdc then
                  pending_c_function_body.append(once "se_msi")
                  fn_count.append_in(pending_c_function_body)
                  pending_c_function_body.extend('(')
                  pending_c_function_body.append(se_msi_call)
                  pending_c_function_body.extend(')')
                  pending_c_function_body.extend(';')
               end
               if ace.profile then
                  pending_c_function_body.append(once "stop_profile(parent_profile, &local_profile);%N")
               end
               dump_pending_c_function(True)
            end
         end
         if manifest_string_pool.first_unicode_manifest_string_collected_flag then
            lt := manifest_string_pool.se_ums.type_of_current.live_type
            id := lt.id
            prepare_c_function
            pending_c_function_signature.copy("T0*se_ums(")
            if no_check then
               pending_c_function_signature.append("se_dump_stack*caller,")
            end
            if ace.profile then
               pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
            end
            pending_c_function_signature.append("int32_t c,uint16_t*s,int32_t sc,int16_t*lsv,int32_t*lsi)")
            internal_c_local := pending_c_function_lock_local(lt.type, once "mspalloc")
            memory.allocation_of(internal_c_local, lt)
            pending_c_function_body.extend('r')
            id.append_in(pending_c_function_body)
            pending_c_function_body.append("manifest_initialize(")
            if no_check then
               pending_c_function_body.append("caller,")
            end
            if ace.profile then
               pending_c_function_body.append(once "parent_profile,")
            end
            pending_c_function_body.extend('(')
            if internal_c_local.type.is_reference then
               pending_c_function_body.append(once "(T")
               id.append_in(pending_c_function_body)
               pending_c_function_body.append(once "*)")
            end
            internal_c_local.append_in(pending_c_function_body)
            pending_c_function_body.append("),c,(int16_t*)s,sc,lsv,lsi);return (T0*)")
            internal_c_local.append_in(pending_c_function_body)
            pending_c_function_body.append(";%N")
            internal_c_local.unlock
            dump_pending_c_function(True)
         end
      end

feature {C_EXPRESSION_COMPILATION_MIXIN}
   se_ms_c_call_in (buffer: STRING; ms: MANIFEST_STRING)
      require
         not ms.unicode_flag
      local
         trace: BOOLEAN
      do
         trace := manifest_string_trace(ms, buffer)
         buffer.append(once "se_string(")
         if ace.no_check then
            buffer.append(once "&ds,")
         end
         if ace.profile then
            buffer.append(once "&local_profile,")
         end
         ms.count.append_in(buffer)
         buffer.extend(',')
         if ms.alias_link = Void then
            string_to_c_code(ms.to_string, buffer)
         else
            buffer.extend('s')
            buffer.append(ms.initial_storage_id)
         end
         buffer.extend(')')
         if trace then
            buffer.extend(')')
         end
      end

   se_ums_c_call_in (buffer: STRING; ms: MANIFEST_STRING)
      require
         ms.unicode_flag
      local
         trace: BOOLEAN; us: UNICODE_STRING; c: INTEGER
      do
         trace := manifest_string_trace(ms, buffer)
         us := ms.unicode_string
         buffer.append(once "se_ums(")
         if ace.no_check then
            buffer.append(once "&ds,")
         end
         if ace.profile then
            buffer.append(once "&local_profile,")
         end
         c := us.count
         c.append_in(buffer)
         buffer.extend(',')
         if c = 0 then
            buffer.append(once "(void*)0")
         else
            buffer.extend('s')
            buffer.append(ms.initial_storage_id)
         end
         buffer.extend(',')
         if us.low_surrogate_values = Void then
            c := 0
         else
            c := us.low_surrogate_values.count
         end
         c.append_in(buffer)
         buffer.extend(',')
         if c /= 0 then
            buffer.append(once "lsv")
            buffer.append(ms.initial_storage_id)
            buffer.append(once ",lsi")
            buffer.append(ms.initial_storage_id)
         else
            buffer.append(once "NULL, NULL")
         end
         buffer.extend(')')
         if trace then
            buffer.extend(')')
         end
      end

   manifest_string_trace (ms: MANIFEST_STRING; buffer: STRING): BOOLEAN
      local
         position: POSITION
      do
         if ms.once_flag then
            -- (Nothing to trace.)
         elseif ace.manifest_string_trace then
            Result := True
            position := ms.start_position
            buffer.append(once "%N(fprintf(SE_ERR,%"%%s\n%",")
            string_to_c_code(ms.to_string, buffer)
            buffer.append(once "),%Nfprintf(SE_ERR,%"-manifest_string_trace: line ")
            position.line.append_in(buffer)
            buffer.append(once " column ")
            position.column.append_in(buffer)
            buffer.append(once " %"")
            -- To translate strange characters, especially '\':
            string_to_c_code(position.path, buffer)
            buffer.append(once "%"\n%"),%N")
         end
      end

feature {RUN_FEATURE, ASSERTION_LIST, AGENT_CREATION, AGENT_ARGS, C_COMPILATION_MIXIN}
   local_profile
      require
         ace.profile
         pending_c_function
      do
         pending_c_function_body.append(once "se_local_profile_t local_profile;%N")
      end

   start_profile (rf: RUN_FEATURE)
      require
         ace.profile
         pending_c_function
         rf /= Void
      do
         pending_c_function_body.append(once "local_profile.profile=profile+")
         run_features.fast_first_index_of(rf).append_in(pending_c_function_body)
         pending_c_function_body.append(once ";%Nstart_profile(parent_profile, &local_profile);%N")
      end

   start_profile_class_invariant (t: LIVE_TYPE)
      require
         ace.profile
         pending_c_function
         t /= Void
      do
         smart_eiffel.register_class_invariant(t)
         pending_c_function_body.append(once "local_profile.profile=inv_profile+")
         class_invariants.fast_first_index_of(t).append_in(pending_c_function_body)
         pending_c_function_body.append(once ";%Nstart_profile(parent_profile, &local_profile);%N")
      end

   start_profile_agent_creation (ac: AGENT_CREATION)
      require
         ace.profile
         pending_c_function
         ac /= Void
      do
         smart_eiffel.register_agent_creation(ac)
         pending_c_function_body.append(once "local_profile.profile=agent_profile+")
         agent_creations.fast_first_index_of(ac).append_in(pending_c_function_body)
         pending_c_function_body.append(once ";%Nstart_profile(parent_profile, &local_profile);%N")
      end

   start_profile_agent_switch (t: TYPE)
      require
         ace.profile
         pending_c_function
         t /= Void
      do
         smart_eiffel.register_agent_switch(t)
         pending_c_function_body.append(once "local_profile.profile=agent_switch_profile+")
         agent_switches.fast_first_index_of(t).append_in(pending_c_function_body)
         pending_c_function_body.append(once ";%Nstart_profile(parent_profile, &local_profile);%N")
      end

   stop_profile
      require
         ace.profile
         pending_c_function
      do
         pending_c_function_body.append(once "stop_profile(parent_profile, &local_profile);%N")
      end

feature {C_NATIVE_FUNCTION_MAPPER, C_NATIVE_PROCEDURE_MAPPER}
   has_c_plus_plus: BOOLEAN

   c_plus_plus_registered (native: NATIVE_C_PLUS_PLUS): BOOLEAN
      require
         native /= Void
      do
         Result := has_c_plus_plus and then registered_natives.fast_has(native)
      end

   c_plus_plus_register (native: NATIVE_C_PLUS_PLUS; rf: RUN_FEATURE)
      require
         native /= Void
         rf /= Void
         not c_plus_plus_registered(native)
      do
         registered_natives.add(rf, native)
         has_c_plus_plus := True
      ensure
         c_plus_plus_registered(native)
         has_c_plus_plus
      end

   c_registered (native: NATIVE_C): BOOLEAN
      require
         native /= Void
      do
         Result := registered_natives.fast_has(native)
      end

   c_register (native: NATIVE_C; rf: RUN_FEATURE)
      require
         native /= Void
         rf /= Void
         not c_registered(native)
      do
         registered_natives.add(rf, native)
      ensure
         c_registered(native)
      end

   registered_natives: HASHED_DICTIONARY[RUN_FEATURE, NATIVE]

feature {NATIVE_C_PLUS_PLUS}
   add_include (include: STRING)
      do
         add_include_on(out_h, include)
      end

feature {}
   add_include_on (output: TEXT_FILE_WRITE; include: STRING)
      do
         end_c_linkage(output)
         output.put_string(once "#include ")
         inspect
            include.first
         when '%"', '<' then
         else
            output.put_character('%"')
         end
         output.put_string(include)
         inspect
            include.last
         when '%"', '>' then
         else
            output.put_character('%"')
         end
         output.put_character('%N')
         begin_c_linkage(output)
      end

feature {C_COMPILATION_MIXIN}
   c_declare_locals (local_var_list: LOCAL_VAR_LIST; type: TYPE; volatile_flag: BOOLEAN)
         -- Generate the C code for the declaration part. The `volatile_flag' indicates that an extra
         -- volatile C keyword must be generated because we are in the case of a routine with a rescue
         -- clause.
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > local_var_list.count
         loop
            c_declare_local(local_var_list.name(i), type, volatile_flag)
            i := i + 1
         end
      end

   c_init_closure_locals (local_var_list: LOCAL_VAR_LIST; type: TYPE)
      require
         has_closures
      local
         i: INTEGER
      do
         pending_c_function_body.append(once "/*[INIT CLOSURE LOCALS*/%N")
         from
            i := 1
         until
            i > local_var_list.count
         loop
            c_init_closure_local(local_var_list.name(i), type)
            i := i + 1
         end
         pending_c_function_body.append(once "/*INIT CLOSURE LOCALS]*/%N")
      end

feature {}
   c_declare_local (local_name: LOCAL_NAME_DEF; type: TYPE; volatile_flag: BOOLEAN)
         -- C declaration of the local.
      require
         pending_c_function
      local
         static_tm: TYPE_MARK
      do
         if local_name.is_used(type) then
            static_tm := local_name.result_type.to_static(type, False)
            if volatile_flag then
               if static_tm.is_kernel_expanded then
                  pending_c_function_body.append(once "volatile ")
               end
            end
            pending_c_function_body.append(result_type.for(static_tm))
            if local_name.is_outside(type) then
               pending_c_function_body.extend('*')
               has_closures := True
            elseif pending_c_function_body.last /= '*' then
               pending_c_function_body.extend(' ')
            end
            print_local(local_name.to_string)
            pending_c_function_body.extend('=')
            if local_name.is_outside(type) then
               pending_c_function_body.extend('(')
               pending_c_function_body.append(result_type.for(static_tm))
               pending_c_function_body.extend('*')
               pending_c_function_body.extend(')')
               memory.malloc_closure(static_tm.type.live_type)
            else
               pending_c_function_body.append(initializer.for(static_tm))
            end
            pending_c_function_body.append(once ";%N")
         end
      end

   c_init_closure_local (local_name: LOCAL_NAME_DEF; type: TYPE)
         -- C declaration of the local.
      require
         pending_c_function
         has_closures
      local
         static_tm: TYPE_MARK
      do
         if local_name.is_used(type) and then local_name.is_outside(type) then
            static_tm := local_name.result_type.to_static(type, False)
            pending_c_function_body.extend('*')
            print_local(local_name.to_string)
            pending_c_function_body.extend('=')
            pending_c_function_body.append(initializer.for(static_tm))
            pending_c_function_body.append(once ";%N")
         end
      end

feature {C_COMPILATION_MIXIN}
   external_prototype_in (formal_arg_list: FORMAL_ARG_LIST; str: STRING; tgt_type: TYPE)
      local
         i: INTEGER; t: TYPE_MARK
      do
         from
            i := 1
         until
            i > formal_arg_list.count
         loop
            if i > 1 then
               str.extend(',')
            end
            t := formal_arg_list.type_mark(i).to_static(tgt_type, False)
            str.append(external_type.for(t))
            str.extend(' ')
            str.extend('a')
            i.append_in(str)
            i := i + 1
         end
      end

feature {} -- ASSIGNMENT_TEST_POOL
   c_define_assignment_test_functions
      do
         split_c_file_padding_here
         echo.print_count(once "Assignment test (%"?:=%") function", assignment_test_pool.count)
         assignment_test_pool.for_each(agent c_define_assignment_test_for(?, ?))
      end

   c_define_assignment_test_for (left_type, right_type: TYPE)
      require
         must_be_simplified_in_boost: ace.boost implies not right_type.can_be_assigned_to(left_type)
      local
         i: INTEGER; dynamic: TYPE
      do
         prepare_c_function
         pending_c_function_signature.append(once "int ")
         assignment_test_pool.function_name_in(pending_c_function_signature, left_type, right_type)
         pending_c_function_signature.append(once "(T0* expression)")
         pending_c_function_body.append(once "/* ")
         pending_c_function_body.append(left_type.name.to_string)
         pending_c_function_body.append(once " ?:= ")
         pending_c_function_body.append(right_type.name.to_string)
         pending_c_function_body.append(once " */%Nif (expression == NULL) return 1;%N")
         if right_type.live_type /= Void then
            if right_type.live_type.run_time_set.count > 1 then
               check
                  right_type.live_type.is_tagged
               end
               pending_c_function_body.append(once "switch (expression->id) {%N")
               from
                  i := live_type_map.lower
               until
                  i > live_type_map.upper
               loop
                  dynamic := live_type_map.item(i).type
                  if dynamic.live_type.at_run_time then
                     if dynamic.can_be_assigned_to(left_type) then
                        pending_c_function_body.append(once "case ")
                        dynamic.live_type.id.append_in(pending_c_function_body)
                        pending_c_function_body.append(once "/*")
                        pending_c_function_body.append(dynamic.name.to_string)
                        pending_c_function_body.append(once "*/: return 1;%N")
                     elseif (not ace.boost) and then not dynamic.can_be_assigned_to(right_type) then
                        pending_c_function_body.append(once "case ")
                        dynamic.live_type.id.append_in(pending_c_function_body)
                        pending_c_function_body.append(once "/*")
                        pending_c_function_body.append(dynamic.name.to_string)
                        pending_c_function_body.append(once "*/: error2(expression,/*unknown-position*/0);break;%N")
                     end
                  end
                  i := i + 1
               end
               pending_c_function_body.append(once "}%Nreturn 0;%N")
            elseif right_type.live_type.run_time_set.count = 1 then
               if not ace.boost then
                  pending_c_function_body.append(once "ci(")
                  right_type.live_type.run_time_set.first.id.append_in(pending_c_function_body)
                  pending_c_function_body.append(once ",expression,/*unknown-position*/0);%N")
               end
               if right_type.live_type.run_time_set.first.type.can_be_assigned_to(left_type) then
                  pending_c_function_body.append(once "return 1;%N")
               else
                  pending_c_function_body.append(once "return 0;%N")
               end
            else
               right_hand_side_can_only_be_void
            end
         else
            right_hand_side_can_only_be_void
         end
         dump_pending_c_function(True)
      end

   right_hand_side_can_only_be_void
      do
         -- The right-hand side can only be Void:
         if not ace.boost then
            pending_c_function_body.append(once "if (expression != NULL) error2(expression,/*unknown-position*/0);%N")
         end
         pending_c_function_body.append(once "return 1;%N")
      end

feature {} -- MANIFEST_GENERIC_POOL
   c_define_manifest_generic_functions
      require
         smart_eiffel.is_ready
      do
         split_c_file_padding_here
         manifest_generic_pool.for_each(agent c_define_manifest_generic_for(?))
      end

   c_define_manifest_generic_for (manifest_generic: MANIFEST_GENERIC)
      do
         if manifest_generic.created_type.is_native_array then
            c_define_for_native_array(manifest_generic.created_type)
         else
            c_define_for_user_generic(manifest_generic)
         end
      end

   c_define_for_user_generic (manifest_generic: MANIFEST_GENERIC)
      require
         manifest_generic.created_type.live_type /= Void
         not manifest_generic.created_type.is_native_array
      local
         created_type: TYPE; created_type_id, i: INTEGER;
         af: ANONYMOUS_FEATURE; fal: FORMAL_ARG_LIST; va_type: TYPE_MARK
      do
         created_type := manifest_generic.created_type
         created_type_id := created_type.id
         af := manifest_generic.manifest_make_feature_stamp.anonymous_feature(created_type)

         prepare_c_function
         pending_c_function_signature.append(once "T0* se_manifest")
         created_type_id.append_in(pending_c_function_signature)
         pending_c_function_signature.append(once "(")
         if not ace.boost then
            pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            pending_c_function_signature.append(argument_type.for(fal.type_mark(i).resolve_in(created_type).canonical_type_mark))
            pending_c_function_signature.extend(' ')
            pending_c_function_signature.append(fal.name(i).to_string)
            pending_c_function_signature.extend(',')
            i := i + 1
         end
         pending_c_function_signature.append(once "int argc)")
         -- Prepare body:
         pending_c_function_body.append(once "/*")
         pending_c_function_body.append(created_type.name.to_string)
         pending_c_function_body.append(once "*/%NT")
         created_type_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "*C;%NC=")
         memory.malloc(created_type.live_type)
         pending_c_function_body.append(once ";%N*C=M")
         created_type_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once ";%Nr")
         created_type_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "manifest_make(")
         if not ace.boost then
            pending_c_function_body.append(once "caller,")
         end
         if ace.profile then
            pending_c_function_body.append(once "parent_profile,")
         end
         if af.use_current(created_type) or else not ace.boost then
            pending_c_function_body.append(once "C,")
         end
         pending_c_function_body.append(once "argc")
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            pending_c_function_body.extend(',')
            pending_c_function_body.append(fal.name(i).to_string)
            i := i + 1
         end
         pending_c_function_body.append(once ");%Nreturn ((T0*)C);%N")
         dump_pending_c_function(True)

         prepare_c_function
         pending_c_function_signature.append(once "T0* se_manifest_args")
         created_type_id.append_in(pending_c_function_signature)
         pending_c_function_signature.append(once "(")
         if not ace.boost then
            pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         pending_c_function_signature.append(once "T0*c,int i0,int argc,...)")
         -- Prepare body:
         af := manifest_generic.manifest_put_feature_stamp.anonymous_feature(created_type)
         fal := af.arguments
         pending_c_function_body.append(once "/*")
         pending_c_function_body.append(created_type.name.to_string)
         pending_c_function_body.append(once "*/%NT")
         created_type_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "*C=(T")
         created_type_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "*)c;%Nva_list pa;%Nint i=i0")
         if fal.count > 2 then
            pending_c_function_body.extend('/')
            (fal.count - 1).append_in(pending_c_function_body)
         end
         pending_c_function_body.append(once ";%Nint imax=i+argc")
         if fal.count > 2 then
            pending_c_function_body.extend('/')
            (fal.count - 1).append_in(pending_c_function_body)
         end
         pending_c_function_body.append(once ";%Nva_start(pa,argc);%Nwhile (i < imax) {%N")
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            va_type := fal.type_mark(i).resolve_in(created_type).canonical_type_mark
            pending_c_function_body.append(argument_type.for(va_type))
            pending_c_function_body.extend(' ')
            pending_c_function_body.append(fal.name(i).to_string)
            pending_c_function_body.append(once "=((")
            pending_c_function_body.append(argument_type.for(va_type))
            pending_c_function_body.append(once ")(va_arg(pa,")
            va_type_in(pending_c_function_body, va_type)
            pending_c_function_body.append(once ")));%N")
            i := i + 1
         end
         pending_c_function_body.append(once "r")
         created_type_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once "manifest_put(")
         if not ace.boost then
            pending_c_function_body.append(once "caller,")
         end
         if ace.profile then
            pending_c_function_body.append(once "parent_profile,")
         end
         if af.use_current(created_type) or else not ace.boost then
            pending_c_function_body.append(once "C,")
         end
         pending_c_function_body.append(once "i++")
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            pending_c_function_body.extend(',')
            pending_c_function_body.append(fal.name(i).to_string)
            i := i + 1
         end
         pending_c_function_body.append(once ");%N}%Nva_end(pa);%Nreturn c;%N")
         dump_pending_c_function(True)
      end

   c_define_for_native_array (native_array: TYPE)
      require
         native_array.live_type /= Void
         native_array.is_native_array
      local
         native_array_id: INTEGER; va_type: TYPE_MARK
      do
         native_array_id := native_array.live_type.id
         va_type := native_array.generic_list.first.canonical_type_mark

         prepare_c_function
         pending_c_function_signature.extend('T')
         native_array_id.append_in(pending_c_function_signature)
         pending_c_function_signature.append(once " se_manifest")
         native_array_id.append_in(pending_c_function_signature)
         pending_c_function_signature.extend('(')
         if not ace.boost then
            pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         pending_c_function_signature.append(once "int argc)")
         -- Prepare body:
         pending_c_function_body.append(once "/*")
         pending_c_function_body.append(native_array.name.to_string)
         pending_c_function_body.append(once "*/%NT")
         native_array_id.append_in(pending_c_function_body)
         pending_c_function_body.append(once " C=")
         memory.calloc(native_array.live_type, agent do pending_c_function_body.append(once "argc") end)
         pending_c_function_body.append(once ";%Nreturn C;%N")
         dump_pending_c_function(True)

         prepare_c_function
         pending_c_function_signature.extend('T')
         native_array_id.append_in(pending_c_function_signature)
         pending_c_function_signature.append(once " se_manifest_args")
         native_array_id.append_in(pending_c_function_signature)
         pending_c_function_signature.extend('(')
         if not ace.boost then
            pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         pending_c_function_signature.extend('T')
         native_array_id.append_in(pending_c_function_signature)
         pending_c_function_signature.append(once " C,int i,int argc,...)")
         -- Prepare body:
         pending_c_function_body.append(once "va_list pa;%Nva_start(pa,argc);%NC=")
         memory.calloc(native_array.live_type, agent do pending_c_function_body.append(once "argc") end)
         pending_c_function_body.append(once ";%Nwhile (i < argc) {%N")
         pending_c_function_body.append(argument_type.for(va_type))
         pending_c_function_body.append(once " element=((")
         pending_c_function_body.append(argument_type.for(va_type))
         pending_c_function_body.append(once ")(va_arg(pa,")
         va_type_in(pending_c_function_body, va_type)
         pending_c_function_body.append(once ")));%NC[i]=element;%Ni++;%N}%Nva_end(pa);%Nreturn C;%N")
         dump_pending_c_function(True)
      end

   va_type_in (buffer: STRING; va_type: TYPE_MARK)
      do
         buffer.append(va_arg_type.for(va_type))
      end

feature {} -- ONCE_ROUTINE_POOL
   c_variables_for_precomputable_routines
         -- Generate the C code for once routine which are precomputable.
      do
         once_routine_pool.do_all_precomputed(agent c_define_o_result_for(?))
      end

   c_define_o_result_for (non_void_no_dispatch: NON_VOID_NO_DISPATCH)
      do
         c_define_o_result(non_void_no_dispatch.run_feature)
      end

   c_code_for_precomputable_routines
         -- Generate the C code for once routine which are precomputable.
      require
         smart_eiffel.is_ready
      local
         unique_id_set: HASHED_SET[STRING]
      do
         echo.put_string(once "Order of evaluation for pre-computed once functions:%N")
         create unique_id_set.make
         -- Note: the `precomputable_function_list' must be generated in good order because
         -- we may have dependencies between precomputed once functions.
         once_routine_pool.do_all_precomputed_ordered(agent c_code_for_precomputable_routine(?, unique_id_set))
         if unique_id_set.count > 0 then
            echo.print_count(once "Precomputed once function", unique_id_set.count)
         end
      end

   c_code_for_precomputable_routine (non_void_no_dispatch: NON_VOID_NO_DISPATCH; unique_id_set: HASHED_SET[STRING])
         -- Generate the C code for once routine which are precomputable.
      require
         smart_eiffel.is_ready
      local
         once_function: ONCE_FUNCTION; unique_id: STRING
      do
         -- Only collected one are generated, but we must also make sure that it is not yet generated
         -- (more than one `non_void_no_dispatch' may correspond to the same `once_function'):
         once_function := non_void_no_dispatch.once_function
         unique_id := once "... unique buffer ..."
         unique_id.clear_count
         once_routine_pool.unique_id_in(unique_id, once_function)
         if not unique_id_set.has(unique_id) then
            unique_id_set.add(unique_id.twin)
            -- Only collected one are generated:
            echo.put_string(once "%T{")
            echo.put_string(once_function.class_text.name.to_string)
            echo.put_string(once "}.")
            echo.put_string(once_function.first_name.to_string)
            echo.put_string(once "%N")
            pending_c_function_body.append(once "/*PCO:{")
            pending_c_function_body.append(once_function.class_text.name.to_string)
            pending_c_function_body.append(once "}.")
            pending_c_function_body.append(once_function.first_name.to_string)
            pending_c_function_body.append(once "*/%N")
            c_pre_compute_once_function(non_void_no_dispatch.run_feature, once_function)
         end
      end

   c_pre_compute_once_function (rf: RUN_FEATURE; bf: ANONYMOUS_FEATURE)
      require
         rf.is_once_function
         pending_c_function
      local
         type: TYPE; rt: TYPE_MARK; local_vars: LOCAL_VAR_LIST; default_create_procedure: RUN_FEATURE
         id, class_invariant_flag: INTEGER; internal_c_local: INTERNAL_C_LOCAL
      do
         type := rf.type_of_current
         if rf.require_assertion /= Void then
            pending_c_function_body.append(once "/*  - require*/%N")
            code_compiler.compile(rf.require_assertion, type)
         else
            pending_c_function_body.append(once "/*  - NO require*/%N")
         end
         rt := rf.result_type
         if rt.is_user_expanded then
            pending_c_function_body.append(once "/*  - user expanded*/%N")
            default_create_procedure := rt.type.live_type.default_create_run_feature
            if default_create_procedure /= Void then
               id := rt.type.id
               internal_c_local := pending_c_function_lock_local(rt.type, once "orp")
               internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.append(once "=M")
               id.append_in(pending_c_function_body)
               pending_c_function_body.append(once ";%N")
               push_create_instruction(type, default_create_procedure, Void, internal_c_local)
               mapper.compile(default_create_procedure)
               pop
               once_routine_pool.unique_result_in(pending_c_function_body, rf.base_feature)
               pending_c_function_body.extend('=')
               internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.append(once ";%N")
               internal_c_local.unlock
            end
            class_invariant_flag := class_invariant_call_opening(rt.type, True)
            if class_invariant_flag > 0 then
               if rt.is_expanded and then cpp.need_struct.for(rt) then
                  pending_c_function_body.extend('&')
               end
               once_routine_pool.unique_result_in(pending_c_function_body, rf.base_feature)
               class_invariant_call_closing(class_invariant_flag, True)
            end
         else
            pending_c_function_body.append(once "/*  - NO user expanded*/%N")
         end
         --
         local_vars := rf.local_vars
         if local_vars /= Void then
            pending_c_function_body.append(once "/*  - local vars*/%N")
            pending_c_function_body.extend('{')
            c_declare_locals(local_vars, rf.type_of_current, False)
            if has_closures then
               c_init_closure_locals(local_vars, rf.type_of_current)
            end
         else
            pending_c_function_body.append(once "/*  - NO local vars*/%N")
         end
         --
         if rf.routine_body /= Void then
            pending_c_function_body.append(once "/*  - routine body*/%N")
            code_compiler.compile(rf.routine_body, type)
         else
            pending_c_function_body.append(once "/*  - NO routine body*/%N")
         end
         --
         if rf.ensure_assertion /= Void then
            pending_c_function_body.append(once "/*  - ensure*/%N")
            code_compiler.compile(rf.ensure_assertion, type)
         else
            pending_c_function_body.append(once "/*  - NO ensure*/%N")
         end
         --
         if local_vars /= Void then
            pending_c_function_body.extend('}')
         end
      end

   once_flag (mark: STRING): BOOLEAN
         -- Flag used to avoid double C definition of globals C variables for
         -- once routines.
      require
         string_aliaser.registered_one(mark)
         smart_eiffel.is_ready
      do
         if once_mark_list = Void then
            create once_mark_list.with_capacity(4)
            once_mark_list.add_last(mark)
         elseif once_mark_list.fast_has(mark) then
            Result := True
         else
            once_mark_list.add_last(mark)
         end
      ensure
         once_flag(mark)
      end

   once_mark_list: FAST_ARRAY[STRING]
         -- When the tag is in the list, the corresponding routine
         -- does not use Current and C code is already written.

feature {RUN_FEATURE_5, RUN_FEATURE_6, C_COMPILATION_MIXIN}
   c_define_o_flag (rf: RUN_FEATURE)
         -- Add the definition/initialization of the corresponding `o_flag' if not yet done.
      require
         rf.is_once_routine
      local
         bf: ANONYMOUS_FEATURE; bcbf: CLASS_TEXT; flag: STRING
      do
         bf := rf.base_feature
         bcbf := bf.class_text
         flag := once_routine_pool.o_flag(bf)
         if not once_flag(flag) then
            if smart_eiffel.thread_used then
               out_h_buffer.copy(once "TLS(int)")
            else
               out_h_buffer.copy(once "int ")
            end
            out_h_buffer.append(flag)
            write_extern_0(out_h_buffer)
         end
      end

   c_define_o_result (rf: RUN_FEATURE)
      require
         rf.is_once_function
      local
         bf: ANONYMOUS_FEATURE; unique_result: STRING; rt: TYPE_MARK
      do
         bf := rf.base_feature
         unique_result := once "............ unique buffer ..........."
         unique_result.clear_count
         once_routine_pool.unique_result_in(unique_result, bf)
         unique_result := unique_result.twin
         unique_result := string_aliaser.string(unique_result)
         if not once_flag(unique_result) then
            out_h_buffer.clear_count
            if smart_eiffel.thread_used then
               out_h_buffer.append(once "TLS(")
            end
            rt := rf.result_type
            out_h_buffer.extend('T')
            if rt.is_expanded then
               rt.type.id.append_in(out_h_buffer)
               out_h_buffer.extend(' ')
            else
               out_h_buffer.append(once "0*")
            end
            if smart_eiffel.thread_used then
               out_h_buffer.append(once ")")
            end
            out_h_buffer.append(unique_result)
            out_c_buffer.copy(initializer.for(rt))
            write_extern_2(out_h_buffer, out_c_buffer)
         end
      end

   c_test_o_flag (rf: RUN_FEATURE)
      require
         rf.is_once_routine
      local
         flag: STRING
      do
         flag := once_routine_pool.o_flag(rf.base_feature)
         pending_c_function_body.append(once "if(")
         pending_c_function_body.append(flag)
         pending_c_function_body.append(once "==0){")
         pending_c_function_body.append(flag)
         pending_c_function_body.append(once "=1;{%N")
      end

   c_test_o_flag_recursion (rf: RUN_FEATURE)
      require
         rf.is_once_routine
      local
         flag: STRING
      do
         if not ace.require_check then
            pending_c_function_body.append(once "}}%N")
         else
            flag := once_routine_pool.o_flag(rf.base_feature)
            pending_c_function_body.append(once "}%N")
            pending_c_function_body.append(flag)
            pending_c_function_body.append(once "=2;}%Nelse{%N")
            pending_c_function_body.append(once "ac_req(")
            pending_c_function_body.append(flag)
            pending_c_function_body.append(once "==2, %"Recursive once function.%");%N}%N")
         end
      end

   c_test_o_flag_introspect (rf: RUN_FEATURE)
      require
         rf.is_once_routine
      local
         flag: STRING
      do
         flag := once_routine_pool.o_flag(rf.base_feature)
         pending_c_function_body.append(once "if(")
         pending_c_function_body.append(flag)
         pending_c_function_body.append(once "!=0){%N")
      end

feature {} -- CECIL_POOL
   cecil_define
      local
         save_out_h: like out_h
      do
         save_out_h := out_h
         cecil_pool.for_each(agent cecil_define_users_for_file(?))
         out_h := save_out_h
      end

   cecil_define_users_for_file (cecil_file: CECIL_FILE)
      require
         not pending_c_function
      do
         if cecil_file.has_entries then
            echo.put_string(once "Cecil (C function for external code) :%N")
            connect_cecil_out_h(cecil_file.path_h)
            cecil_file.for_each(agent cecil_define_users_for_entry(cecil_file, ?))
            disconnect_cecil_out_h
         end
      end

   cecil_define_users_for_entry (cecil_file: CECIL_FILE; cecil_entry: CECIL_ENTRY)
      require
         not pending_c_function
      local
         type: TYPE; result_type_mark: TYPE_MARK; arguments: FORMAL_ARG_LIST; af: ANONYMOUS_FEATURE
         internal_c_local: INTERNAL_C_LOCAL
      do
         cecil_entry.on_echo(cecil_file)

         type := smart_eiffel.type_any
         af := cecil_entry.anonymous_feature
         result_type_mark := af.result_type
         if result_type_mark /= Void then
            result_type_mark := result_type_mark.to_static(cecil_entry.target_type, False)
         end
         arguments := af.arguments
         prepare_c_function
         if cecil_entry.is_creation then
            pending_c_function_signature.append(external_type.for(cecil_entry.target_type_mark))
         else
            pending_c_function_signature.append(external_type.for(result_type_mark))
         end
         pending_c_function_signature.extend(' ')
         pending_c_function_signature.append(cecil_entry.c_name)
         pending_c_function_signature.extend('(')
         if cecil_entry.is_creation then
            if arguments = Void then
               pending_c_function_signature.append(once "void")
            else
               external_prototype_in(arguments, pending_c_function_signature, cecil_entry.target_type)
            end
         else
            pending_c_function_signature.append(external_type.for(cecil_entry.target_type_mark))
            pending_c_function_signature.append(once " C")
            if arguments /= Void then
               pending_c_function_signature.extend(',')
               external_prototype_in(arguments, pending_c_function_signature, cecil_entry.target_type)
            end
         end
         pending_c_function_signature.extend(')')
         if cecil_entry.is_creation then
            pending_c_function_body.append(external_type.for(cecil_entry.target_type_mark))
            pending_c_function_body.append(once " C;%N")
         elseif result_type_mark /= Void then
            pending_c_function_body.append(external_type.for(result_type_mark))
            pending_c_function_body.append(once " R;%N")
         end
         memory.pre_cecil_define
         if ace.no_check then
            pending_c_function_body.append(once "se_dump_stack ds={NULL,NULL,0,NULL,NULL,NULL,0};%N%
                                                %ds.caller=se_dst;%N%
                                                %ds.exception_origin=NULL;%N%
                                                %ds.locals=NULL;%N")
            set_dump_stack_top_for(cecil_entry.target_type, once "&ds", once "link")
         end
         memory.cecil_define
         if cecil_entry.is_creation then
            --sedb_breakpoint --| *** TODO
            pending_c_function_body.append(once "/* CECIL creation */%N{%N")
            internal_c_local := pending_c_function_lock_local(cecil_entry.target_type, once "cecilcrea")
            if cecil_entry.target_type.is_reference then
               memory.allocation_of(internal_c_local, cecil_entry.target_type.live_type)
            else
               internal_c_local.append_in(pending_c_function_body)
               pending_c_function_body.append(once "=M")
               cecil_entry.target_type.live_type.id.append_in(pending_c_function_body)
               pending_c_function_body.append(once ";%N")
            end
            pending_c_function_body.append(once "C=")
            internal_c_local.append_in(pending_c_function_body)
            internal_c_local.unlock
            pending_c_function_body.append(once ";%N}")
            push_cecil_create(cecil_entry.target_type, cecil_entry.run_feature)
            mapper.compile(cecil_entry.run_feature)
            pop
         elseif cecil_entry.code = Void then
            -- Well, nothing to do.
         elseif result_type_mark = Void then
            code_compiler.compile(cecil_entry.code, type)
         else
            check
               not cecil_entry.is_creation
            end
            compound_expression_compiler.compile(once "R=", cecil_entry.code.to_expression, once ";%N", type)
         end
         memory.post_cecil_define
         if ace.no_check then
            set_dump_stack_top_for(cecil_entry.target_type, once "ds.caller", once "unlink")
         end
         if cecil_entry.is_creation then
            pending_c_function_body.append(once "return C;%N")
         elseif result_type_mark /= Void then
            pending_c_function_body.append(once "return R;%N")
         end
         dump_pending_c_function(True)
      end

invariant
   registered_natives.for_all(agent (rf: RUN_FEATURE; native: NATIVE): BOOLEAN
      do
         Result := (({NATIVE_C} ?:= native) or else ({NATIVE_C_PLUS_PLUS} ?:= native))
            and then (({RUN_FEATURE_7} ?:= rf) or else ({RUN_FEATURE_8} ?:= rf))
      end (?, ?))

end -- class C_PRETTY_PRINTER
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
