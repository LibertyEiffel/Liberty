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
class LIBERTY_INTERPRETER_ASSERTION_CHECKER

inherit
   LIBERTY_ASSERTION_VISITOR

create {LIBERTY_INTERPRETER}
   make

feature {LIBERTY_INTERPRETER_FEATURE_CALL, LIBERTY_INTERPRETER_INSTRUCTIONS}
   validate (contract: LIBERTY_ASSERTIONS; error_message: ABSTRACT_STRING) is
      do
         failed_tag := Void
         if contract /= Void then
            contract.accept(Current)
            if failed_tag /= Void then
               interpreter.fatal_error(error_message + " failed: " + failed_tag, failed_position)
            end
         end
      end

feature {LIBERTY_ASSERTIONS_AND_THEN}
   visit_liberty_assertions_and_then (v: LIBERTY_ASSERTIONS_AND_THEN) is
      do
         v.left.accept(Current)
         if failed_tag = Void then
            v.right.accept(Current)
         end
      end

feature {LIBERTY_ASSERTIONS_OR_ELSE}
   visit_liberty_assertions_or_else (v: LIBERTY_ASSERTIONS_OR_ELSE) is
      local
         tag_left: FIXED_STRING
      do
         v.left.accept(Current)
         if failed_tag /= Void then
            tag_left := failed_tag
            v.right.accept(Current)
            if failed_tag /= Void then
               failed_tag := tag_left
            end
         end
      end

feature {LIBERTY_CHECK}
   visit_liberty_check (v: LIBERTY_CHECK) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_ENSURE}
   visit_liberty_ensure (v: LIBERTY_ENSURE) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_ENSURE_THEN}
   visit_liberty_ensure_then (v: LIBERTY_ENSURE_THEN) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_INVARIANT}
   visit_liberty_invariant (v: LIBERTY_INVARIANT) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_REQUIRE}
   visit_liberty_require (v: LIBERTY_REQUIRE) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_REQUIRE_ELSE}
   visit_liberty_require_else (v: LIBERTY_REQUIRE_ELSE) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_REQUIRE_THEN}
   visit_liberty_require_then (v: LIBERTY_REQUIRE_THEN) is
      do
         check_written_assertions(v)
      end

feature {LIBERTY_VARIANT}
   visit_liberty_variant (v: LIBERTY_VARIANT) is
      do
         check False end
      end

feature {}
   check_written_assertions (contract: LIBERTY_WRITTEN_ASSERTIONS) is
      local
         assertions: TRAVERSABLE[LIBERTY_ASSERTION]
         assertion: LIBERTY_ASSERTION
         assertion_value: LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]
         i: INTEGER
      do
         failed_tag := Void
         assertions := contract.assertions
         if not assertions.is_empty then
            interpreter.evaluate_feature_parameters
            from
               i := assertions.lower
            until
               failed_tag /= Void or else i > assertions.upper
            loop
               assertion := assertions.item(i)
               assertion.assertion.accept(interpreter.expressions)
               assertion_value ::= interpreter.expressions.eval_memory
               if not assertion_value.item then
                  failed_tag := assertion.tag
                  failed_position := assertion.assertion.position
               end
               i := i + 1
            end
         end
      end

feature {}
   make (a_interpreter: like interpreter) is
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
      ensure
         interpreter = a_interpreter
      end

   interpreter: LIBERTY_INTERPRETER
   failed_tag: FIXED_STRING
   failed_position: LIBERTY_POSITION

invariant
   interpreter /= Void

end -- class LIBERTY_INTERPRETER_ASSERTION_CHECKER
