-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class TEST_PYTHON_SYNTAX_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         pattern: REGULAR_EXPRESSION
         text, data: STRING
      do
         pattern := re.convert_python_pattern("a+(?P=foo)")
         assert(pattern = Void)
         assert(re.last_error_message.is_equal("Error at position 10: undefined named group."))
         assert(re.last_error_position = 10)

         pattern := re.convert_python_pattern("^(?P<foo>a+)(?P=foo)$")
         assert(pattern /= Void)
         assert(not pattern.match("aaa"))
         text := "aaaa"
         assert(pattern.match(text))
         assert(pattern.group_names.count = 1)
         assert(pattern.group_names.first.is_equal("foo"))
         assert(pattern.has_group_name("foo"))
         assert(not pattern.has_group_name("bar"))
         assert(pattern.ith_group_matched(0))
         assert(pattern.named_group_matched("foo"))
         data := ""
         pattern.append_named_group(text, data, "foo")
         assert(data.is_equal("aa"))

         pattern := re.convert_python_pattern("^(?P<foo>a+?)(?P=foo)$")
         assert(pattern /= Void)
         assert(not pattern.match("aaa"))
         text := "aaaa"
         assert(pattern.match(text))
         assert(pattern.group_names.count = 1)
         assert(pattern.group_names.first.is_equal("foo"))
         assert(pattern.has_group_name("foo"))
         assert(not pattern.has_group_name("bar"))
         assert(pattern.ith_group_matched(0))
         assert(pattern.named_group_matched("foo"))
         data := ""
         pattern.append_named_group(text, data, "foo")
         assert(data.is_equal("aa"))

         pattern := re.convert_python_pattern("^(?P<foo>a+b)(?P=foo)$")
         assert(pattern /= Void)
         assert(not pattern.match("aaaabab"))
         text := "aaabaaab"
         assert(pattern.match(text))
         assert(pattern.group_names.count = 1)
         assert(pattern.group_names.first.is_equal("foo"))
         assert(pattern.has_group_name("foo"))
         assert(not pattern.has_group_name("bar"))
         assert(pattern.ith_group_matched(0))
         assert(pattern.named_group_matched("foo"))
         data := ""
         pattern.append_named_group(text, data, "foo")
         assert(data.is_equal("aaab"))
         pattern.for_all_matched_named_groups(text, agent compare_group_text("foo", ?, "aaab", ?))
      end

   compare_group_text (expected_group: STRING; actual_group: FIXED_STRING; expected_data: STRING; actual_data: STRING)
      do
         assert(expected_group.is_equal(actual_group))
         assert(expected_data.is_equal(actual_data))
      end

   re: REGULAR_EXPRESSION_BUILDER

end -- class TEST_PYTHON_SYNTAX_01
