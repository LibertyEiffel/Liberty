-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BACKTRACKING_REGULAR_EXPRESSION_BUILDER
   --
   -- The frame class of all the regular expression builders.
   --

insert
   REGULAR_EXPRESSION_STRING_SCANNER
      rename scanned_string as expression,
         set_scanned_string as set_expression
      export {ANY} expression, set_expression, has_error, last_error, position;
         {BACKTRACKING_REGULAR_EXPRESSION_BUILDER} all
      redefine make
      end
   REGULAR_EXPRESSION_ITEM_GLOBALS
      export {BACKTRACKING_REGULAR_EXPRESSION_BUILDER} all
      end

feature {ANY} -- make
   make
         -- Initialise the attributes.
      do
         Precursor
         create stack.with_capacity(10)
         create group_stack.with_capacity(10)
      end

feature {ANY} -- behaviors
   is_case_insensitive: BOOLEAN
         -- Is the match case insensitive?
         -- Default is False

   is_case_sensitive: BOOLEAN
         -- Is the match case sensitive?
         -- Default is True
      do
         Result := not is_case_insensitive
      end

   set_case_sensitive
         -- Set the match as case sensitive.
      do
         is_case_insensitive := False
      ensure
         definition: is_case_insensitive = False and is_case_sensitive = True
      end

   set_case_insensitive
         -- Set the match as case insensitive.
      do
         is_case_insensitive := True
      ensure
         definition: is_case_insensitive = True and is_case_sensitive = False
      end

   does_any_match_newline: BOOLEAN
         -- Does the "any character" mark match a newline?
         -- Default is False

   set_any_match_newline
         -- The "any character" mark will match a newline.
      do
         does_any_match_newline := True
      ensure
         definition: does_any_match_newline = True
      end

   set_any_dont_match_newline
         -- The "any character" mark will not match a newline.
      do
         does_any_match_newline := False
      ensure
         definition: does_any_match_newline = False
      end

   does_match_line_boundary: BOOLEAN
         -- Does the begin/end marks match line boundary?
         -- Default is False

   does_match_text_boundary: BOOLEAN
         -- Does the begin/end marks match text boundary?
         -- Default is True
      do
         Result := not does_match_line_boundary
      ensure
         definition: Result = not does_match_line_boundary
      end

   set_match_line_boundary
         -- The begin/end marks will match line boundary.
      do
         does_match_line_boundary := True
      ensure
         definition: does_match_line_boundary = True and does_match_text_boundary = False
      end

   set_match_text_boundary
         -- The begin/end marks will match text boundary.
      do
         does_match_line_boundary := False
      ensure
         definition: does_match_line_boundary = False and does_match_text_boundary = True
      end

   set_default_options
         -- Set the default options
      do
         set_case_sensitive
         set_any_dont_match_newline
         set_match_text_boundary
      ensure
         is_case_sensitive
         not does_any_match_newline
         does_match_text_boundary
      end

feature {} -- internal behavior
   is_greedy: BOOLEAN
         -- Does match a maximal repeat?
         -- Default is False

   set_greedy
         -- Will match a maximal repeat.
      do
         is_greedy := True
      ensure
         definition: is_greedy = True
      end

   set_not_greedy
         -- Will match a minimal repeat.
      do
         is_greedy := False
      ensure
         definition: is_greedy = False
      end

   is_looking_ahead: BOOLEAN
         -- Is building a look-ahead term?

   is_looking_behind: BOOLEAN
         -- Is building a look-behind term?

   is_looking_around: BOOLEAN
         -- Is building look-ahead or look-behind?
      do
         Result := is_looking_ahead or else is_looking_behind
      end

   is_looking_positive: BOOLEAN
         -- Is the current look-around positive or negative?

feature {ANY} -- parsing
   parse_expression (expr: like expression)
         -- Set the expression to parse and parse it.
         -- When no error the result if put in feature
         -- 'last_regular_expression'.
         -- If there is an error, a human readable explanation
         -- is retrievable by the feature 'last_error'.
      require
         expression_not_void: expr /= Void
      do
         set_expression(expr)
         parse
      ensure
         error_or_result: has_error xor has_result
      end

   parse
         -- Parse the current expression.
         -- The result if any is got through 'last_regular_expression'
      require
         expression_not_void: expression /= Void
         internal_state_ok: stack.is_empty and group_stack.is_empty
      local
         pattern: BACKTRACKING_REGULAR_EXPRESSION_PATTERN
      do
         last_group_count := 0
         last_substrings_names.clear_count
         clear_error
         internal_parse
         if not has_error then
            pattern.make(stack.first, last_group_count, last_substrings_names)
         end
         stack.clear_count
         group_stack.clear_count
         last_pattern := pattern
      ensure
         internal_state_ok: stack.is_empty and group_stack.is_empty
         error_or_result: has_error xor has_result
      end

