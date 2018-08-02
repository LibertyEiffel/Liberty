-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class BACKTRACKING_REGULAR_EXPRESSION_PATTERN
   --
   -- Class for backtracking (compiled) regular expressions pattern.
   --

feature {ANY}
   group_count: INTEGER
         -- The count of groups of the regular expression.

   is_valid: BOOLEAN
         -- Is the current pattern valid?
      do
         Result := root /= Void
      end

feature {BACKTRACKING_REGULAR_EXPRESSION}
   root: BACKTRACKING_NODE
         -- The root item.

   substrings_names: BIJECTIVE_DICTIONARY[INTEGER, FIXED_STRING]

feature {BACKTRACKING_REGULAR_EXPRESSION_BUILDER}
   make (top: like root; grpcnt: INTEGER; subnames: like substrings_names)
         -- Initializing
      require
         top_not_void: top /= Void
         valid_group_count: grpcnt >= 0
         valid_subnames: subnames.for_all(agent (c, i: INTEGER; s: FIXED_STRING): BOOLEAN do Result := i.in_range(0, c) and then s /= Void end (grpcnt, ?, ?))
      do
         root := top
         group_count := grpcnt
         substrings_names := subnames
      ensure
         definition: root = top and group_count = grpcnt
         valid: is_valid
      end

end -- class BACKTRACKING_REGULAR_EXPRESSION_PATTERN
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
