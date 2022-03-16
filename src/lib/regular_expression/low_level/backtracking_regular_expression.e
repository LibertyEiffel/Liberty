-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BACKTRACKING_REGULAR_EXPRESSION
   --
   -- Matcher for regular expressions
   --

inherit
   BACKTRACKING
   REGULAR_EXPRESSION
      redefine group_count, last_match_succeeded, invalidate_last_match
      end

insert
   REGULAR_EXPRESSION_STRING_SCANNER
      export {ANY} scanned_string, goto_position, position;
         {BACKTRACKING_REGULAR_EXPRESSION_BUILDER, BACKTRACKING_NODE} all
      redefine set_scanned_string, make
      end

create {ANY}
   make

feature {ANY} -- common
   set_scanned_string (string: like scanned_string)
         -- Set 'scanned_string' to 'string'.
      do
         Precursor(string)
         last_match_succeeded := False
      ensure then
         match_reset: not last_match_succeeded
      end

   last_match_succeeded: BOOLEAN
         -- True if the last match (match_first or match_next) operation was a success.

   group_count: INTEGER
         -- The count of groups

   invalidate_last_match
      require else
         True
      do
         last_match_succeeded := False
      end

   basic_match_first
         -- Starts to match and try to find the first substring of 'scanned_string'
         -- that matches the regular expression.
      require
         scanned_string_not_void: scanned_string /= Void
      do
         do_match
      ensure
         scanned_string_remains: scanned_string = old scanned_string
      end

   basic_match_next
         -- Continues to match and try to find the next substring of 'scanned_string'
         -- that matches the regular expression.
      require
         scanned_string_not_void: scanned_string /= Void
         has_result: last_match_succeeded
         at_good_position: position = last_match_last_index + 1
      do
         do_match
      ensure
         scanned_string_remains: scanned_string = old scanned_string
      end

   match_from (text: ABSTRACT_STRING; first_index: INTEGER): BOOLEAN
      do
         set_scanned_string(text)
         goto_position(first_index)
         do_match
         Result := last_match_succeeded
      end

   matches_only_current_position: BOOLEAN
         -- Does the matching occur only from current position?
         -- If that flag is True then:
         --   * if match succeeds then position is advanced
         --   * if match fails the position remains
         --
         -- see also 'goto_position'

   set_matches_only_current_position (value: BOOLEAN)
         -- Sets 'matches_only_current_position' to 'value'.
      do
         matches_only_current_position := value
      ensure
         definition: matches_only_current_position = value
      end

feature {ANY} -- creation
   make
         -- Creation.
      do
         Precursor
         create context.with_capacity(30)
         create substrings_first_indexes.with_capacity(10, 0)
         create substrings_last_indexes.with_capacity(10, 0)
         create {HASHED_BIJECTIVE_DICTIONARY[INTEGER, FIXED_STRING]} substrings_names.with_capacity(10)
         direction := 1
      end

   set_pattern (pattern: BACKTRACKING_REGULAR_EXPRESSION_PATTERN)
         -- Set the matched pattern.
      require
         valid_pattern: pattern.is_valid
      do
         root_node := pattern.root
         group_count := pattern.group_count
         substrings_first_indexes.resize(substrings_first_indexes.lower, group_count)
         substrings_last_indexes.resize(substrings_last_indexes.lower, group_count)
         substrings_names.copy(pattern.substrings_names)
         invalidate_last_match
      ensure
         value_set: root_node = pattern.root
         group_count_set: group_count = pattern.group_count
         match_reset: not last_match_succeeded
      end

feature {} -- backtracked search
   root_node: BACKTRACKING_NODE
         -- The regular expression to be matched.

   do_match
         -- Main matching routine.
         -- Starting at the current position it tries to match the
         -- current scanned_string against the current regular expression.
      require
         scanned_string_not_void: scanned_string /= Void
      local
         pos: INTEGER; stop: BOOLEAN
      do
         from
            clear
            clear_all_groups
            last_match_succeeded := False
         until
            last_match_succeeded or else stop
         loop
            -- search
            pos := position
            stop := end_of_input
            set_current_node(root_node)
            search_first
            if is_off then
               -- when no match
               if matches_only_current_position then
                  goto_position(pos)
                  stop := True
               else
                  if not stop then
                     goto_position(pos + 1)
                  end
               end
            else
               -- when match found
               substrings_first_indexes.put(pos, 0)
               substrings_last_indexes.put(position - 1, 0)
               last_match_succeeded := True
            end
         end
      end

