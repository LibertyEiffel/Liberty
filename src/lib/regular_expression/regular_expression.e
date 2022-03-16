-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REGULAR_EXPRESSION
   --
   -- Regular expression matching and substitution capabilities.
   -- Use REGULAR_EXPRESSION_BUILDER to create REGULAR_EXPRESSION objects.
   --
   -- See tutorial/regular_expression for usage.
   --

feature {ANY} -- matching capabilities
   match (text: ABSTRACT_STRING): BOOLEAN
         -- Returns True if `Current' regular_expression can match the `text'.
         --
         -- See also `match_next', `match_from', `last_match_succeeded', `last_match_first_index'.
      require
         text /= Void
         save_matching_text(text)
      do
         Result := match_from(text, text.lower)
      ensure
         Result = last_match_succeeded
         Result implies valid_substrings(text)
         Result implies last_match_first_index.in_range(text.lower, text.upper + 1)
         Result implies last_match_first_index <= last_match_last_index + 1
      end

   match_from (text: ABSTRACT_STRING; first_index: INTEGER): BOOLEAN
         -- Returns True if `Current' regular_expression can match the `text' starting from `first_index'.
         --
         -- See also `match', `last_match_succeeded', `last_match_first_index'.
      require
         text /= Void
         first_index.in_range(text.lower, text.upper + 1)
         save_matching_text(text)
      deferred
      ensure
         Result = last_match_succeeded
         Result implies valid_substrings(text)
         Result implies last_match_first_index >= first_index
         Result implies last_match_first_index.in_range(text.lower, text.upper + 1)
         Result implies last_match_first_index <= last_match_last_index + 1
      end

   match_next (text: ABSTRACT_STRING): BOOLEAN
         -- Returns True if `Current' regular_expression can match the same `text' one more time.
         -- Must be called after a successful `match' or `math_from' or `match_next' using the same `text'.
         --
         -- See also `match', `match_from', `last_match_succeeded'.
      require
         text /= Void
         last_match_succeeded
         text.has_prefix(last_match_text)
         save_matching_text(text)
      do
         Result := match_from(text, last_match_last_index + 1)
      ensure
         Result = last_match_succeeded
         Result implies valid_substrings(text)
         Result implies last_match_first_index.in_range(text.lower, text.upper + 1)
         Result implies last_match_first_index <= last_match_last_index + 1
      end

   last_match_succeeded: BOOLEAN
         -- Did last match succeed?
         --
         -- See also `match', `match_from'.
      do
         Result := substrings_first_indexes.item(0) > 0
      end

   last_match_first_index: INTEGER
         -- The starting position in the text where starts the sub-string who is matching the whole pattern.
         --
         -- See also `match', `match_from'.
      require
         last_match_succeeded
      do
         Result := substrings_first_indexes.item(0)
      ensure
         Result > 0
      end

   last_match_last_index: INTEGER
         -- The last position in the text where starts the sub-string who is matching the whole pattern.
         --
         -- See also `match', `match_from'.
      require
         last_match_succeeded
      do
         Result := substrings_last_indexes.item(0)
      ensure
         Result + 1 >= last_match_first_index
      end

   last_match_count: INTEGER
         -- Length of the string matching the whole pattern.
         --
         -- See also `last_match_first_index', `last_match_last_index', `match', `match_from'.
      require
         last_match_succeeded
      do
         Result := last_match_last_index - last_match_first_index + 1
      ensure
         Result >= 0
         definition: Result = last_match_last_index - last_match_first_index + 1
      end

   group_count: INTEGER
         -- Number of groups in `Current' regular expression.
         --
         -- See also `ith_group_matched', `ith_group_first_index'.
      do
         Result := substrings_first_indexes.upper
      end

   group_names: TRAVERSABLE[FIXED_STRING]
         -- The names of the matched named group.
         --
         -- See also `named_group_matched', `named_group_first_index'.
      do
         set_group_names_memory
         Result := group_names_memory
      ensure
         Result /= Void
         Result.for_all(agent (s: FIXED_STRING): BOOLEAN do Result := s /= Void end (?))
         Result.count = substrings_names.count
         Result.for_all(agent (s: FIXED_STRING): BOOLEAN do Result := substrings_names.fast_has(s) end (?))
         Result.for_all(agent (s: FIXED_STRING): BOOLEAN do Result := has_group_name(s) end (?))
      end

   has_group_name (name: ABSTRACT_STRING): BOOLEAN
         -- Is there a group names `name'?
      require
         name /= Void
      do
         set_group_names_memory
         Result := group_names_memory.fast_has(name.intern)
      end

   ith_group_matched (i: INTEGER): BOOLEAN
         -- Did the `i'th group match during last match?
         --
         -- See also `group_count', `ith_group_first_index'.
      require
         i.in_range(0, group_count)
         last_match_succeeded
      do
         Result := substrings_first_indexes.item(i) > 0
      end

   named_group_matched (name: ABSTRACT_STRING): BOOLEAN
         -- Did the group named `name' match during the last match?
         --
         -- See also `group_names', `named_group_first_index'.
      require
         name /= Void
         has_group_name(name)
      do
         Result := ith_group_matched(substrings_names.fast_at(name.intern))
      end

   ith_group_first_index (i: INTEGER): INTEGER
         -- First index in the last matching text of the `i'th group.
         --
         -- See also `group_count'.
      require
         i.in_range(0, group_count)
         last_match_succeeded
         ith_group_matched(i)
      do
         Result := substrings_first_indexes.item(i)
      ensure
         Result.in_range(0, last_match_text.upper + 1)
      end

   named_group_first_index (name: ABSTRACT_STRING): INTEGER
         -- First index in the last matching text of the group named `name'.
         --
         -- See also `group_names'.
      require
         name /= Void
         has_group_name(name)
         last_match_succeeded
         named_group_matched(name)
      do
         Result := ith_group_first_index(substrings_names.fast_at(name.intern))
      end

   ith_group_last_index (i: INTEGER): INTEGER
         -- Last index in the last matching text of the `i'th group.
         --
         -- See also `ith_group_first_index', `group_count'.
      require
         i.in_range(0, group_count)
         last_match_succeeded
         ith_group_matched(i)
      do
         Result := substrings_last_indexes.item(i)
      ensure
         Result.in_range(ith_group_first_index(i) - 1, last_match_text.upper)
      end

   named_group_last_index (name: ABSTRACT_STRING): INTEGER
         -- Last index in the last matching text of the group named `name'.
         --
         -- See also `named_group_first_index', `group_names'.
      require
         name /= Void
         has_group_name(name)
         last_match_succeeded
         named_group_matched(name)
      do
         Result := ith_group_last_index(substrings_names.fast_at(name.intern))
      end

   ith_group_count (i: INTEGER): INTEGER
         -- Length of the `i'th group of `Current' in the last matching.
         --
         -- See also `ith_group_first_index', `append_ith_group', `group_count'.
      require
         i.in_range(0, group_count)
         last_match_succeeded
         ith_group_matched(i)
      do
         Result := substrings_last_indexes.item(i) - substrings_first_indexes.item(i) + 1
      ensure
         Result >= 0
         Result = ith_group_last_index(i) - ith_group_first_index(i) + 1
      end

   named_group_count (name: ABSTRACT_STRING): INTEGER
         -- Length of the group named `name' in the last matching.
         --
         -- See also `named_group_first_index', `append_named_group', `group_names'.
      require
         name /= Void
         has_group_name(name)
         last_match_succeeded
         named_group_matched(name)
      local
         i: INTEGER
      do
         i := substrings_names.fast_at(name.intern)
         Result := substrings_last_indexes.item(i) - substrings_first_indexes.item(i) + 1
      ensure
         Result >= 0
         Result = named_group_last_index(name) - named_group_first_index(name) + 1
      end

   for_all_matched_named_groups (text: ABSTRACT_STRING; action: PROCEDURE[TUPLE[FIXED_STRING, STRING]])
         -- Call the `action' for each group that matched during the last match.
         -- The first action argument is the name of the group; the second is its content.
         -- The order of the action calls is the ascending order of the group definitions in the pattern.
         --
         -- Note: the same STRING objects may be reused, so be sure to copy them if you want to keep them.
      require
         text /= Void
         action /= Void
         last_match_succeeded
         text.has_prefix(last_match_text)
      local
         i: INTEGER; group_name: FIXED_STRING; group_data: STRING
      do
         from
            group_data := once ""
            i := 1
         until
            i > group_count
         loop
            if ith_group_matched(i) and then substrings_names.fast_has_value(i) then
               group_name := substrings_names.fast_key_at(i)
               group_data.clear_count
               append_ith_group(text, group_data, i)
               action.call([group_name, group_data])
            end
            i := i + 1
         end
      end

   append_heading_text (text: ABSTRACT_STRING; buffer: STRING)
         -- Append in `buffer' the text before the matching area.
         -- `text' is the same as used in last matching.
         --
         -- See also `append_pattern_text', `append_tailing_text', `append_ith_group'.
      require
         text /= Void
         buffer /= Void
         last_match_succeeded
         text.has_prefix(last_match_text)
      do
         buffer.append_substring(text, 1, substrings_first_indexes.item(0))
      ensure
         buffer.count = old buffer.count + last_match_first_index - 1
      end

   append_pattern_text (text: ABSTRACT_STRING; buffer: STRING)
         -- Append in `buffer' the text matching the pattern.
         -- `text' is the same as used in last matching.
         --
         -- See also `append_heading_text', `append_tailing_text', `append_ith_group'.
      require
         text /= Void
         buffer /= Void
         last_match_succeeded
         text.has_prefix(last_match_text)
      do
         buffer.append_substring(text, substrings_first_indexes.item(0), substrings_last_indexes.item(0))
      ensure
         buffer.count = old buffer.count + last_match_count
      end

   append_tailing_text (text: ABSTRACT_STRING; buffer: STRING)
         -- Append in `buffer' the text after the matching area.
         -- `text' is the same as used in last matching.
         --
         -- See also `append_heading_text', `append_pattern_text', `append_ith_group'.
      require
         text /= Void
         buffer /= Void
         last_match_succeeded
         text.is_equal(last_match_text)
      do
         buffer.append_substring(text, substrings_last_indexes.item(0) + 1, text.count)
      ensure
         buffer.count = old buffer.count + text.count - last_match_last_index
      end

   append_ith_group (text: ABSTRACT_STRING; buffer: STRING; i: INTEGER)
         -- Append in `buffer' the text of the `i'th group.
         -- `text' is the same as used in last matching.
         --
         -- See also `append_pattern_text', `group_count'.
      require
         text /= Void
         buffer /= Void
         last_match_succeeded
         text.is_equal(last_match_text)
         i.in_range(0, group_count)
         ith_group_matched(i)
      do
         buffer.append_substring(text, substrings_first_indexes.item(i), substrings_last_indexes.item(i))
      ensure
         buffer.count = old buffer.count + ith_group_count(i)
      end

   append_named_group (text: ABSTRACT_STRING; buffer: STRING; name: ABSTRACT_STRING)
         -- Append in `buffer' the text of the group named `name'.
         -- `text' is the same as used in last matching.
         --
         -- See also `append_pattern_text', `group_name'.
      require
         text /= Void
         buffer /= Void
         last_match_succeeded
         text.is_equal(last_match_text)
         name /= Void
         has_group_name(name)
         named_group_matched(name)
      local
         i: INTEGER
      do
         i := substrings_names.fast_at(name.intern)
         buffer.append_substring(text, substrings_first_indexes.item(i), substrings_last_indexes.item(i))
      ensure
         buffer.count = old buffer.count + named_group_count(name)
      end

   named_group_value (text, name: ABSTRACT_STRING): STRING
         -- Returns the text of the group named `name' (always the same STRING!)
         -- `text' is the same as used in last matching.
         --
         -- See also `append_named_group', `group_name'.
      require
         text /= Void
         last_match_succeeded
         text.is_equal(last_match_text)
         name /= Void
         has_group_name(name)
         named_group_matched(name)
      do
         Result := once ""
         Result.clear_count
         append_named_group(text, Result, name)
      end

