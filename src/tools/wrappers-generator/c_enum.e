class C_ENUM
   -- An "Enumeration" XML node in a file made by castxml representing a C
   -- enum.
   -- TODO: Currently wrapper_type is "INTEGER"; this assumes two
   -- conditions:
   -- 1 - any enum value is actually an int;
   -- 2 - INTEGER has the same size of int
   -- As far as I know th condition shall apply on all architectures.

inherit
   C_TYPE
   CONTEXTED_NODE
   IDENTIFIED_NODE
   FILED_NODE
   STORABLE_NODE
   TYPED_NODE
   WRAPPER_CLASS

insert
   COLLECTION_SORTER[C_ENUM_VALUE]

create {CASTXML_TREE}
   make

feature {ANY}
   store
      do
         if is_named then
            symbols.put(Current, c_string_name)
         end
         types.put(Current, id)
      end

   has_wrapper: BOOLEAN True

   wrapper_type: STRING "INTEGER"

   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   is_to_be_emitted: BOOLEAN
      local
         fn: STRING
      do
         fn := c_file.c_string_name
         Result := not emitted and then is_named and then file_exists(fn) and (global or else headers.has(fn)) and then not avoided_symbols.has(c_string_name)
      end

   emit_wrapper
      local
         filename: STRING; path: POSIX_PATH_NAME
      do
          if is_to_be_emitted then
            create path.make_from_string(directory)
            path.add_last(eiffel_name.as_lower + once ".e")
            filename := path.to_string
            log.info.put_line(once "Wrapping enum #(1) as #(2) on #(3)" # c_name.to_utf8 # eiffel_name # filename)

            create {TEXT_FILE_WRITE} output.connect_to(filename)

            emit_header
            emit_items
            emit_footer
            output.flush
            output.disconnect
         else
            log.info.put_line(once "Skipping enum `#(1)'." # c_string_name)
         end
         emitted:=True
      end

   emit_header
      do
         buffer.reset_with(automatically_generated_header)
         buffer.append(expanded_class)
         buffer.append(eiffel_name)
         buffer.append_new_line
         emit_description_on(class_descriptions.reference_at(c_string_name), buffer)
         buffer.append(once "[

            -- Wrapper of enum #(1) defined in file #(2)
            ]" # c_string_name # c_file.c_string_name )
         buffer.append(once "%Ninsert ENUM%N%Ncreate {ANY} default_create%N")
         buffer.print_on(output)
      end

   emit_items
      do
         if children_count > 0 then
            if flag_enums.has(c_string_name) then
               log.info.put_line(once "#(1) forcefully wrapped as flag." # c_string_name)
               append_flag_items
            elseif have_flags_values then
               log.info.put_line(once "#(1) wrapped as flag." # c_string_name)
               append_flag_items
            else
               log.info.put_line(once "#(1) wrapperd as an enumeration." # c_string_name)
               append_enumeration_items
            end
         else
            log.info.put_line(once "#(1) enum is fieldless.")
         end
         output.put_line(once "feature {ANY} -- Validity")
         validity_query.print_on(output)
         output.put_line(once "feature {ANY} -- Setters")
         setters.print_on(output)
         output.put_line(once "feature {ANY} -- Queries")
         queries.print_on(output)
         output.put_line(once "feature {WRAPPER, WRAPPER_HANDLER} -- Low level values")
         low_level_values.print_on(output)
      end

   emit_footer
      do
         buffer.append("%Nend -- class #(1)%N" # eiffel_name)
         buffer.print_on(output)
      end

   suffix: STRING "_ENUM"

   have_flags_values: BOOLEAN
         -- Can the values of `an_enumeration' be used as flags? They can be
         -- used as flags when they are different powers of 2, i.e.  setting
         -- each a different bit, and there is no zero value.
      require
         has_children: children_count > 0
      local
         i, flags_so_far, value: INTEGER; enum_value: C_ENUM_VALUE
      do
         from
            i := 1
            Result := True
         until
            Result = False or else i > children_count
         loop
            enum_value ?= child(i)
            if enum_value /= Void then
               value := enum_value.value.to_integer
               if value > 0 and then value.is_a_power_of_2 and flags_so_far & value = 0 then
                  -- value is valid and indipendent from other values so far.
                  flags_so_far := flags_so_far | value
               else
                  Result := False
               end
            else
              log.warning.put_line(once "enum at line #(1) has at least a value that is not an EnumValue!"#line.out)
            end

            i := i + 1
         end
      end

feature {ANY} -- Emitting "normal" enumeration
   append_enumeration_items
      require
         has_children: values.count > 0
      local
         i: INTEGER
      do
         initialize_validity_query
         setters.reset_with(once "%Tdefault_create,%N")
         values.first.append_to_buffers
         if values.count > 1 then
            from
               i := values.lower + 1
            until
               i > values.upper
            loop
               append_separators
               values.item(i).append_to_buffers
               i := i + 1
            end
         end

         finalize_validity_query
      end

   initialize_validity_query
      do
         validity_query.reset_with(once "    is_valid_value (a_value: INTEGER): BOOLEAN%N%
            %        do%N%
            %            Result := (")
      ensure
         validity_query_grew: validity_query.count > old validity_query.count
      end

   finalize_validity_query
      do
         validity_query.append(once ")%N%T%Tend%N%N")
      ensure
         validity_query_grew: validity_query.count > old validity_query.count
      end

   append_separators
         -- Append various separators to `validity_query', `queries' and
         -- `setters' buffers.
      do
         validity_query.append(once " or else%N%T%T%T%T")
      end

feature {ANY} -- Emitting "flag" enumeration
   append_flag_items
      require
         has_children: values.count > 0
      local
         i: INTEGER
      do
         initialize_flag_validity_query
         setters.reset_with(once "%Tdefault_create,%N")

         values.first.append_as_flag_to_buffers
         if values.count > 1 then
            from
               i := values.lower + 1
            until
               i > values.upper
            loop
               append_flag_separators
               values.item(i).append_as_flag_to_buffers
               i := i + 1
            end
         end

         finalize_flag_validity_query
      end

   initialize_flag_validity_query
      do
         validity_query.reset_with(once "    is_valid_value (a_value: INTEGER): BOOLEAN%N%
            %        do%N%
            %            Result := (a_value=0 or (a_value & (")
      ensure
         validity_query_grew: validity_query.count > old validity_query.count
      end

   finalize_flag_validity_query
      do
         validity_query.append(once ")).to_boolean)%N%T%Tend%N%N")
      ensure
         validity_query_grew: validity_query.count > old validity_query.count
      end

   append_flag_separators
         -- Append various separators to `validity_query', `queries' and
         -- `setters' buffers.
      do
         validity_query.append(once " | %N%T%T%T%T")
      end

feature {C_ENUM_VALUE} -- Implementation
   shortest_length: INTEGER_32
         -- The length of the shortest enumeration value
      local
         i: INTEGER
      do
         from
            i := values.upper - 1
            Result := values.last.c_name.count
         until
            i < values.lower
         loop
            Result := Result.min(values.item(i).c_name.count)
            i := i - 1
         end
      end

   longest_prefix: INTEGER
         -- The length of longest prefix common to all values of Current enumeration
         -- Useful to remove the common prefix of many enumeration values.
         -- Zero (0) when an enumeration has only one element
      local
         i, upper: INTEGER
      do
         if values.count > 1 then
            if prefix_length.is_default then
               from
                  prefix_length := values.first.c_name.lower
                  upper := shortest_length
               until
                  prefix_length >= upper or else not same_character_at_index(prefix_length)
               loop
                  prefix_length := prefix_length + 1
               end
               prefix_length := prefix_length - 1
               -- Used during development of th feature. Dabled because it's too verbose

               debug
                  if verbose then
                     print(once "'")
                     print(values.first.c_name.as_utf8.substring(1, prefix_length))
                     print(once "'(")
                     print(prefix_length.to_string)
                     print(once " characters)  longest common prefix of ")
                     from
                        i := values.lower
                     until
                        i > values.upper - 1
                     loop
                        print(values.item(i).c_name.out)
                        print(once ", ")
                        i := i + 1
                     end

                     print(values.last.c_string_name)
                     print(once ".%N")
                  end
               end
               Result := prefix_length
            else
               -- result has been already computed
               Result := prefix_length
            end
         else
            -- enumeration has only one value
            Result := 0
         end
      ensure
         shorter_than_shortest_item: Result < shortest_length -- otherwe the shortest item will get an empty label
      end

   values: FAST_ARRAY[C_ENUM_VALUE]
         -- The C_ENUM_VALUE children of Current C_ENUM
      local
         a_value: C_ENUM_VALUE; i: INTEGER
      do
         if hidden_values = Void then
            create hidden_values.with_capacity(children_count)
            from
               i := 1
            until
               i > children_count
            loop
               a_value ?= child(i)
               if a_value /= Void then
                  hidden_values.add_last(a_value)
               end

               i := i + 1
            end
            -- Sort the result to get a stable order of the wrapped features.
            -- We may also have used an inherently sorted collection, but since
            -- the features collections we are sorting aren't usually bigger
            -- than a few dozens of items the overhead of a sorted collection
            -- couldn't be justified. Th last tense hasn't actually been
            -- tested.

            if hidden_values.count > 1 then
               sort(hidden_values)
            end
         end
         Result := hidden_values
      end

feature {} -- Implementation
   hidden_values: like values

   prefix_length: like longest_prefix

   same_character_at_index (an_index: INTEGER): BOOLEAN
         -- Do all values have the same characters at `an_index' in their name?
      require
         has_values: values.count > 1
         an_index <= shortest_length
      local
         c: INTEGER_32; i: INTEGER
      do
         c := values.first.c_name.item(an_index)
         --print(" (sc@"+an_index.out+": ")
         from
            i := values.lower
            Result := True
         until
            not Result or else i > values.upper
         loop
            Result := values.item(i).c_name.item(an_index) = c
            --print(values.item(i).c_name.item(an_index).to_character.out+",")
            i := i + 1
         end
         --print(")="+Result.out+" ")
      end --invariant name.is_equal(once U"Enumeration")

end -- class C_ENUM

-- Copyright (C) 2008-2025: Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
