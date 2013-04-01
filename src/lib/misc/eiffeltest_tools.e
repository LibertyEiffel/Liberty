-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class EIFFELTEST_TOOLS
   --
   -- Just insert class EIFFELTEST_TOOLS in your TEST_* class.
   -- See also command `eiffeltest'.
   --

feature {ANY}
   when_test_fails (what_to_do: PROCEDURE[TUPLE[INTEGER, ABSTRACT_STRING, ABSTRACT_STRING, ABSTRACT_STRING]]) is
      require
         what_to_do /= Void
      do
         test_failed.set_item(what_to_do)
      ensure
         test_failed.item = what_to_do
      end

feature {}
   assert (test: BOOLEAN) is
         -- Check that `test' is actually True. If `test' is True, nothing happens except that the
         -- `assert_counter' is incremented by one. When `test' is False, an error message is printed
         -- on `std_output'; a `breakpoint' allow you to find out what is going wrong
         -- (assuming you are using the -sedb debugger); and the program exits with a non-zero status.
         --
         -- Note: you may change that default behaviour by calling `when_test_fails'.
      do
         message_assert(counter_to_message, test)
      end

   label_assert (label: ABSTRACT_STRING; test: BOOLEAN) is
         -- Check that `test' is actually True. If `test' is True, nothing happens except that the
         -- `assert_counter' is incremented by one. When `test' is False, the label is printed
         -- on `std_output'; a `breakpoint' allow you to find out what is going wrong
         -- (assuming you are using the -sedb debugger); and the program exits with a non-zero status.
         --
         -- Note: you may change that default behaviour by calling `when_test_fails'.
      require
         not test implies label /= Void
      do
         message_assert(agent label_to_message(label), test)
      end

   message_assert (message_generator: FUNCTION[TUPLE, ABSTRACT_STRING]; test: BOOLEAN) is
         -- Check that `test' is actually True. If `test' is True, nothing happens except that the
         -- `assert_counter' is incremented by one. When `test' is False, the generated message is printed
         -- on `std_output'; a `breakpoint' allow you to find out what is going wrong
         -- (assuming you are using the -sedb debugger); and the program exits with a non-zero status.
         --
         -- Note: you may change that default behaviour by calling `when_test_fails'.
      require
         not test implies message_generator /= Void
      local
         actual_label: ABSTRACT_STRING
      do
         assert_counter.next
         if not test then
            actual_label := message_generator.item([])
            test_failed.item.call([assert_counter.item, actual_label, generator, assertion_flag])
         end
      end

   assert_counter: COUNTER is
         -- Unique once COUNTER used to count `assert' calls.
      once
         create Result
      end

   assertion_flag: STRING is
      do
         Current.probe_assertion_level -- call via the explicit "Current" target to force invariant check.
         inspect
            assertion_level
         when assertion_level_check then
            Result := once "all_check"
         when assertion_level_loop_invariant then
            Result := once "loop_check"
         when assertion_level_class_invariant then
            Result := once "invariant_check"
         when assertion_level_ensure then
            Result := once "ensure_check"
         when assertion_level_require then
            Result := once "require_check"
         else
            Result := once "no_check or boost"
         end
      end

   assertion_level: INTEGER
   assertion_level_none: INTEGER is 0
   assertion_level_require: INTEGER is 1
   assertion_level_ensure: INTEGER is 2
   assertion_level_class_invariant: INTEGER is 3
   assertion_level_loop_invariant: INTEGER is 4
   assertion_level_check: INTEGER is 5

   set_require: BOOLEAN is
      do
         assertion_level := assertion_level.max(assertion_level_require)
         Result := True
      end

   set_loop_invariant: BOOLEAN is
      do
         assertion_level := assertion_level.max(assertion_level_loop_invariant)
         Result := True
      end

   set_check: BOOLEAN is
      do
         assertion_level := assertion_level.max(assertion_level_check)
         Result := True
      end

   set_ensure: BOOLEAN is
      do
         assertion_level := assertion_level.max(assertion_level_ensure)
         Result := True
      end

   set_class_invariant: BOOLEAN is
      do
         assertion_level := assertion_level.max(assertion_level_class_invariant)
         Result := True
      end

feature {EIFFELTEST_TOOLS}
   probe_assertion_level is
      require
         set_require
      do
         from
         invariant
            set_loop_invariant
         until
            True
         loop
         end
         check
            set_check
         end
      ensure
         set_ensure
      end

feature {}
   test_failed: REFERENCE[PROCEDURE[TUPLE[INTEGER, ABSTRACT_STRING, ABSTRACT_STRING, ABSTRACT_STRING]]] is
      once
         create Result.set_item(agent default_test_failed)
      end

   default_test_failed (id: INTEGER; lbl, gen, ass_flag: ABSTRACT_STRING) is
      require
         lbl /= Void
         gen /= Void
         ass_flag /= Void
      do
         std_output.put_line(once "[
                                   ERROR: (label_)assert call #(1) in class #(2) failed.
                                   Rerun this test under the -sedb debugger to find out what is going wrong.
                                   Assertion level was #(3).
                                   ]" # lbl # gen # ass_flag)
         sedb_breakpoint
         die_with_code(1)
      end

   counter_to_message: FUNCTION[TUPLE, ABSTRACT_STRING] is
      once
         Result := agent count_to_message
      end

   count_to_message: ABSTRACT_STRING is
      do
         Result := "number #(1)" # &assert_counter.item
      end

   label_to_message (label: ABSTRACT_STRING): ABSTRACT_STRING is
      require
         label /= Void
      do
         Result := label
      ensure
         Result = label
      end

invariant
   set_class_invariant
   test_failed.item /= Void

end -- class EIFFELTEST_TOOLS
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
