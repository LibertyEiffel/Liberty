-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ID_PROVIDER
   --
   -- Unique object in charge of some id providing.
   --
   -- Note: it is not possible to use here a BIJECTIVE_DICTIONARY because, for example INTEGER and INTEGER_32
   -- share the same id.
   --

insert
   GLOBALS

create {ANY}
   make

feature {C_PRETTY_PRINTER}
   max_id: INTEGER_16
         -- Last already assigned `id'. Maximum 15 bits (see POSITION), so
         -- INTEGER_16 is ok (bit#16 is the sign)

feature {POSITION}
   min_id: INTEGER_16
         -- Last `id' already assigned to a filename.
         --|*** I felt it would be nice not to mix live type `id's and
         --| file name `id's. Therefore, live type `id's grow up from
         --| 0, while file name `id's grow down from
         --| maximum_free_id. However, this makes the code more
         --| complex, and requires two distinct dictionaries. FM

feature {COMPILE_TO_C}
   disk_save
      local
         i: INTEGER; tfw: TEXT_FILE_WRITE
      do
         create tfw.make
         echo.tfw_connect(tfw, system_tools.id_file_path)
         disk_save_ids(tfw, id_memory, Void)
         from
            i := per_cluster_id_memory.lower
         until
            i > per_cluster_id_memory.upper
         loop
            disk_save_ids(tfw, per_cluster_id_memory.item(i), per_cluster_id_memory.key(i))
            i := i + 1
         end
         tfw.disconnect
      end

feature {}
   disk_save_ids (tfw: TEXT_FILE_WRITE; ids: like id_memory; cluster_name: STRING)
      local
         i: INTEGER; id: INTEGER_16; name: HASHED_STRING
         cluster: CLUSTER
      do
         if cluster_name = Void then
            debug
               echo.put_string(once " Saving no-cluster ids%N")
            end
         else
            tfw.put_character('|')
            tfw.put_line(cluster_name)
            cluster := smart_eiffel.cluster_named(cluster_name)
            check
               cluster /= Void
            end
            debug
               echo.put_string(once " Saving ids of cluster ")
               echo.put_string(cluster.directory_path)
               echo.put_new_line
            end
         end
         from
            i := ids.lower
         until
            i > ids.upper
         loop
            name := ids.key(i)
            id := ids.item(i)
            tfw.put_integer(id)
            tfw.put_character(' ')
            tfw.put_character('%"')
            tfw.put_string(name.to_string)
            tfw.put_character('%"')
            tfw.put_character(' ')
            if id <= max_id then
               tfw.put_character('l')
            else
               check
                  id >= min_id
               end
               tfw.put_character('h')
            end
            if cluster /= Void then
               smart_eiffel.id_extra_information(tfw, name, cluster)
            else
               -- There should be no classes without a cluster; only Cecil files and such
               check
                  smart_eiffel.cluster_of(create {CLASS_NAME}.unknown_position(string_aliaser.hashed_string(class_name_of(name.to_string)), True)) = Void
               end
               tfw.put_new_line
            end
            tfw.put_character('#')
            tfw.put_new_line
            i := i + 1
         end
      end

feature {PARSER, CLASS_TEXT, LIVE_TYPE, C_PRETTY_PRINTER}
   item (hashed_string: HASHED_STRING; cluster: CLUSTER): INTEGER_16
         -- `hashed_string' should be a full type name; `cluster' is the cluster where the class_text of the
         -- type is located.
      require
         hashed_string /= Void
         cluster /= Void
      local
         ids: like id_memory
      do
         ids := cluster_id_memory(cluster)
         if ids.fast_has(hashed_string) then
            Result := ids.fast_at(hashed_string)
         elseif max_id = min_id - 1 then
            too_many_live_types_error
         else
            max_id := max_id + 1
            Result := max_id
            ids.fast_put(Result, hashed_string)
         end
         debug
            echo.put_string(once "*** id(")
            echo.put_string(hashed_string.to_string)
            echo.put_string(once ") = ")
            echo.put_integer(Result)
            echo.put_string(once " (in cluster ")
            echo.put_string(cluster.name)
            echo.put_string(once ")%N")
         end
      end

