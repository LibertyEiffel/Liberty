deferred class DESCRIPTIONS
   -- Access to descriptions of classes and features.

insert
   FILE_TOOLS
   SHARED_SETTINGS
   NAME_CONVERTER

feature {ANY} -- Descriptions reading
   read_descriptions_from (a_file_name: STRING)
         -- Read description comment for classes and features from the file
         -- named `a_file_name',
         -- filling `class_descriptions' and `feature_descriptions'. Leading and
         -- trailing spaces are removed.  Lines starting with "--" are ignored
         -- as comments. Class descriptions are in the form "CLASS_NAME
         -- Description text", feature descriptions are "CLASS_NAME.feature
         -- Description text".
      require
         a_file_name /= Void
         file_exists(a_file_name)
         is_file(a_file_name)
      local
         line, described: STRING; words: LINKED_LIST[STRING]; descriptions: TEXT_FILE_READ
      do
         create descriptions.connect_to(a_file_name)
         if descriptions.is_connected then
            from
               descriptions.read_line
            until
               descriptions.end_of_input
            loop
               line := descriptions.last_string
               line.left_adjust
               line.right_adjust
               if line.has_prefix(once "--") then
                  debug
                     log.info.put_line(once ".")
                  end
               else
                  create words.make
                  line.split_in(words)
                  if not words.is_empty then
                     described := words.first
                     words.remove_first
                     read_description(described, words)
                     debug
                        log.info.put_line(once ".")
                     end
                  end
               end

               descriptions.read_line
            end
            check
               descriptions.end_of_input
            end
            descriptions.disconnect
         else
            debug
               log.info.put_line(once "Couldn't connect to `#(1)' to read descriptions.%N" # a_file_name)
            end
         end
      end

   read_description (a_described: STRING; a_description: COLLECTION[STRING])
         -- When `a_described' is a valid class name (i.e. "CLASS_NAME_01") `a_description' is added into `class_descriptions'; when `a_described' is a valid class name with a feature name with a dot in the middle (like "ANOTHER_CLASS.my_feature_12_foo"); adds
         -- `a_description' is added into `feature_descriptions' in the latter.
         -- Leading and trailing spaces are removed from `a_described'; comments -
         -- starting with "--" are skipped; See `read_comments' for further
         -- informations.
      local
         described_class, described_feature: STRING; dot: INTEGER
         subdictionary: HASHED_DICTIONARY[COLLECTION[STRING], STRING]
      do
         -- Remove leading and trailing spaces
         a_described.left_adjust
         a_described.right_adjust
         if not a_described.has_prefix(once "--") then
            -- Look for class name and feature name
            inspect
               a_described.occurrences('.')
            when 0 then
               -- could be a class
               if is_valid_class_name(a_described) then
                  debug
                     log.info.put_line(once "Description for class #(1): %"#(2)%".%N" # a_described # & a_description)
                     -- a_description.for_each(agent log) log.info.put_line(once "%".%N")
                  end
                  class_descriptions.put(a_description, a_described)
               else
                  log.info.put_line(once "Comment file: invalid class name `#(1)'.%N" # a_described)
               end
            when 1 then
               -- could be a feature (i.e. CLASS.feature)
               -- Look for the dot and see if has a meaningful position
               dot := a_described.first_index_of('.')
               if dot > a_described.lower and dot < a_described.count then
                  described_class := a_described.substring(1, dot - 1)
                  described_feature := a_described.substring(dot + 1, a_described.count)
                  debug
                     log.info.put_line(once "Description for feature #(1) of #(2) #(3)%".%N" #
					 	described_feature # described_class # &a_description )
                     -- a_description.for_each(agent log) log.info.put_line(once "%".%N")
                  end
                  subdictionary := feature_descriptions.reference_at(described_class)
                  if subdictionary = Void then
                     create subdictionary.make
                     feature_descriptions.put(subdictionary, described_class)
                  end

                  subdictionary.put(a_description, described_feature)
               else
                  log.info.put_line(once "Comment file: empty class or feature name %"" | a_described | once "%".%N")
               end
            else
               log.info.put_line(once "Comment file: feature name %"" | a_described | once "%" has too many dots.%N")
            end
            -- inspect
         end
         -- if has "--" prefix
      end

feature {ANY} -- Outputting description
   emit_description_on (a_description: COLLECTION[STRING]; a_formatter: FORMATTER)
         -- Put 'a_description' on 'a_formatter' formatting it as an Eiffel
         -- comment with lines shorter that 'description_lenght' characters.
         -- Nothing is done when `a_description' is Void.
      require
         a_formatter /= Void
      local
         word: STRING; iter: ITERATOR[STRING]; length, new_length: INTEGER
      do
         if a_description /= Void then
            from
               iter := a_description.new_iterator
               iter.start
               a_formatter.append(comment)
               length := 0
            until
               iter.is_off
            loop
               word := iter.item
               new_length := length + word.count
               if new_length > description_lenght then
                  a_formatter.append(comment)
                  length := 0
               else
                  a_formatter.put(' ')
                  length := new_length + 1
               end

               a_formatter.append(word)
               iter.next
            end
         end
      end

feature {ANY} -- Queries
   feature_description (a_class_name, a_feature_name: STRING): COLLECTION[STRING]
         -- The description of `a_feature_name' in `a_class_name'. Void when
         -- there is no description.
      require
         a_class_name /= Void
      local
         dictionary: HASHED_DICTIONARY[COLLECTION[STRING], STRING]
      do
         dictionary := feature_descriptions.reference_at(a_class_name)
         if dictionary /= Void then
            Result := dictionary.reference_at(a_feature_name)
            -- debug
            --      log.info.put_line(once "feature_description(%"#(1)%",%"#(2)%")=%"#(3)%"%N"#a_class_name#a_feature_name#formatted_description(Result))
            -- end
         end
      end

feature {} -- Descriptions
   description_lenght: INTEGER 70

   class_descriptions: HASHED_DICTIONARY[COLLECTION[STRING], STRING]
         -- Class description comments. Key is classname.
      once
         create Result.make
      end

   feature_descriptions: HASHED_DICTIONARY[HASHED_DICTIONARY[COLLECTION[STRING], STRING], STRING]
         -- Feature descriptions dictionary. The outer dictionary is indexed by
         -- classname, the inner one by feature name. So to get the description of
         -- feature foo in class BAR you shall invoke
         -- feature_descriptions.at("BAR").at("foo")
      once
         create Result.make
      end

end -- class DESCRIPTIONS

-- Copyright (C) 2008-2025: Paolo Redaelli
--
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
