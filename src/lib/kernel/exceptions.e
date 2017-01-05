-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class EXCEPTIONS
   --
   -- Facilities for adapting the exception handling mechanism.
   --

feature {ANY} -- Various exceptions codes:
   Check_instruction: INTEGER 1
         -- Exception code for violated check.

   Class_invariant: INTEGER 2
         -- Exception code for violated class invariant.

   Developer_exception: INTEGER 3
         -- Exception code for developer exception.
         -- See also: `raise', `throw'

   Incorrect_inspect_value: INTEGER 4
         -- Exception code for inspect statement. This exception occurs when Void is passed as the expression
         -- to inspect ("inspect on STRING only).
         -- This exception also occurs when the inspected value selects no branch (when the keyword "else"
         -- not used, one "when" branch _must_ be selected).  Some value which is not one of the inspect
         -- constants, if there is no Else_part

   Loop_invariant: INTEGER 5
         -- Exception code for violated loop invariant

   Loop_variant: INTEGER 6
         -- Exception code for non-decreased loop variant

   No_more_memory: INTEGER 7
         -- Exception code for failed memory allocation

   Postcondition: INTEGER 8
         -- Exception code for violated postcondition.

   Precondition: INTEGER 9
         -- Exception code for violated precondition.

   Routine_failure: INTEGER 10
         -- Exception code for failed routine.

   Os_signal: INTEGER 11
         -- Exception code for a signal received from the OS.

   Void_attached_to_expanded: INTEGER 12
         -- Exception code for attachment of Void value to expanded entity.

   Void_call_target: INTEGER 13
         -- Exception code for feature applied to Void reference

   System_level_type_error: INTEGER 14
         -- Exception code for the system-level type error (this kind of error mostly arise with covariant
         -- redefinition).

   exception_name: STRING
      do
         Result := name_of_exception(exception)
      end

   name_of_exception (a_exception: INTEGER): STRING
      do
         inspect
            a_exception
         when Check_instruction then
            Result := once "Check_instruction"
         when Class_invariant then
            Result := once "Class_invariant"
         when Developer_exception then
            Result := once "Developer_exception"
         when Incorrect_inspect_value then
            Result := once "Incorrect_inspect_value"
         when Loop_invariant then
            Result := once "Loop_invariant"
         when Loop_variant then
            Result := once "Loop_variant"
         when No_more_memory then
            Result := once "No_more_memory"
         when Postcondition then
            Result := once "Postcondition"
         when Precondition then
            Result := once "Precondition"
         when Routine_failure then
            Result := once "Routine_failure"
         when Os_signal then
            Result := once "Os_signal"
         when Void_attached_to_expanded then
            Result := once "Void_attached_to_expanded"
         when Void_call_target then
            Result := once "Void_call_target"
         when System_level_type_error then
            Result := once "System_level_type_error"
         end
      end

feature {ANY}
   developer_exception: EXCEPTION
         -- The last developer-thrown exception.
      require
         applicable: is_developer_exception
      do
         Result := developer_exception_memory.item
      end

   developer_exception_name: STRING
         -- Name of last developer-raised exception.
      require
         applicable: is_developer_named_exception
      do
         Result := named_exception.name
      end

   is_developer_exception: BOOLEAN
         -- Is the last exception originally due to a developer exception?
      do
         Result := exception = Developer_exception
      end

   is_developer_named_exception: BOOLEAN
         -- Is the last exception originally due to a developer exception?
      do
         Result := exception = Developer_exception and then developer_exception_memory.item = named_exception
      end

   is_developer_exception_of_name (name: STRING): BOOLEAN
         -- Is the last exception originally due to a developer exception of name `name'?
      do
         if is_developer_exception then
            Result := name.is_equal(developer_exception_name)
         end
      end

feature {ANY} -- Status report:
   assertion_violation: BOOLEAN
         -- Is last exception originally due to a violated assertion or non-decreasing variant?
      do
         inspect
            exception
         when Check_instruction, Class_invariant, Loop_invariant, Loop_variant, Postcondition, Precondition then
            Result := True
         else
         end
      end

   exception: INTEGER
         -- Code of last exception that occurred.
      external "built_in"
      end

   is_signal: BOOLEAN
         -- Is last exception originally due to an external event (operating system signal) ?
      do
         Result := signal_number /= 0
      end

feature {ANY} -- Basic operations:
   die (code: INTEGER)
         -- Terminate execution with exit status code, without triggering an exception.
      do
         die_with_code(code)
      end

   raise (name: STRING)
         -- Raise a developer exception of name `name'.
      require
         name /= Void
      do
         named_exception.set_name(name)
         throw(named_exception)
      end

   throw (a_exception: EXCEPTION)
      require
         a_exception /= Void
      do
         developer_exception_memory.set_item(a_exception)
         raise_exception(Developer_exception)
      end

feature {ANY} -- Non-Standard Extensions:
   signal_number: INTEGER
         -- Signal Number received from OS.  Zero if exception is not an OS signal.
      external "built_in"
      end

feature {}
   named_exception: NAMED_EXCEPTION
      once
         create Result.make
      end

   developer_exception_memory: REFERENCE[EXCEPTION]
      once
         create Result
      end

   raise_exception (code: INTEGER)
      external "built_in"
      end

end -- class EXCEPTIONS
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
