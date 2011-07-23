-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_STRING_POOL
   --
   -- Unique global object in charge of once manifest string used (i.e. once
   -- manifest string in live code).
   --

insert
   GLOBALS
   STRING_HANDLER
      undefine is_equal
      end
   UNICODE_STRING_HANDLER
      undefine is_equal
      end

feature {MANIFEST_STRING}
   collect (ms: MANIFEST_STRING; once_flag, unicode_flag: BOOLEAN; type: TYPE): STRING is
         -- The `Result' is the name of the corresponding "ms_XXX" global variable (only when `once_flag' is True).
      require
         once_flag = ms.once_flag
         unicode_flag = ms.unicode_flag
         type.is_string xor type.is_unicode_string
      local
         storage_id: STRING; ms2: MANIFEST_STRING; position: POSITION; dummy: TYPE
      do
         position := ms.start_position
         ms2 := storage_alias.reference_at(ms)
         if ms2 = Void then
            storage_id := ms.initial_storage_id
            if storage_id /= Void and then not collected_storage_id_set.has(storage_id) then
               -- (Was previously computed.)
            else
               cpp.out_h_buffer.clear_count
               position.class_text.id.append_in(cpp.out_h_buffer)
               cpp.out_h_buffer.extend('_')
               ms.hash_code.append_in(cpp.out_h_buffer)
               from
               until
                  not collected_storage_id_set.has(cpp.out_h_buffer)
               loop
                  cpp.out_h_buffer.extend('a')
               end
               storage_id := cpp.out_h_buffer.twin
               ms.set_initial_storage_id(storage_id)
            end
            collected_storage_id_set.add(storage_id)
            storage_alias.put(ms, ms)
         else
            ms.storage_alias_of(ms2)
         end
         if once_flag then
            Result := ms.once_variable
            if Result = Void then
               cpp.out_h_buffer.copy(once "ms")
               cpp.out_h_buffer.append(ms.initial_storage_id)
               cpp.out_h_buffer.append(once "bc")
               position.class_text.id.append_in(cpp.out_h_buffer)
               extend_once_variable
               Result := cpp.out_h_buffer.twin
            end
            collected_once_variables.put(ms, Result)
         end
         if unicode_flag and then not first_unicode_manifest_string_collected_flag then
            first_unicode_manifest_string_collected_flag := True
            if unicode_string_manifest_initialize_stamp = Void then
               check
                  type.is_unicode_string
               end
               unicode_string_type := type
               unicode_string_manifest_initialize_stamp := type.feature_stamp_of(manifest_initialize_name)
            end
            dummy := smart_eiffel.collect(type, unicode_string_manifest_initialize_stamp, True)
         end
         -- In all cases, we need at least make STRING live:
         if not first_manifest_string_collected_flag then
            first_manifest_string_collected_flag := True
            collect_string(type)
         end
      ensure
         once_flag implies Result /= Void
      end

   se_ms_c_call_in (buffer: STRING; ms: MANIFEST_STRING) is
      require
         not ms.unicode_flag
      local
         trace: BOOLEAN
      do
         trace := manifest_string_trace(ms, buffer)
         buffer.append(once "se_ms(")
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

   se_ums_c_call_in (buffer: STRING; ms: MANIFEST_STRING) is
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

feature {}
   extend_once_variable is
      local
         index, up: INTEGER
      do
         up := cpp.out_h_buffer.upper
         from
            index := 0
            append_once_variable_index(index)
         until
            not collected_once_variables.has(cpp.out_h_buffer)
         loop
            cpp.out_h_buffer.shrink(cpp.out_h_buffer.lower, up)
            index := index + 1
            append_once_variable_index(index)
         end
      ensure
         not collected_once_variables.has(cpp.out_h_buffer)
         cpp.out_h_buffer.count > old cpp.out_h_buffer.count
      end

   append_once_variable_index (index: INTEGER) is
      require
         index >= 0
      local
         q, r: INTEGER; s: STRING; done: BOOLEAN
      do
         s := once "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
         from
            q := index
         until
            done
         loop
            r := q \\ s.count
            cpp.out_h_buffer.extend(s.item(r + s.lower))
            q := q // s.count
            done := q = 0
         end
      ensure
         cpp.out_h_buffer.count > old cpp.out_h_buffer.count
      end

