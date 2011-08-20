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
         storage_id, buffer: STRING; ms2: MANIFEST_STRING; position: POSITION; dummy: TYPE
      do
         buffer := once "................"

         position := ms.start_position
         ms2 := storage_alias.reference_at(ms)
         if ms2 = Void then
            storage_id := ms.initial_storage_id
            if storage_id /= Void and then not collected_storage_id_set.has(storage_id) then
               -- (Was previously computed.)
            else
               buffer.clear_count
               position.class_text.id.append_in(buffer)
               buffer.extend('_')
               ms.hash_code.append_in(buffer)
               make_unique(buffer, agent_exists_in_collected_storage_id_set)
               storage_id := buffer.twin
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
               buffer.copy(once "ms")
               buffer.append(ms.initial_storage_id)
               buffer.append(once "bc")
               position.class_text.id.append_in(buffer)
               make_unique(buffer, agent_exists_in_collected_once_variables)
               Result := buffer.twin
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

feature {}
   make_unique (buffer: STRING; exists: PREDICATE[TUPLE[STRING]]) is
      local
         index, up: INTEGER
      do
         up := buffer.upper
         from
            index := 0
            append_once_variable_index(buffer, index)
         until
            not exists.item([buffer])
         loop
            buffer.shrink(buffer.lower, up)
            index := index + 1
            append_once_variable_index(buffer, index)
         end
      ensure
         not exists.item([buffer])
         buffer.count > old buffer.count
      end

   append_once_variable_index (buffer: STRING; index: INTEGER) is
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
            buffer.extend(s.item(r + s.lower))
            q := q // s.count
            done := q = 0
         end
      ensure
         buffer.count > old buffer.count
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
   agent_exists_in_collected_once_variables: PREDICATE[TUPLE[STRING]] is
      once
         Result := agent exists_in_collected_once_variables
      end

   exists_in_collected_once_variables (a_string: STRING): BOOLEAN is
      do
         Result := collected_once_variables.has(a_string)
      end

   agent_exists_in_collected_storage_id_set: PREDICATE[TUPLE[STRING]] is
      once
         Result := agent exists_in_collected_storage_id_set
      end

   exists_in_collected_storage_id_set (a_string: STRING): BOOLEAN is
      do
         Result := collected_storage_id_set.has(a_string)
      end

feature {ANY}
   first_manifest_string_collected_flag: BOOLEAN
         -- Switch to detect that at least one MANIFEST_STRING has been collected.
         -- (To avoid feature stamp recomputation.)

   first_unicode_manifest_string_collected_flag: BOOLEAN
         -- Switch to detect that at least one MANIFEST_STRING has been collected.
         -- (To avoid feature stamp recomputation.)

   collected_once_count: INTEGER is
      do
         Result := collected_once_variables.count
      end

   collected_once_item (i: INTEGER): MANIFEST_STRING is
      require
         i.in_range(1, collected_once_count)
      do
         Result := collected_once_variables.item(i)
      end

   storage_alias_count: INTEGER is
      do
         Result := storage_alias.count
      end

   storage_alias_item (i: INTEGER): MANIFEST_STRING is
      require
         i.in_range(1, storage_alias_count)
      do
         Result := storage_alias.item(i)
      end

   se_ums: RUN_FEATURE is
         -- The one of `unicode_string_manifest_initialize_stamp'.
      require
         first_unicode_manifest_string_collected_flag
      do
         Result := se_ums_
         if Result = Void then
            -- Yes, this is the very first usage of `se_ums':
            Result := unicode_string_manifest_initialize_stamp.run_feature_for(unicode_string_type)
            se_ums_ := Result
         end
      end

feature {}
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

   unicode_string_manifest_initialize_stamp: FEATURE_STAMP
         -- Feature stamp for {UNICODE_STRING}.manifest_initialize which is actually the body of `se_ums'.

   unicode_string_type: TYPE
         -- Is cached here too in order to get `se_ums' later.

feature {}
   se_ums_: RUN_FEATURE

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
