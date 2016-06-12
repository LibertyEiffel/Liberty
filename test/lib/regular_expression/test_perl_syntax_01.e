-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_PERL_SYNTAX_01
   --
   -- Testing regular expressions with perl syntax
   -- Input test file is from perl project (in perl-5.9.2.devel.tar.gz: perl-5.9.2/t/op/re_tests)
   -- It has been renamed as perl_re_tests

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   print_extra_info: BOOLEAN False

   comments_allowed: BOOLEAN True

   print_ok: BOOLEAN False

   print_error: BOOLEAN True

   make
      local
         re_tests: TEXT_FILE_READ
      do
         pattern := ""
         input_text := ""
         matching_result := ""
         function := ""
         function_result := ""
         comment := ""
         from
            create re_tests.connect_to("perl_re_tests")
            if not re_tests.is_connected then
               io.put_string("Failed to open file re_tests.%N")
               crash
            end
            re_tests.read_line
         until
            re_tests.end_of_input
         loop
            line_number := line_number + 1
            if comments_allowed and then re_tests.last_string.has_prefix(once "--") then
               if print_extra_info then
                  io.put_string(once "Warning line skipped (comment): ")
                  io.put_integer(line_number)
                  io.put_new_line
               end
            else
               substitute_new_lines(re_tests.last_string)
               build_one_test(re_tests.last_string)
               run_test
            end
            re_tests.read_line
         end
         re_tests.disconnect
      end

   substitute_new_lines (line: STRING)
      local
         pos: INTEGER
      do
         from
            pos := line.first_substring_index("\n")
         until
            pos = 0
         loop
            line.remove(pos)
            line.put('%N', pos)
            pos := line.first_substring_index("\n")
         end
      end

   build_one_test (line: STRING)
      local
         first, last, i: INTEGER
      do
         from
            i := line_elements.lower
            first := 1
         until
            i >= line_elements.upper
         loop
            last := line.index_of('%T', first)
            if last = 0 then
               last := line.count + 1
            end
            line_elements.item(i).clear_count
            line_elements.item(i).append_substring(line, first, last - 1)
            first := last + 1
            i := i + 1
         end
         line_elements.last.clear_count
         if first <= line.count then
            line_elements.last.append_substring(line, first, line.count)
         end
      end

   run_test
      local
         factory: REGULAR_EXPRESSION_BUILDER; reg_exp: REGULAR_EXPRESSION
      do
         if pattern.first = '%'' then
            pattern.remove_head(1)
            from
            until
               pattern.last = '%''
            loop
               inspect
                  pattern.last
               when 'i' then
                  factory.set_case_insensitive
               when 'x' then
                  factory.set_extended_legibility
               when 'm' then
                  factory.set_match_line_boundary
               when 's' then
                  factory.set_any_match_newline
               end
               pattern.remove_tail(1)
            end
            pattern.remove_tail(1)
         end
         reg_exp := factory.convert_perl_pattern(pattern)
         if reg_exp = Void then
            if not matching_result.is_equal(once "c") then
               if print_error then
                  io.put_string(once "Failed to understand pattern for line ")
                  io.put_integer(line_number)
                  io.put_new_line
                  io.put_string(once "%TError is : %"")
                  io.put_string(factory.last_error_message)
                  io.put_string(once "%"%N")
               end
               assert(False)
            else
               if print_extra_info then
                  if print_ok then
                     io.put_string(once "Ligne OK: ")
                     io.put_integer(line_number)
                     io.put_string(once "%Terror message: ")
                     io.put_string(factory.last_error_message)
                     io.put_new_line
                  end
               end
               assert(True)
            end
         else
            if matching_result.is_equal(once "c") then
               if print_error then
                  io.put_string(once "Undetected syntax error for pattern line ")
                  io.put_integer(line_number)
                  io.put_new_line
               end
               assert(False)
            elseif reg_exp.match(input_text) then
               if matching_result.is_equal(once "n") then
                  if print_error then
                     io.put_string(once "Wrong match success for input line ")
                     io.put_integer(line_number)
                     io.put_new_line
                  end
                  assert(False)
               else
                  eval_perl_function(function, function_result, reg_exp, input_text)
               end
            elseif matching_result.is_equal(once "y") then
               if print_error then
                  io.put_string(once "Wrong match failure for input line ")
                  io.put_integer(line_number)
                  io.put_new_line
               end
               assert(False)
            else
               if print_extra_info then
                  if print_ok then
                     io.put_string(once "Ligne OK: ")
                     io.put_integer(line_number)
                     io.put_new_line
                  end
               end
               assert(True)
            end
         end
      end

   eval_perl_function (perl_function, expected_result: STRING; reg_exp: REGULAR_EXPRESSION; text: STRING)
      local
         build_result, buffer: STRING; i: INTEGER
      do
         build_result := once ""
         build_result.copy(perl_function)
         buffer := once ""
         -- $&
         buffer.clear_count
         reg_exp.append_pattern_text(text, buffer)
         substitute(build_result, "$&", buffer)
         -- $i
         from
            i := reg_exp.group_count.max(9)
         until
            i < 1
         loop
            buffer.clear_count
            if i <= reg_exp.group_count and then reg_exp.ith_group_matched(i) then
               reg_exp.append_ith_group(text, buffer, i)
            end
            --memory leak
            substitute(build_result, once "$" + i.to_string, buffer)
            i := i - 1
         end
         -- $-[i]
         from
            i := 0
         until
            i > reg_exp.group_count
         loop
            --memory leak
            if reg_exp.ith_group_matched(i) then
               substitute(build_result, once "$-[" + i.to_string + once "]", (reg_exp.ith_group_first_index(i) - 1).to_string)
            else
               substitute(build_result, once "$-[" + i.to_string + once "]", once "")
            end
            i := i + 1
         end
         -- $+[0]
         from
            i := 0
         until
            i > reg_exp.group_count
         loop
            --memory leak
            if reg_exp.ith_group_matched(i) then
               substitute(build_result, once "$+[" + i.to_string + once "]", reg_exp.ith_group_last_index(i).to_string)
            else
               substitute(build_result, once "$+[" + i.to_string + once "]", once "")
            end
            i := i + 1
         end
         if not expected_result.is_equal(build_result) then
            if print_error then
               io.put_string(once "Error in function evaluation for input line ")
               io.put_integer(line_number)
               io.put_string("%N%TFunction is: %"")
               io.put_string(perl_function)
               io.put_string(once "%"%N%TExpected is: %"")
               io.put_string(expected_result)
               io.put_string(once "%"%N%TFound result is: %"")
               io.put_string(build_result)
               io.put_string(once "%"%N")
            end
            assert(False)
         else
            if print_ok then
               io.put_string(once "Ligne OK: ")
               io.put_integer(line_number)
               io.put_new_line
            end
            assert(True)
         end
      end

   substitute (text, search, replacement: STRING)
      local
         pos: INTEGER
      do
         pos := text.first_substring_index(search)
         if pos /= 0 then
            text.replace_substring(replacement, pos, pos + search.count - 1)
         end
      end

   line_number: INTEGER

   pattern, input_text, matching_result, function, function_result, comment: STRING

   line_elements: FAST_ARRAY[STRING]
      require
         pattern /= Void
      once
         Result := {FAST_ARRAY[STRING] << pattern, input_text, matching_result, function, function_result, comment >> }
      end

end -- class TEST_PERL_SYNTAX_01
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