feature {EIFFEL_PARSER}
   high_item (hashed_string: HASHED_STRING): INTEGER_16
         -- Works like `item', except that if a new ID is allocated,
         -- it is chosen high.
      require
         hashed_string /= Void
      do
         if id_memory.fast_has(hashed_string) then
            Result := id_memory.fast_at(hashed_string)
         elseif min_id = max_id + 1 then
            too_many_live_types_error
         else
            min_id := min_id - 1
            Result := min_id
            id_memory.fast_put(Result, hashed_string)
         end
         debug
            echo.put_string(once "id(")
            echo.put_string(hashed_string.to_string)
            echo.put_string(once ") = ")
            echo.put_integer(Result)
            echo.put_new_line
         end
      end

feature {}
   too_many_live_types_error
      require
         max_id = min_id - 1
      local
         p: POSITION
      do
         error_handler.append(once "Too many live types (the maximum is ")
         error_handler.append_integer(p.maximum_free_id)
         error_handler.append(once "). Cannot go on: please try removing your .id file or calling %"se clean%". If that fails, please send an e-mail at liberty-eiffel@gnu.org")
         error_handler.print_as_fatal_error
      ensure
         dead: False
      end

feature {POSITION}
   alias_of (id: INTEGER_16): HASHED_STRING
      local
         i: INTEGER
      do
         Result := id_memory.fast_key_at(id)
         if Result = Void then
            from
               i := per_cluster_id_memory.lower
            until
               Result /= Void or else i > per_cluster_id_memory.upper
            loop
               Result := per_cluster_id_memory.item(i).fast_key_at(id)
               i := i + 1
            end
         end
         debug
            count_alias_of := count_alias_of + 1
            echo.put_string(once "alias_of(")
            echo.put_integer(id)
            echo.put_string(once ") = ")
            if Result = Void then
               echo.put_string(once "Void")
            else
               echo.put_character('"')
               echo.put_string(Result.to_string)
               echo.put_character('"')
            end
            echo.put_string(once " (")
            echo.put_integer(count_alias_of)
            echo.put_string(once ")%N")
         end
      end

   count_alias_of: INTEGER

feature {}
   per_cluster_id_memory: DICTIONARY[DICTIONARY[INTEGER_16, HASHED_STRING], STRING]
      once
         create {HASHED_DICTIONARY[DICTIONARY[INTEGER_16, HASHED_STRING], STRING]} Result.with_capacity(16)
      end

   cluster_id_memory (cluster: CLUSTER): like id_memory
      require
         cluster /= Void
      do
         Result := per_cluster_id_memory.reference_at(cluster.name)
         if Result = Void then
            create {HASHED_DICTIONARY[INTEGER_16, HASHED_STRING]} Result.with_capacity(64)
            per_cluster_id_memory.add(Result, cluster.name)
         end
      ensure
         integrity: Result /= Void
         definition: per_cluster_id_memory.reference_at(cluster.name) = Result
      end

   id_memory: DICTIONARY[INTEGER_16, HASHED_STRING]
         -- The ids of classes without a cluster...
         --|*** TODO: Should disappear! Why should we keep ids for Cecil files?
      once
         create {HASHED_DICTIONARY[INTEGER_16, HASHED_STRING]} Result.with_capacity(2048)
      end

   class_name_of (string: STRING): STRING
      local
         i: INTEGER; ta: TYPE_ALIASING
      do
         if string.has_prefix(once "TUPLE ") then
            Result := as_tuple
         else
            i := string.first_index_of('[')
            if string.valid_index(i) then
               Result := once ""
               Result.copy(string)
               Result.shrink(1, i - 1)
            else
               Result := ta.alias_of(string)
               if Result = Void then
                  Result := string
               end
            end
         end
      ensure
         not Result.is_empty
         string.is_equal((old (string.twin)))
      end

   id_memory_add (id: INTEGER_16; string: STRING; is_default_class: BOOLEAN)
      require
         string_aliaser.registered_one(string)
      local
         hs: HASHED_STRING; cn: CLASS_NAME; c: CLUSTER; ids: like id_memory
      do
         hs := string_aliaser.hashed_string(class_name_of(string))
         create cn.unknown_position(hs, True)
         hs := string_aliaser.hashed_string(string)
         c := smart_eiffel.cluster_of(cn)
         if c /= Void then
            ids := cluster_id_memory(c)
            if is_default_class then
               -- because at init only
               check
                  not ids.fast_has(hs)
               end
               ids.add(id, hs)
            else
               ids.fast_put(id, hs) -- No `add' here because it may come from outside.
            end
         elseif is_default_class then
            error_handler.append(once "Cannot find the default class ")
            error_handler.append(string)
            error_handler.append(once " in any cluster. Don't expect the compilation to succeed.%N")
            error_handler.print_as_error
         end
      end

   cluster_id_memory_add (id: INTEGER_16; type_name, cluster_name: STRING)
      require
         string_aliaser.registered_one(type_name)
         string_aliaser.registered_one(cluster_name)
      local
         hs: HASHED_STRING; c: CLUSTER; ids: like id_memory
      do
         hs := string_aliaser.hashed_string(type_name)
         c := smart_eiffel.cluster_named(cluster_name)
         if c /= Void then
            ids := cluster_id_memory(c)
            check
               not ids.fast_has(hs)
            end
            ids.add(id, hs)
         end
      end

   make
      local
         p: POSITION
      do
         id_memory_add(1, as_integer_8, True)
         id_memory_add(2, as_integer, True)
         id_memory_add(2, as_integer_32, True)
         id_memory_add(3, as_character, True)
         id_memory_add(4, as_real_32, True)
         id_memory_add(5, as_real, True)
         id_memory_add(5, as_real_64, True)
         id_memory_add(6, as_boolean, True)
         id_memory_add(7, as_string, True)
         id_memory_add(8, as_pointer, True)
         id_memory_add(9, as_native_array_character, True)
         id_memory_add(10, as_integer_16, True)
         id_memory_add(11, as_integer_64, True)
         id_memory_add(12, as_real_extended, True)
         id_memory_add(13, as_natural_8, True)
         id_memory_add(14, as_natural_16, True)
         id_memory_add(15, as_natural, True)
         id_memory_add(15, as_natural_32, True)
         id_memory_add(16, as_natural_64, True)
         max_id := 16
         min_id := p.maximum_free_id + 1
         if not smart_eiffel.no_id then
            disk_restore
         end
      end

   disk_restore
      local
         cc: CHARACTER; type_name, cluster_name: STRING; id, item_count: INTEGER_16; tfr: TEXT_FILE_READ; state: INTEGER_8
         predefined_ids: INTEGER_16; hashed_type_name: HASHED_STRING; p: POSITION
      do
         predefined_ids := max_id
         create tfr.make
         echo.tfr_connect(tfr, system_tools.id_file_path)
         if tfr.is_connected then
            from
               if tfr.end_of_input then
                  state := 7
               end
            until
               state > 5
            loop
               tfr.read_character
               if tfr.end_of_input then
                  state := 6
               else
                  cc := tfr.last_character
               end
               inspect
                  state
               when 0 then
                  -- Waiting first digit of `id'.
                  inspect
                     cc
                  when ' ', '%R', '%N', '%T' then
                  when '|' then
                     cluster_name := once ""
                     cluster_name.clear_count
                     state := -1
                  when '0' .. '9' then
                     id := cc.decimal_value
                     state := 1
                  else
                     state := 7
                  end
               when 1 then
                  -- Inside `id'.
                  inspect
                     cc
                  when '0' .. '9' then
                     id := id * 10 + cc.decimal_value
                  when '%"' then
                     type_name := temporary_type_name
                     type_name.clear_count
                     state := 3
                  when ' ', '%T' then
                     state := 2
                  else
                     state := 7
                  end
               when 2 then
                  -- Waiting opening ".
                  inspect
                     cc
                  when '%"' then
                     type_name := temporary_type_name
                     type_name.clear_count
                     state := 3
                  when ' ', '%T', '%N', '%R' then
                  else
                     state := 7
                  end
               when 3 then
                  -- Inside `type_name'.
                  inspect
                     cc
                  when '%"' then
                     item_count := item_count + 1
                     if id.in_range(predefined_ids + 1, p.maximum_free_id) then
                        if is_valid_type_mark(type_name) then
                           if cluster_name = Void then
                              -- For compatibility with old .id files that did not have the cluster names
                              id_memory_add(id, string_aliaser.string(type_name), False)
                           else
                              cluster_id_memory_add(id, string_aliaser.string(type_name), cluster_name)
                           end
                        else
                           hashed_type_name := string_aliaser.hashed_string(type_name)
                           id_memory.fast_put(id, hashed_type_name) -- No `add' here because it comes from outside.
                        end
                     end
                     state := 4
                  when '%N', '%R', '%T' then
                     state := 7
                  else
                     type_name.extend(cc)
                  end
               when 4 then
                  -- Waiting for end of type ('#') (id not yet taken into account).
                  inspect
                     cc
                  when 'l' then
                     max_id := max_id.max(id)
                     state := 5
                  when 'h' then
                     min_id := min_id.min(id)
                     state := 5
                  when '%N', '%R', '%T', ' ' then
                  when '#' then
                     -- For compatibility with old .id files
                     if is_valid_type_mark(type_name) then
                        max_id := max_id.max(id)
                     else
                        min_id := min_id.min(id)
                     end
                     state := 0
                  else
                     -- For compatibility with old .id files
                     max_id := max_id.max(id)
                     state := 5
                  end
               when 5 then
                  -- Waiting for end of type ('#') (id already taken into account).
                  inspect
                     cc
                  when '#' then
                     state := 0
                  else
                  end
               when 6 then
               when -1 then
                  inspect cc
                  when '%R' then
                  when '%N' then
                     cluster_name := string_aliaser.string(cluster_name)
                     state := 0
                  else
                     cluster_name.extend(cc)
                  end
               end
            end
            tfr.disconnect
            if state = 7 then
               -- Error final state.
               echo.put_string("Corrupted *.id file (after ")
               echo.put_integer(item_count)
               echo.put_string(" correct items).%N")
            else
               check
                  state = 6
               end
               -- Final success state.
            end
            echo.put_string(once "Previous IDs reloaded (max_id = ")
            echo.put_integer(max_id)
            echo.put_string(once ").%N")
         end
      end

   is_valid_type_mark (name: STRING): BOOLEAN
         -- Does it follow the syntactic rules for a type name?  I.e. an uppercase letter followed by
         -- optional uppercase letters, digits and underscores with correctly nested square brackets.
      local
         i, n, nesting: INTEGER; in_class_name: BOOLEAN
      do
         if not name.is_empty then
            n := name.count
            from
               i := 2
               in_class_name := True
               Result := name.first.in_range('A','Z')
            until
               not Result or else i > n
            loop
               inspect name.item(i)
               when 'A'..'Z', '0'..'9', '_' then
                  Result := in_class_name
               when '[' then
                  nesting := nesting + 1
                  i := i + 1
                  Result := i <= n and then name.item(i).in_range('A','Z') and then in_class_name
               when ',' then
                  i := i + 1
                  in_class_name := True
                  Result := i <= n and then name.item(i).in_range('A','Z') and then nesting > 0
               when ']' then
                  nesting := nesting - 1
                  in_class_name := False
                  Result := nesting > 0 or else (nesting = 0 and then i = n)
               else
                  Result := False
               end
               i := i + 1
            end
            Result := (Result and then nesting = 0) or else (name.has_prefix(once "TUPLE "))
         end
      end

   temporary_type_name: STRING
      once
         create Result.make(128)
      end

end -- class ID_PROVIDER
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