feature {ANY} -- substitution capabilities
   prepare_substitution (p: ABSTRACT_STRING)
         -- Set pattern `p' for substitution. If pattern `p' is not compatible with the `Current' regular
         -- expression, the `pattern_error_message' is updated as well as `pattern_error_position'.
         --
         -- See also `substitute_in', `substitute_for', `substitute_all_in', `substitute_all_for'.
      require
         p /= Void
      local
         in_verbatim_text: BOOLEAN; i: INTEGER
      do
         from
            if compiled_substitution_pattern = Void then
               create compiled_substitution_pattern.with_capacity(4)
            else
               compiled_substitution_pattern.clear_count
            end
            substitution_pattern_ready := True
            substitution_pattern.make_from_string(p)
            substrings_first_indexes.resize(0, substrings_first_indexes.upper)
            substrings_last_indexes.resize(0, substrings_last_indexes.upper)
            i := 1
         until
            i > substitution_pattern.count
         loop
            if substitution_pattern.item(i) = '\' and then i < substitution_pattern.count and then substitution_pattern.item(i + 1).is_digit then
               if in_verbatim_text then
                  substrings_last_indexes.add_first(i - 1)
                  substrings_last_indexes.reindex(substrings_last_indexes.lower - 1)
                  in_verbatim_text := False
               end
               i := i + 1
               if substitution_pattern.item(i).value > substrings_first_indexes.upper then
                  pattern_error_position := i
                  pattern_error_message := once "Invalid reference for current pattern."
                  substitution_pattern_ready := False
                  i := substitution_pattern.count
               end
               compiled_substitution_pattern.add_last(substitution_pattern.item(i).value)
            else
               if substitution_pattern.item(i) = '\' and then i < substitution_pattern.count then
                  substitution_pattern.remove(i)
               end
               if not in_verbatim_text then
                  substrings_first_indexes.add_first(i)
                  substrings_first_indexes.reindex(substrings_first_indexes.lower - 1)
                  compiled_substitution_pattern.add_last(substrings_first_indexes.lower)
                  in_verbatim_text := True
               end
            end
            i := i + 1
         end
         if in_verbatim_text then
            check
               i - 1 = substitution_pattern.count
            end
            substrings_last_indexes.add_first(i - 1)
            substrings_last_indexes.reindex(substrings_last_indexes.lower - 1)
         end
      ensure
         substitution_pattern_ready implies valid_substitution
         substitution_pattern_ready xor pattern_error_message /= Void
      end

   last_substitution: STRING
         -- You need to copy this STRING if you want to keep it.
      do
         Result := last_substitution_memory
         if Result = Void then
            create Result.make(128)
            last_substitution_memory := Result
         end
      end

   substitute_for (text: ABSTRACT_STRING)
         -- This call has to be preceded by a successful matching on the same text.
         -- Then the substitution is made on the matching part. The result is in `last_substitution'.
         --
         -- See also `prepare_substitution', `last_substitution', `substitute_in'.
      require
         can_substitute
         text /= Void
         text.is_equal(last_match_text)
      local
         i, first: INTEGER; src: ABSTRACT_STRING; index: INTEGER
      do
         from
            last_substitution.copy_substring(text, 1, last_match_first_index - 1)
            i := compiled_substitution_pattern.lower
         until
            i > compiled_substitution_pattern.upper
         loop
            index := compiled_substitution_pattern.item(i)
            if index < 0 then
               src := substitution_pattern
            else
               src := text
            end
            first := substrings_first_indexes.item(index)
            if first > 0 then
               last_substitution.append_substring(src, first, substrings_last_indexes.item(index))
            end
            i := i + 1
         end
         last_substitution.append_substring(text, last_match_last_index + 1, text.count)
         invalidate_last_match
      ensure
         last_substitution /= Void
         substitution_pattern_ready
         only_one_substitution_per_match: not can_substitute
      end

   substitute_in (text: STRING)
         -- This call has to be preceded by a successful matching on the same text.
         -- Then the substitution is made in `text' on the matching
         -- part (`text' is modified).
         --
         -- See also `prepare_substitution', `substitute_for'.
      require
         can_substitute
         text /= Void
         text.is_equal(last_match_text)
      do
         substitute_for(text)
         text.copy(last_substitution)
      ensure
         substitution_pattern_ready
         only_one_substitution_per_match: not can_substitute
      end

   substitute_all_for (text: ABSTRACT_STRING)
         -- Every matching part is substituted. No preliminary matching is required.
         -- The result is in `last_substitution'.
         --
         -- See also `prepare_substitution', `last_substitution', `substitute_all_in'.
      require
         substitution_pattern_ready
         text /= Void
      local
         text_pos: INTEGER
      do
         text_pos := substitute_all_without_tail(text)
         if text_pos = 1 then
            last_substitution.make_from_string(text)
         else
            last_substitution.append_substring(text, text_pos, text.count)
         end
      ensure
         last_substitution /= Void
         substitution_pattern_ready
      end

   substitute_all_in (text: STRING)
         -- Every matching part is substituted. No preliminary matching is required.
         -- `text' is modified according to the substitutions is any.
         --
         -- See also `prepare_substitution', `last_substitution', `substitute_all_for'.
      require
         substitution_pattern_ready
         text /= Void
      local
         text_pos: INTEGER
      do
         text_pos := substitute_all_without_tail(text)
         if text_pos /= 1 then
            text.replace_substring(last_substitution, 1, text_pos - 1)
         end
      ensure
         substitution_pattern_ready
      end

   can_substitute: BOOLEAN
         -- Substitution is only allowed when some valid substitution
         -- pattern has been registered and after a successful pattern matching.
         --
         -- See also `substitute_in', `substitute_for'.
      do
         Result := substitution_pattern_ready and last_match_succeeded
      ensure
         definition: Result = (substitution_pattern_ready and last_match_succeeded)
      end

   substitution_pattern_ready: BOOLEAN -- True if some valid substitution pattern has been registered.

