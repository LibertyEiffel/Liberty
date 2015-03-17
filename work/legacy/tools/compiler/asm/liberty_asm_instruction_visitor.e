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
deferred class LIBERTY_ASM_INSTRUCTION_VISITOR

inherit
   LIBERTY_ASM_VISITOR

feature {LIBERTY_ASM_INSTRUCTION}
   visit_and (a_instruction: LIBERTY_ASM_AND)
      require
         a_instruction /= Void
      deferred
      end

   visit_invoke (a_instruction: LIBERTY_ASM_INVOKE)
      require
         a_instruction /= Void
      deferred
      end

   visit_jump (a_instruction: LIBERTY_ASM_JUMP)
      require
         a_instruction /= Void
      deferred
      end

   visit_new (a_instruction: LIBERTY_ASM_NEW)
      require
         a_instruction /= Void
      deferred
      end

   visit_not (a_instruction: LIBERTY_ASM_NOT)
      require
         a_instruction /= Void
      deferred
      end

   visit_or (a_instruction: LIBERTY_ASM_OR)
      require
         a_instruction /= Void
      deferred
      end

   visit_return (a_instruction: LIBERTY_ASM_RETURN)
      require
         a_instruction /= Void
      deferred
      end

   visit_load_int (a_instruction: LIBERTY_ASM_LOAD_INT)
      require
         a_instruction /= Void
      deferred
      end

   visit_add_int (a_instruction: LIBERTY_ASM_ADD_INT)
      require
         a_instruction /= Void
      deferred
      end

   visit_sub_int (a_instruction: LIBERTY_ASM_SUB_INT)
      require
         a_instruction /= Void
      deferred
      end

   visit_mul_int (a_instruction: LIBERTY_ASM_MUL_INT)
      require
         a_instruction /= Void
      deferred
      end

   visit_div_int (a_instruction: LIBERTY_ASM_DIV_INT)
      require
         a_instruction /= Void
      deferred
      end

   visit_rem_int (a_instruction: LIBERTY_ASM_REM_INT)
      require
         a_instruction /= Void
      deferred
      end

   visit_call_native (a_instruction: LIBERTY_ASM_CALL_NATIVE)
      require
         a_instruction /= Void
      deferred
      end

end -- class LIBERTY_ASM_INSTRUCTION_VISITOR