feature {REGULAR_EXPRESSION_ITEM} -- context management
   context_type_frame: INTEGER -1

   context_frame_cut: INTEGER -2

   context: FAST_ARRAY[INTEGER]

   context_top: INTEGER

   context_clear
      do
         context.clear_count
         context_top := context.upper
      end

   context_push
      do
         context.add_last(position)
         context.add_last(context_top)
         context.add_last(context_type_frame)
         context_top := context.upper
      end

   context_restore
      local
         top: INTEGER
      do
         from
         until
            context_top = context.upper
         loop
            top := context.last
            inspect
               top
            when context_frame_cut then
               context.remove_tail(3)
            when context_type_frame then
               check
                  False
               end
               -- never append
               context.remove_tail(3)
            else
               check
                  top.in_range(0, substrings_first_indexes.upper)
               end
               context.remove_last
               substrings_first_indexes.put(context.last, top)
               context.remove_last
               substrings_last_indexes.put(context.last, top)
               context.remove_last
            end
         end
         check
            context_top >= 2
            context.last = context_type_frame
         end
         goto_position(context.item(context.upper - 2))
      end

   context_restore_and_pop
      do
         context_restore
         check
            context.last = context_type_frame
         end
         context.remove_last
         context_top := context.last
         context.remove_tail(2)
      end

   context_cut
      local
         tmp: INTEGER
      do
         check
            context.valid_index(context_top) and context.valid_index(context_top - 2)
         end
         check
            context.item(context_top) = context_type_frame
         end
         tmp := context.item(context_top - 1)
         context.put(context_frame_cut, context_top)
         context_top := tmp
      end

feature {REGULAR_EXPRESSION_ITEM} -- group facilities
   set_group_first_index (group: INTEGER)
         -- Records the beginning of a group.
      require
         valid_group: group.in_range(0, substrings_first_indexes.upper)
      do
         context.add_last(substrings_last_indexes.item(group))
         context.add_last(substrings_first_indexes.item(group))
         context.add_last(group)
         if direction > 0 then
            substrings_first_indexes.put(position, group)
         else
            substrings_last_indexes.put(position, group)
         end
      end

   set_group_last_index (group: INTEGER)
         -- Records the end of a group.
      require
         valid_group: group.in_range(0, substrings_last_indexes.upper)
      do
         if direction > 0 then
            substrings_last_indexes.put(position - 1, group)
         else
            substrings_first_indexes.put(position + 1, group)
         end
      end

   clear_group (group: INTEGER)
         -- Set 'group' to empty string.
      do
         substrings_first_indexes.put(0, group)
         substrings_last_indexes.put(0, group)
      end

   clear_all_groups
         -- Set all groups to empty string.
      do
         substrings_first_indexes.set_slice_with(0, 0, group_count)
         substrings_last_indexes.set_slice_with(0, 0, group_count)
      end

feature {REGULAR_EXPRESSION_ITEM} -- advancing the scan
   saved_look_position: INTEGER
         -- the saved position for look ahead or look behind

   begin_look_ahead
         -- Begins to look-ahead.
      require
         no_look_begun: saved_look_position = 0
         valid_position: position > 0
      do
         saved_look_position := position
      ensure
         look_ahead_begun: saved_look_position > 0
         position_saved: position = saved_look_position
      end

   end_look_ahead
         -- Terminates to look-ahead.
      require
         look_ahead_begun: saved_look_position > 0
      do
         goto_position(saved_look_position)
         saved_look_position := 0
      ensure
         position_restored: position = old saved_look_position
         no_look_begun: saved_look_position = 0
         valid_position: position > 0
      end

   begin_look_behind
         -- Begins to look-behind.
      require
         no_look_begun: saved_look_position = 0
         valid_position: position > 0
      do
         saved_look_position := -position
         direction := -1
         goto_position(position - 1)
      ensure
         look_behind_begun: saved_look_position < 0
         position_saved: old position = -saved_look_position
         direction_changed: direction = -1
      end

   end_look_behind
         -- Terminates to look-behind.
      require
         look_behind_begun: saved_look_position < 0
      do
         direction := 1
         goto_position(-saved_look_position)
         saved_look_position := 0
      ensure
         position_restored: position = - old saved_look_position
         no_look_begun: saved_look_position = 0
         valid_position: position > 0
         direction_changed: direction = 1
      end

feature {REGULAR_EXPRESSION_ITEM} -- advancing the scan
   direction: INTEGER
         -- direction to advance (normal is +1, inverse is -1)

   advance
         -- Goes to the next character
      require
         not_at_end: not end_of_input
      do
         goto_position(position + direction)
      end

   advance_end_of_line
         -- Skips the end of line. Must be at end of a line.
      require
         at_end_of_line: end_of_input or else is_end_of_line
      do
         if not end_of_input then
            check
               last_character = '%N'
            end
            advance
         end
      end