feature {ANY} -- Error informations
   pattern_error_message: STRING
         -- Error message for the substitution pattern.
         --
         -- See also `prepare_substitution'.

   pattern_error_position: INTEGER
         -- Error position in the substitution pattern.
         --
         -- See also `prepare_substitution'.

feature {}
   save_matching_text (text: ABSTRACT_STRING): BOOLEAN
         -- Used in assertion only. Side-effect: save the text
      do
         last_match_text.make_from_string(text)
         Result := True
      ensure
         Result -- Assertion only feature
      end

   invalidate_last_match
         -- Used to prevent 2 substitutions without intermediate matching.
      require
         last_match_succeeded
      do
         substrings_first_indexes.put(0, 0)
      ensure
         not last_match_succeeded
         not can_substitute
      end

   valid_substrings (text: ABSTRACT_STRING): BOOLEAN
         -- Used in assertion only.
      require
         last_match_succeeded
      local
         i, first, last: INTEGER
      do
         from
            i := 0
            first := substrings_first_indexes.item(0)
            last := substrings_last_indexes.item(0)
            Result := text.valid_index(first)
            if not Result then
               Result := text.upper + 1 = first and then first = last + 1
            elseif last < first then
               Result := first = last + 1
            else
               Result := text.valid_index(last) and then first <= last
            end
         until
            not Result or i >= substrings_first_indexes.upper
         loop
            i := i + 1
            first := substrings_first_indexes.item(i)
            last := substrings_last_indexes.item(i)
            Result := first = 0
            if not Result then
               Result := first.in_range(last_match_text.lower, last_match_text.upper + 1)
               Result := Result and then last.in_range(first - 1, last_match_text.upper)
            end
         end
      ensure
         Result -- Method for assertion only (error position is element item `i')
      end

   valid_substitution: BOOLEAN
         -- Used in assertion only.
      local
         i, size: INTEGER
      do
         if substrings_first_indexes.valid_index(-1) then
            from
               i := -1
               Result := substitution_pattern.valid_index(substrings_first_indexes.item(-1))
            until
               not Result or i < substrings_first_indexes.lower
            loop
               Result := substrings_first_indexes.item(i) <= substrings_last_indexes.item(i)
               if substrings_first_indexes.valid_index(i - 1) then
                  Result := Result and then substrings_last_indexes.item(i) < substrings_first_indexes.item(i - 1)
               end
               size := size + substrings_last_indexes.item(i) - substrings_first_indexes.item(i) + 1
               i := i - 1
            end
            Result := Result and then substitution_pattern.valid_index(substrings_last_indexes.first)
         else
            Result := compiled_substitution_pattern.count = 0
         end
         from
            i := compiled_substitution_pattern.upper
         until
            i < compiled_substitution_pattern.lower
         loop
            Result := Result and then substrings_last_indexes.valid_index(compiled_substitution_pattern.item(i))
            i := i - 1
         end
         if Result then
            Result := substitution_pattern.count - size = (compiled_substitution_pattern.count - -substrings_last_indexes.lower) * 2
         end
      ensure
         Result -- Method for assertion only
      end

   substitute_all_without_tail (text: ABSTRACT_STRING): INTEGER
         -- Substitute all matching parts from `text'. The resulting text
         -- in `last_substitution', except the end. The part of `text' from
         -- `Result' up to the end is not copied.
      require
         substitution_pattern_ready
         text /= Void
      local
         i: INTEGER; src: ABSTRACT_STRING; index: INTEGER
      do
         from
            last_substitution.clear_count
            Result := 1
         until
            not match_from(text, Result)
         loop
            last_substitution.append_substring(text, Result, last_match_first_index - 1)
            from
               i := compiled_substitution_pattern.lower
            until
               i > compiled_substitution_pattern.upper
            loop
               index := compiled_substitution_pattern.item(i)
               if index < 0 then
                  src := substitution_pattern
               else
                  src := text
               end
               last_substitution.append_substring(src, substrings_first_indexes.item(index), substrings_last_indexes.item(index))
               i := i + 1
            end
            Result := last_match_last_index + 1
         end
      ensure
         last_substitution /= Void
         substitution_pattern_ready
      end

   substrings_first_indexes: ARRAY[INTEGER]
         -- Item(0) is the starting position in the text where
         -- starts the substring who is matching the whole pattern.
         -- Next elements are the starting positions in the text of
         -- substrings matching sub-elements of the pattern.
         --
         -- Elements before item(0) refers to positions in the
         -- `substitution_pattern'. They are stored in reverse order,
         -- the first verbatim string being at index -1, the
         -- second one at index -2...

   substrings_last_indexes: ARRAY[INTEGER]
         -- The ending position of the string starting at position
         -- found in `matching_position' at the same index.

   substrings_names: BIJECTIVE_DICTIONARY[INTEGER, FIXED_STRING]
         -- The names of the groups, if those names exist

   group_names_memory: COLLECTION[FIXED_STRING]
         -- Cache for `group_names'

   substitution_pattern: STRING
      once
         create Result.make_empty
      end

   compiled_substitution_pattern: FAST_ARRAY[INTEGER]
         -- This array describe the substitution text as a suite of
         -- strings from `substrings_first_indexes'.

   last_match_text: STRING
         -- For assertion only.
      do
         Result := last_match_text_memory
         if Result = Void then
            create Result.make(128)
            last_match_text_memory := Result
         end
      end

   set_group_names_memory
      do
         if group_names_memory = Void then
            create {FAST_ARRAY[FIXED_STRING]} group_names_memory.with_capacity(substrings_names.count)
         else
            group_names_memory.clear_count
         end
         substrings_names.key_map_in(group_names_memory)
      end

   last_match_text_memory: STRING -- For assertion only.

   last_substitution_memory: STRING

invariant
   substrings_first_indexes.lower = substrings_last_indexes.lower
   substrings_first_indexes.upper = substrings_last_indexes.upper
   substrings_names.is_empty or else (substrings_names.count <= substrings_first_indexes.count
                                      and then substrings_names.for_all(agent (i: INTEGER; s: FIXED_STRING): BOOLEAN
                                                                           do
                                                                              Result := s /= Void
                                                                                 and then substrings_first_indexes.valid_index(i)
                                                                           end (?, ?)))

end -- class REGULAR_EXPRESSION
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