feature {EXTERNAL_FUNCTION, SMART_EIFFEL}
   collect_string (string_type: TYPE) is
      require
         string_type.is_string
      local
         fs: FEATURE_STAMP; dummy, native_array: TYPE
      do
         -- Collect all fields of STRING:
         fs := string_type.feature_stamp_of(storage_name)
         native_array := smart_eiffel.collect(string_type, fs, True)
         fs := native_array.feature_stamp_of(calloc_name)
         dummy := smart_eiffel.collect(native_array, fs, True)
         fs := string_type.feature_stamp_of(count_name)
         dummy := smart_eiffel.collect(string_type, fs, True)
         fs := string_type.feature_stamp_of(capacity_name)
         dummy := smart_eiffel.collect(string_type, fs, True)
      end

feature {SMART_EIFFEL}
   reset is
         -- Called before a re-collect cycle.
      do
         first_manifest_string_collected_flag := False
         first_unicode_manifest_string_collected_flag := False
         collected_once_variables.clear_count
         storage_alias.clear_count
         collected_storage_id_set.clear_count
      end

feature {C_PRETTY_PRINTER}
   c_define1 (string_at_run_time: BOOLEAN) is
      local
         i, j, upper: INTEGER; ms: MANIFEST_STRING; us: UNICODE_STRING; storage: NATIVE_ARRAY[INTEGER_16]
         lsv: FAST_ARRAY[INTEGER_16]; lsi: FAST_ARRAY[INTEGER]
      do
         from
            cpp.out_c_buffer.copy(once "/*Aliased storage area or unicode storage.*/%N")
            cpp.write_out_c_buffer
            i := storage_alias.lower
         until
            i > storage_alias.count
         loop
            ms := storage_alias.item(i)
            if ms.unicode_flag then
               us := ms.unicode_string
               upper := us.count
               if upper > 0 then
                  -- Preparing `cpp.write_extern_array_1' call:
                  cpp.out_h_buffer.copy(once "uint16_t s")
                  cpp.out_h_buffer.append(ms.initial_storage_id)
                  cpp.out_c_buffer.clear_count
                  from
                     storage := us.storage
                     j := 0
                  until
                     j >= upper
                  loop
                     storage.item(j).append_in(cpp.out_c_buffer)
                     j := j + 1
                     if j <= upper then
                        cpp.out_c_buffer.extend(',')
                     end
                  end
                  cpp.write_extern_array_1(cpp.out_h_buffer, upper, cpp.out_c_buffer)
                  upper := upper - 1
               end
               lsv := us.low_surrogate_values
               if lsv /= Void and then lsv.count > 0 then
                  -- Preparing `cpp.write_extern_array_1' call:
                  cpp.out_h_buffer.copy(once "uint16_t lsv")
                  cpp.out_h_buffer.append(ms.initial_storage_id)
                  cpp.out_c_buffer.clear_count
                  from
                     j := 0
                  until
                     j > lsv.upper
                  loop
                     lsv.item(j).append_in(cpp.out_c_buffer)
                     j := j + 1
                     if j <= lsv.upper then
                        cpp.out_c_buffer.extend(',')
                     end
                  end
                  cpp.write_extern_array_1(cpp.out_h_buffer, upper, cpp.out_c_buffer)
               end
               lsi := us.low_surrogate_indexes
               if lsi /= Void and then lsi.count > 0 then
                  -- Preparing `cpp.write_extern_array_1' call:
                  cpp.out_h_buffer.copy(once "uint32_t lsi")
                  cpp.out_h_buffer.append(ms.initial_storage_id)
                  cpp.out_c_buffer.clear_count
                  from
                     j := 0
                  until
                     j > lsi.upper
                  loop
                     lsi.item(j).append_in(cpp.out_c_buffer)
                     j := j + 1
                     if j <= lsi.upper then
                        cpp.out_c_buffer.extend(',')
                     end
                  end
                  cpp.write_extern_array_1(cpp.out_h_buffer, upper, cpp.out_c_buffer)
               end
            elseif ms.alias_link /= Void then
               cpp.out_h_buffer.copy(once "char*s")
               cpp.out_h_buffer.append(ms.initial_storage_id)
               cpp.out_c_buffer.clear_count
               string_to_c_code(ms.to_string, cpp.out_c_buffer)
               cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
            end
            i := i + 1
         end
      end

   c_define2 (string_at_run_time: BOOLEAN) is
      local
         i, j, function_count, mdc, id: INTEGER; ms: MANIFEST_STRING; no_check: BOOLEAN; lt: LIVE_TYPE
         internal_c_local: INTERNAL_C_LOCAL
      do
         cpp.split_c_file_padding_here
         no_check := ace.no_check
         mdc := collected_once_variables.count
         echo.print_count(once "Manifest String", mdc)
         if mdc > 0 then
            from
               -- For the *.h file:
               i := 1
            until
               i > mdc
            loop
               ms := collected_once_variables.item(i)
               cpp.out_h_buffer.copy(once "T0*")
               cpp.out_h_buffer.append(ms.once_variable)
               cpp.write_extern_1(cpp.out_h_buffer)
               i := i + 1
            end
         end
         --
         if string_at_run_time then
            cpp.prepare_c_function
            cpp.pending_c_function_signature.copy(once "T0*se_ms(int c,char*e)")
            cpp.pending_c_function_body.copy(once "/* Allocate a Manifest STRING.*/%NT7*")
            common_body_for_se_string_and_se_ms(string_at_run_time)
            cpp.dump_pending_c_function(True)
            --
            cpp.prepare_c_function
            cpp.pending_c_function_signature.copy(once "T0*se_string(char*e)")
            cpp.pending_c_function_body.copy(once "/* Allocate an Eiffel STRING by copying C char*e */%N%
                                                  %int c=strlen(e);%N%
                                                  %T7*")
            common_body_for_se_string_and_se_ms(string_at_run_time)
            cpp.dump_pending_c_function(True)
         end
         --
         if mdc > 0 then
            from
               -- For the *.c file:
               i := 1
               function_count := 1
            until
               function_count > 1 and then i > mdc
            loop
               cpp.prepare_c_function
               cpp.pending_c_function_signature.copy(once "void se_msi")
               function_count.append_in(cpp.pending_c_function_signature)
               if ace.profile and then first_unicode_manifest_string_collected_flag then
                  cpp.pending_c_function_signature.append(once "(se_local_profile_t*parent_profile)")
               else
                  cpp.pending_c_function_signature.append(once "(void)")
               end
               from
                  if first_unicode_manifest_string_collected_flag then
                     if ace.profile then
                        cpp.pending_c_function_body.append(once "se_local_profile_t local_profile;%Nstatic se_profile_t prof;%N")
                     end
                     if no_check then
                        cpp.pending_c_function_body.append(once "[
                                                                 se_frame_descriptor fd={"<global-once>",0,0,"",1};
                                                                 se_dump_stack ds;
                                                                 ds.fd=&fd;
                                                                 ds.p=0;
                                                                 ds.caller=NULL;
                                                                 ds.exception_origin=NULL;
                                                                 ds.locals=NULL;

                                                                 ]")
                     end
                     if ace.profile then
                        cpp.pending_c_function_body.append(once "local_profile.profile=&prof;%N")
                        cpp.pending_c_function_body.append(once "init_profile(&prof, %"se_msi")
                        function_count.append_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "%");%Nstart_profile(parent_profile, &local_profile);%N")
                     end
                  end
                  j := nb_ms_per_function
               until
                  j = 0 or else i > mdc
               loop
                  ms := collected_once_variables.item(i)
                  cpp.pending_c_function_body.append(ms.once_variable)
                  cpp.pending_c_function_body.extend('=')
                  if ms.unicode_flag then
                     se_ums_c_call_in(cpp.pending_c_function_body, ms)
                  else
                     se_ms_c_call_in(cpp.pending_c_function_body, ms)
                  end
                  cpp.pending_c_function_body.append(once ";%N")
                  j := j - 1
                  i := i + 1
               end
               function_count := function_count + 1
               if i <= mdc then
                  cpp.pending_c_function_body.append(once "se_msi")
                  function_count.append_in(cpp.pending_c_function_body)
                  if ace.profile and then first_unicode_manifest_string_collected_flag then
                     cpp.pending_c_function_body.append(once "(&local_profile);%N")
                  else
                     cpp.pending_c_function_body.append(once "();")
                  end
               end
               if ace.profile and then first_unicode_manifest_string_collected_flag then
                  cpp.pending_c_function_body.append(once "stop_profile(parent_profile, &local_profile);%N")
               end
               cpp.dump_pending_c_function(True)
            end
         end
         if first_unicode_manifest_string_collected_flag then
            if se_ums = Void then
               -- Yes, this is the very first usage of `se_ums':
               se_ums := unicode_string_manifest_initialize_stamp.run_feature_for(unicode_string_type)
            end
            lt := se_ums.type_of_current.live_type
            id := lt.id
            cpp.prepare_c_function
            cpp.pending_c_function_signature.copy("T0*se_ums(")
            if no_check then
               cpp.pending_c_function_signature.append("se_dump_stack*caller,")
            end
            if ace.profile then
               cpp.pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
            end
            cpp.pending_c_function_signature.append("int32_t c,uint16_t*s,int32_t sc,int16_t*lsv,int32_t*lsi)")
            internal_c_local := cpp.pending_c_function_lock_local(lt.type, once "mspalloc")
            gc_handler.allocation_of(internal_c_local, lt)
            cpp.pending_c_function_body.extend('r')
            id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append("manifest_initialize(")
            if no_check then
               cpp.pending_c_function_body.append("caller,")
            end
            if ace.profile then
               cpp.pending_c_function_body.append(once "parent_profile,")
            end
            cpp.pending_c_function_body.extend('(')
            if internal_c_local.type.is_reference then
               cpp.pending_c_function_body.append(once "(T")
               id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "*)")
            end
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append("),c,(int16_t*)s,sc,lsv,lsi);return (T0*)")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(";%N")
            internal_c_local.unlock
            cpp.dump_pending_c_function(True)
         end
      end