feature {REGULAR_EXPRESSION_ITEM} -- matching facilities
   match_character (char: CHARACTER)
         -- If the character 'char' matches then advance and continue else backtrack.
      do
         if valid_last_character and then last_character = char then
            advance
            continue
         else
            backtrack
         end
      end

   match_character_no_case (char: CHARACTER)
         -- If the character 'char' matches then advance and continue else backtrack.
         -- Case does not care.
      require
         is_upper_character: char = char.to_upper
      do
         if valid_last_character and then last_character.to_upper = char then
            advance
            continue
         else
            backtrack
         end
      end

   match_string (text: STRING)
         -- If the string 'text' matches then advance and continue else backtrack.
      local
         i, len: INTEGER
      do
         from
            len := text.count
            i := 1
         until
            not valid_last_character or else i > len or else last_character /= text.item(i)
         loop
            advance
            i := i + 1
         end
         if i > len then
            continue
         else
            backtrack
         end
      end

   match_string_no_case (text: STRING)
         -- If the string 'text' matches then advance and continue else backtrack.
         -- Case does not care.
      require
         is_upper_string: -- all letters of 'text' are upper case
      local
         i, len: INTEGER
      do
         from
            len := text.count
            i := 1
         until
            not valid_last_character or else i > len or else last_character.to_upper /= text.item(i)
         loop
            advance
            i := i + 1
         end
         if i > len then
            continue
         else
            backtrack
         end
      end

   match_previous_group (group: INTEGER)
         -- If the previous 'group' matches then advance and continue else backtrack.
      local
         i, offset, len: INTEGER
      do
         if substrings_first_indexes.item(group) = 0 then
            backtrack
         else
            from
               if direction > 0 then
                  offset := substrings_first_indexes.item(group) - position
               else
                  offset := substrings_last_indexes.item(group) - position
               end
               len := substrings_last_indexes.item(group) - substrings_first_indexes.item(group) + 1
               i := 1
            until
               not valid_last_character or else i > len or else last_character /= scanned_string.item(position + offset)
            loop
               advance
               i := i + 1
            end
            if i > len then
               continue
            else
               backtrack
            end
         end
      end

   match_previous_group_no_case (group: INTEGER)
         -- If the previous 'group' matches then advance and continue else backtrack.
         -- Case does not care.
      local
         i, offset, len: INTEGER
      do
         if substrings_first_indexes.item(group) = 0 then
            backtrack
         else
            from
               if direction > 0 then
                  offset := substrings_first_indexes.item(group) - position
               else
                  offset := substrings_last_indexes.item(group) - position
               end
               len := substrings_last_indexes.item(group) - substrings_first_indexes.item(group) + 1
               i := 1
            until
               not valid_last_character or else i > len or else not last_character.same_as(scanned_string.item(position + offset))
            loop
               advance
               i := i + 1
            end
            if i > len then
               continue
            else
               backtrack
            end
         end
      end

feature {REGULAR_EXPRESSION_ITEM} -- positional predicates
   is_begin_of_text: BOOLEAN
         -- True if at begin of the text
      do
         if direction > 0 then
            Result := position = scanned_string.lower
         else
            Result := position < scanned_string.lower
         end
      ensure
         Result implies is_begin_of_line
      end

   is_end_of_text (really: BOOLEAN): BOOLEAN
         -- True if at end of the text
      do
         if direction > 0 then
            if really then
               Result := position > scanned_string.upper
            else
               if position > scanned_string.upper then
                  Result := scanned_string.is_empty or else scanned_string.last /= '%N'
               else
                  Result := position = scanned_string.upper and then scanned_string.last = '%N'
               end
            end
         else
            if really then
               Result := position >= scanned_string.upper
            else
               if position >= scanned_string.upper then
                  Result := scanned_string.is_empty or else scanned_string.last /= '%N'
               else
                  Result := position = scanned_string.upper - 1 and then scanned_string.last = '%N'
               end
            end
         end
      ensure
         Result implies is_end_of_line or else really and end_of_input
      end

   is_begin_of_line: BOOLEAN
         -- True if at begin of a line
      do
         if direction > 0 then
            Result := position = scanned_string.lower or else position <= scanned_string.upper and then scanned_string.item(position - 1) = '%N'
         else
            Result := position < scanned_string.lower or else position < scanned_string.upper and then scanned_string.item(position) = '%N'
         end
      end

   is_end_of_line: BOOLEAN
         -- True if at end of a line
      do
         if direction > 0 then
            if position > scanned_string.upper then
               Result := scanned_string.is_empty or else scanned_string.last /= '%N'
            else
               Result := scanned_string.item(position) = '%N'
            end
         else
            if position >= scanned_string.upper then
               Result := scanned_string.is_empty or else scanned_string.last /= '%N'
            else
               Result := scanned_string.item(position + 1) = '%N'
            end
         end
      end

   is_begin_of_word: BOOLEAN
         -- True if at begin of a word
      do
         if direction > 0 then
            if valid_last_character and then (last_character.is_letter_or_digit or else last_character = '_') then
               Result := not valid_previous_character or else not (previous_character.is_letter_or_digit or else previous_character = '_')
            end
         else
            if not valid_last_character or else not (last_character.is_letter_or_digit or else last_character = '_') then
               Result := valid_next_character and then (next_character.is_letter_or_digit or else next_character = '_')
            end
         end
      end

   is_end_of_word: BOOLEAN
         -- True if at end of a word
      do
         if direction > 0 then
            if end_of_input or else not (last_character.is_letter_or_digit or else last_character = '_') then
               Result := valid_previous_character and then (previous_character.is_letter_or_digit or else previous_character = '_')
            end
         else
            if valid_last_character and then (last_character.is_letter_or_digit or else last_character = '_') then
               Result := not valid_next_character or else not (next_character.is_letter_or_digit or else next_character = '_')
            end
         end
      end

invariant
   direction_quantified: direction.abs = 1
   no_error: not has_error

end -- class BACKTRACKING_REGULAR_EXPRESSION
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