feature {ANY} -- results
   has_result: BOOLEAN
         -- Did the last 'parse' or 'parse_expression' produced
         -- a result in 'last_regular_expression'?
      do
         Result := last_pattern.is_valid
      ensure
         definition: Result = last_pattern.is_valid
      end

   last_pattern: BACKTRACKING_REGULAR_EXPRESSION_PATTERN
         -- The last regular expression pattern built by
         -- 'parse' or 'parse_expression'

feature {}
   internal_parse
         -- The parse function to be implemented by the
         -- effective builders.
      require
         at_first_position: position = expression.lower
         stack_is_empty: stack.is_empty
         no_groups: last_group_count = 0 and group_stack.is_empty
      deferred
      ensure
         error_or_result: has_error or else stack.count = 1 and group_stack.is_empty
      end

feature {} -- build
   stack: FAST_ARRAY[BACKTRACKING_NODE]
         -- The stack of items.

   group_stack: FAST_ARRAY[INTEGER]
         -- The stack of groups

   last_group_count: INTEGER
         -- The count of groups currently found.

   last_substrings_names: HASHED_BIJECTIVE_DICTIONARY[INTEGER, FIXED_STRING]
         -- The names of the named subgroups
      once
         create Result.with_capacity(10)
      end

   Repeat_infiny: INTEGER -1
         -- Constant that means "infinite repetition".

   emit (item: BACKTRACKING_NODE)
         -- Pushes 'item' on the stack.
         --  [..] -> [.., item]
      require
         item_not_void: item /= Void
      do
         stack.add_last(item)
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
      end

   unemit: BACKTRACKING_NODE
         -- Pops the Result from the stack.
         --  [... Result] -> [...]
      require
         stack_not_empty: stack.count > 0
      do
         Result := stack.last
         stack.remove_last
      ensure
         stack_count_decreased_by_one: stack.count = old stack.count - 1
      end

   emit_any_character
         -- Push the match to any characters
      do
         if does_any_match_newline then
            emit(the_any_character_item)
         else
            emit(the_not_end_of_line_item)
         end
      end

   emit_begin_of_line
         -- Push the match to begin of a line
      do
         if does_match_line_boundary then
            emit(the_begin_of_line_item)
         else
            emit(the_begin_of_text_item)
         end
      end

   emit_end_of_line
         -- Push the match to end of a line
      do
         if does_match_line_boundary then
            emit(the_end_of_line_item)
         else
            emit(the_end_of_text_item)
         end
      end

   prepare_group
         -- Declares that a new group begins.
      do
         last_group_count := last_group_count + 1
         group_stack.add_last(last_group_count)
      ensure
         last_group_count_increased_by_one: last_group_count = old last_group_count + 1
         group_greater_than_zero: last_group_count > 0
         group_stack_count_increased_by_one: group_stack.count = old group_stack.count + 1
         group_pushed: group_stack.last = last_group_count
      end

   emit_group
         -- Push the "end of group" item and update the
         -- group indicators
         --  [.. X] -> [.., end_group(i)]
      require
         group_greater_than_zero: last_group_count > 0
         group_stack_not_empty: not group_stack.is_empty
         enough_data: stack.count > 0
      local
         x: BACKTRACKING_NODE_AND_LIST; y: BACKTRACKING_NODE
      do
         y := create {REGULAR_EXPRESSION_ITEM_END_GROUP}.make(group_stack.last)
         x := create {BACKTRACKING_NODE_AND_LIST}.make(y, Void)
         x := create {BACKTRACKING_NODE_AND_LIST}.make(unemit, x)
         y := create {REGULAR_EXPRESSION_ITEM_BEGIN_GROUP}.make(group_stack.last)
         x := create {BACKTRACKING_NODE_AND_LIST}.make(y, x)
         emit(x)
         group_stack.remove_last
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
         last_group_count_unchanged: last_group_count = old last_group_count
         group_stack_count_decreased_by_one: group_stack.count = old group_stack.count - 1
      end

   emit_begin_group
         -- Push the "begin of group" item and update the
         -- group indicators
         --  [..] -> [.., begin_group(i)]
      obsolete "Use `declare_group'/`emit_group' instead (February 2006)."
      do
         last_group_count := last_group_count + 1
         group_stack.add_last(last_group_count)
         emit(create {REGULAR_EXPRESSION_ITEM_BEGIN_GROUP}.make(last_group_count))
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
         last_group_count_increased_by_one: last_group_count = old last_group_count + 1
         group_greater_than_zero: last_group_count > 0
         group_stack_count_increased_by_one: group_stack.count = old group_stack.count + 1
         group_pushed: group_stack.last = last_group_count
      end

   emit_end_group
         -- Push the "end of group" item and update the
         -- group indicators
         --  [..] -> [.., end_group(i)]
      obsolete "Use `declare_group'/`emit_group' instead (February 2006)."
      require
         group_greater_than_zero: last_group_count > 0
         group_stack_not_empty: not group_stack.is_empty
      do
         emit(create {REGULAR_EXPRESSION_ITEM_END_GROUP}.make(group_stack.last))
         group_stack.remove_last
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
         last_group_count_unchanged: last_group_count = old last_group_count
         group_stack_count_decreased_by_one: group_stack.count = old group_stack.count - 1
      end

   emit_match_previous_group (group: INTEGER)
         -- Push the item that matches the character 'char'
         --  [..] -> [.., previous_group(group)]
      require
         valid_group: 0 < group and group <= last_group_count
         closed_group: not group_stack.has(group)
      do
         if is_case_sensitive then
            emit(create {REGULAR_EXPRESSION_ITEM_PREVIOUS_GROUP}.make(group))
         else
            emit(create {REGULAR_EXPRESSION_ITEM_PREVIOUS_GROUP_NO_CASE}.make(group))
         end
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
      end

   emit_match_single (char: CHARACTER)
         -- Push the item that matches the character 'char'
         --  [..] -> [.., char]
      do
         if is_case_sensitive then
            emit(create {REGULAR_EXPRESSION_ITEM_SINGLE}.make(char))
         else
            emit(create {REGULAR_EXPRESSION_ITEM_SINGLE_NO_CASE}.make(char))
         end
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
      end

   emit_match_range (lower, upper: CHARACTER)
         -- Push the item that matches the character range 'lower'..'upper'.
         --  [..] -> [.., lower..upper]
      require
         valid_range: lower <= upper
      local
         binf, bsup, low, up: CHARACTER
      do
         if is_case_sensitive then
            emit(create {REGULAR_EXPRESSION_ITEM_RANGE}.make(lower, upper))
         else
            low := lower
            up := upper
            if up >= 'A' and then low <= 'Z' then
               binf := low.max('A').to_lower
               bsup := up.min('Z').to_lower
               if binf < low and then bsup >= low then
                  low := binf
               end
               if binf <= up and then bsup > up then
                  up := bsup
               end
            end
            if up >= 'a' and then low <= 'z' then
               binf := low.max('a').to_upper
               bsup := up.min('z').to_upper
               if binf < low and then bsup >= low then
                  low := binf
               end
               if binf <= up and then bsup > up then
                  up := bsup
               end
            end
            begin_collect
            emit(create {REGULAR_EXPRESSION_ITEM_RANGE}.make(low, up))
            if up >= 'A' and then low <= 'Z' then
               binf := low.max('A').to_lower
               bsup := up.min('Z').to_lower
               if bsup > up or else binf < low then
                  emit(create {REGULAR_EXPRESSION_ITEM_RANGE}.make(binf, bsup))
               end
            end
            if up >= 'a' and then low <= 'z' then
               binf := low.max('a').to_upper
               bsup := up.min('z').to_upper
               if bsup > up or else binf < low then
                  emit(create {REGULAR_EXPRESSION_ITEM_RANGE}.make(binf, bsup))
               end
            end
            end_collect_or
         end
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
      end

   emit_match_text (text: STRING)
         -- Push the item that matches the 'text'
         --  [..] -> [.., text]
      do
         if is_looking_behind then
            text.reverse
         end
         if is_case_sensitive then
            emit(create {REGULAR_EXPRESSION_ITEM_TEXT}.make(text.twin))
         else
            emit(create {REGULAR_EXPRESSION_ITEM_TEXT_NO_CASE}.make(text))
         end
      ensure
         stack_count_increased_by_one: stack.count = old stack.count + 1
         stack_not_empty: stack.count > 0
      end

   begin_collect
         -- Begin to collect a collection of items by pushing Void on the stack.
         -- After calling 'begin_collect', one of the features
         -- 'end_collect_or' or 'end_collect_and' have to be called.
         -- That kind of group is intended to manage the collections
         -- of alternatives or sequences in an optimal way.
         --  [..] -> [.., Void]
      do
         stack.add_last(Void)
      ensure
         has_collect: stack.fast_occurrences(Void) > 0
         emit_group_empty: stack.last = Void
         emit_group_count_incremented: stack.fast_occurrences(Void) = old stack.fast_occurrences(Void) + 1
      end

   is_collect_empty: BOOLEAN
         -- True if currently begun collect is empty
      require
         is_collecting: stack.fast_occurrences(Void) > 0
      do
         Result := stack.last = Void
      ensure
         definition: Result = (stack.last = Void)
      end

   end_collect_true
         -- Replace an empty collection by TRUE
         --  [.., Void] -> [.., TRUE]
      require
         is_collecting: stack.fast_occurrences(Void) > 0
         collect_empty: is_collect_empty
      do
         stack.put(the_true_node, stack.upper)
      end

   end_collect_or
         -- Collects the item on the stack until the collect mark (a Void)
         -- and replace it by a single item that is a or of all of them.
         -- The collection must not be empty.
         -- The order of evaluation will remain.
         -- The binary or's tree is recursive on right for efficiency.
         --  [.., Void, X] -> [.., X]
         --  [.., Void, Y, X] -> [.., Y or X]
         --  [.., Void, Z, Y, X] -> [.., Z or (Y or X)]
         --  ...
      require
         is_collecting: stack.fast_occurrences(Void) > 0
         collect_not_empty: not is_collect_empty
      local
         x: BACKTRACKING_NODE_OR_LIST; y: BACKTRACKING_NODE
      do
         y := unemit
         if stack.last = Void then
            stack.remove_last
            emit(y)
         else
            from
            until
               y = Void
            loop
               x := create {BACKTRACKING_NODE_OR_LIST}.make(y, x)
               y := unemit
            end
            emit(x)
         end
      ensure
         stack_not_empty: stack.count > 0
         emit_group_count_decremented: stack.fast_occurrences(Void) = old stack.fast_occurrences(Void) - 1
      end

   revert_and_list(x: BACKTRACKING_NODE_AND_LIST): BACKTRACKING_NODE_AND_LIST
      local
         y, n: BACKTRACKING_NODE_AND_LIST
      do
         from
            y := x
         until
            y = Void
         loop
            n := y.next
            y.set_next(Result)
            Result := y
            y := n
         end
      end

   end_collect_and
         -- Collects the item on the stack until the collect mark (a Void)
         -- and replace it by a single item that is a and of all of them.
         -- The collection must not be empty.
         -- The order of evaluation will remain.
         -- The binary and's tree is recursive on right for efficiency.
         --  [.., Void, X] -> [.., X]
         --  [.., Void, Y, X] -> [.., Y and X]
         --  [.., Void, Z, Y, X] -> [.., Z and (Y and X)]
         --  ...
      require
         is_collecting: stack.fast_occurrences(Void) > 0
         collect_not_empty: not is_collect_empty
      local
         x: BACKTRACKING_NODE_AND_LIST; y: BACKTRACKING_NODE
      do
         y := unemit
         if stack.last = Void then
            stack.remove_last
            emit(y)
         else
            from
            until
               y = Void
            loop
               x := create {BACKTRACKING_NODE_AND_LIST}.make(y, x)
               y := unemit
            end
            if is_looking_behind then
               x := revert_and_list(x)
            end
            emit(x)
         end
      ensure
         stack_not_empty: stack.count > 0
         emit_group_count_decremented: stack.fast_occurrences(Void) = old stack.fast_occurrences(Void) - 1
      end

   emit_not
         -- Replaces the top of the stack by its negation.
         --  [.., X] -> [.., not(X)]
         -- (where not(X) is like (X and (CUT and FALSE)) or TRUE)
      require
         enough_data: stack.count > 0
      local
         node, x: BACKTRACKING_NODE
      do
         x := unemit
         node := create {BACKTRACKING_NODE_NOT}.make(x)
         emit(node)
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
      end

   emit_not_then_any
         -- Replaces the top of the stack by its negation followed by any.
         --  [.., X] -> [.., not(X)]
         -- (where not(X) is like (X and (CUT and FALSE)) or ANY)
      require
         enough_data: stack.count > 0
      local
         node, x: BACKTRACKING_NODE
      do
         x := unemit
         node := create {REGULAR_EXPRESSION_ITEM_NOT_THEN_ANY}.make(x)
         emit(node)
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
      end

   emit_true_or
         -- Replaces the top of the stack by true or it
         --  [.., X] -> [.., true or X]
      require
         enough_data: stack.count > 0
      local
         node, x: BACKTRACKING_NODE
      do
         x := unemit
         node := create {BACKTRACKING_NODE_TRUE_OR}.make(x)
         emit(node)
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
      end

   emit_or_true
         -- Replaces the top of the stack by it or true
         --  [.., X] -> [.., X or true]
      require
         enough_data: stack.count > 0
      local
         node, x: BACKTRACKING_NODE
      do
         x := unemit
         node := create {BACKTRACKING_NODE_OR_TRUE}.make(x)
         emit(node)
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
      end

   emit_controled_or_true
         -- Replaces the top of the stack by
         --  if is_greedy then [.., X] -> [.., X or true]
         --               else [.., X] -> [.., true or X]
      local
         x: BACKTRACKING_NODE
      do
         x := unemit
         emit(controled_or_true_item(x))
      end

   controled_or_true_item (x: BACKTRACKING_NODE): BACKTRACKING_NODE
         -- Returns an item for " 'x' or true ". The returned item depend on
         -- the flag 'is_greedy'.
         --  if is_greedy then Result = (X or true)
         --               else Result = (true or X)
      do
         if is_greedy then
            Result := create {BACKTRACKING_NODE_OR_TRUE}.make(x)
         else
            Result := create {BACKTRACKING_NODE_TRUE_OR}.make(x)
         end
      end

   emit_repeat (mini, maxi: INTEGER)
         -- Takes the top of the stack and replace it with
         -- a construction that will evaluate the repeating of
         -- it from 'mini' to 'maxi' times.
         -- The feature boolean 'is_greedy' controls if
         -- the matched repeat will be of minimal length
         -- or of maximal length. That feature
         -- is reset to its default (False) value.
      require
         enough_data: stack.count > 0
         mini_is_valid: mini >= 0 and then mini /= Repeat_infiny
         maxi_is_valid: maxi = Repeat_infiny or else maxi >= mini
         not_droping: mini = 0 implies maxi /= 0
      local
         expr, resu: BACKTRACKING_NODE; exp_and: BACKTRACKING_NODE_AND_PAIR; i: INTEGER
      do
         expr := unemit
         if maxi = Repeat_infiny then
            create exp_and.make(expr, the_false_node)
            resu := controled_or_true_item(exp_and)
            exp_and.set_second(resu)
         elseif mini < maxi then
            from
               resu := controled_or_true_item(expr)
               i := mini + 2
            until
               i > maxi
            loop
               create exp_and.make(expr, resu)
               resu := controled_or_true_item(exp_and)
               i := i + 1
            end
         end
         from
            if mini = maxi then
               check
                  resu = Void
               end
               i := 2
               resu := expr
            else
               check
                  resu /= Void
               end
               i := 1
            end
         until
            i > mini
         loop
            create exp_and.make(expr, resu)
            resu := exp_and
            i := i + 1
         end
         emit(resu)
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
      end

   emit_looking
      require
         enough_data: stack.count > 0
         is_looking: is_looking_around
      local
         node, x: BACKTRACKING_NODE
      do
         x := unemit
         node := create {REGULAR_EXPRESSION_ITEM_LOOK}.make(x, is_looking_ahead, is_looking_positive)
         emit(node)
      ensure
         constant_stack_count: stack.count = old stack.count
         stack_not_empty: stack.count > 0
      end

invariant
   last_string_not_void: last_string /= Void
   stack_not_void: stack /= Void

end -- class BACKTRACKING_REGULAR_EXPRESSION_BUILDER
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