feature {C_PRETTY_PRINTER, MANIFEST_STRING, CODE, RUN_FEATURE, EIFFEL_TO_LISAAC}
   string_to_c_code (s: STRING; c_code: STRING) is
         -- Add in the `c_code' buffer, the C language view of the Eiffel `s' STRING.
         -- (Replace all strange character of `s' with the appropriate C \ escape sequence).
         --|*** Is it the right place for such a tool ?
         --|*** ... probably in the C pretty_printer would be a better choice ?
         --|*** ... no time to decide now. *** (Dom july 12th 2004) ***
      do
         native_array_to_c_code(s.count, s.storage, c_code)
      end

feature {C_PRETTY_PRINTER}
   character_to_c_code (c: CHARACTER; c_code: STRING) is
      do
         if c = '%N' then
            c_code.extend('\')
            c_code.extend('n')
         elseif c = '\' then
            c_code.extend('\')
            c_code.extend('\')
         elseif c = '?' then
            c_code.extend('\')
            c_code.extend('?')
         elseif c = '%"' then
            c_code.extend('\')
            c_code.extend('%"')
         elseif c = '%'' then
            c_code.extend('\')
            c_code.extend('%'')
         elseif c.code < 32 or else 122 < c.code then
            c_code.extend('\')
            c.code.low_8.to_octal_in(c_code)
            c_code.append(once "%"%"")
         else
            c_code.extend(c)
         end
      end

   c_call_initialize is
      require
         cpp.pending_c_function
      do
         if collected_once_variables.count > 0 then
            if ace.profile and then first_unicode_manifest_string_collected_flag then
               cpp.pending_c_function_body.append(once "se_msi1(&local_profile);%N")
            else
               cpp.pending_c_function_body.append(once "se_msi1();%N")
            end
         end
      ensure
         cpp.pending_c_function
      end

feature {GC_HANDLER}
   define_manifest_string_mark is
      local
         i, mdc, ms_count, function_count, id, us_id: INTEGER; ms: MANIFEST_STRING
      do
         mdc := collected_once_variables.count
         function_count := 1
         cpp.prepare_c_function
         manifest_string_mark_signature(function_count)
         from
            i := 1
            if first_unicode_manifest_string_collected_flag then
               us_id := se_ums.type_of_current.live_type.id
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
            ms := collected_once_variables.item(i)
            cpp.pending_c_function_body.append(once "gc_mark")
            if ms.unicode_flag then
               id := us_id
            else
               id := 7
            end
            id.append_in(cpp.pending_c_function_body)
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

feature {JVM}
   jvm_define_fields is
      local
         cp: like constant_pool; ms: MANIFEST_STRING; name_idx, string_idx, i, mdc: INTEGER
      do
         mdc := collected_once_variables.count
         if mdc > 0 then
            cp := constant_pool
            string_idx := cp.idx_eiffel_string_descriptor
            from
               i := 1
            until
               i > mdc
            loop
               ms := collected_once_variables.item(i)
               name_idx := cp.idx_utf8(ms.once_variable)
               field_info.add(9, name_idx, string_idx)
               i := i + 1
            end
         end
      end

   jvm_initialize_fields is
      local
         cp: like constant_pool; ca: like code_attribute; ms: MANIFEST_STRING; i, mdc: INTEGER
      do
         mdc := collected_once_variables.count
         if mdc > 0 then
            cp := constant_pool
            ca := code_attribute
            from
               i := 1
            until
               i > mdc
            loop
               ms := collected_once_variables.item(i)
               ca.opcode_push_manifest_string(ms.to_string)
               ca.opcode_putstatic(ms.fieldref_idx, -1)
               i := i + 1
            end
         end
      end

feature {}
   first_manifest_string_collected_flag: BOOLEAN
         -- Switch to detect that at least one MANIFEST_STRING has been collected.
         -- (To avoid feature stamp recomputation.)

   first_unicode_manifest_string_collected_flag: BOOLEAN
         -- Switch to detect that at least one MANIFEST_STRING has been collected.
         -- (To avoid feature stamp recomputation.)

   collected_once_variables: DICTIONARY[MANIFEST_STRING, STRING] is
         -- To allocate different global variables names for each collected "once" manifest string.
      once
         create {HASHED_DICTIONARY[MANIFEST_STRING, STRING]} Result.with_capacity(4096)
      end

   storage_alias: DICTIONARY[MANIFEST_STRING, MANIFEST_STRING] is
         -- For storage aliasing.
      once
         create {HASHED_DICTIONARY[MANIFEST_STRING, MANIFEST_STRING]} Result.with_capacity(4096)
      end

   collected_storage_id_set: SET[STRING] is
         -- Because we share common initial storage amongs collected MANIFEST_STRINGs, we have to maintain this set up to
         -- date while collecting.
      once
         create {HASHED_SET[STRING]} Result.with_capacity(4096)
      end

   native_array_to_c_code (capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]; c_code: STRING) is
      local
         break, i: INTEGER
      do
         c_code.extend('%"')
         from
         until
            i >= capacity
         loop
            character_to_c_code(storage.item(i), c_code)
            i := i + 1
            break := break + 1
            if break > 1024 then
               -- Because of a limitation of the Visual C/C++ compiler which do not like too long lines:
               c_code.append(once "%"%N%"")
               break := 0
            end
         end
         c_code.extend('%"')
      end

   common_body_for_se_string_and_se_ms (string_at_run_time: BOOLEAN) is
      require
         cpp.pending_c_function
      do
         gc_handler.manifest_string_in(cpp.pending_c_function_body, string_at_run_time)
         cpp.pending_c_function_body.append(once "s->_count=c;%N%
                                                 %s->_capacity=c+1;%N%
                                                 %s->_storage_lower=0;%N%
                                                 %s->_storage=((T9)")
         gc_handler.native9_in(cpp.pending_c_function_body, string_at_run_time)
         cpp.pending_c_function_body.append(once "(c+1));%N%
                                                 %memcpy(s->_storage,e,c+1);%N%
                                                 %return((T0*)s);")
      end

   manifest_string_mark_signature (number: INTEGER) is
      require
         cpp.pending_c_function
      do
         cpp.pending_c_function_signature.copy(once "void manifest_string_mark")
         number.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(void)")
      end

   nb_ms_per_function: INTEGER is 50

   manifest_string_trace (ms: MANIFEST_STRING; buffer: STRING): BOOLEAN is
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

   unicode_string_manifest_initialize_stamp: FEATURE_STAMP
         -- Feature stamp for {UNICODE_STRING}.manifest_initialize which is actually the body of `se_ums'.

   unicode_string_type: TYPE
         -- Is cached here too in order to get `se_ums' later.

   se_ums: RUN_FEATURE
         -- The one of `unicode_string_manifest_initialize_stamp'.

end -- class MANIFEST_STRING_POOL
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
