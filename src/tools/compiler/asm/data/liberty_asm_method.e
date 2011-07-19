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
class LIBERTY_ASM_METHOD

insert
   SAFE_EQUAL[LIBERTY_ASM_INSTRUCTION]
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   id: INTEGER
   type: LIBERTY_ASM_TYPE

   code: LIBERTY_ASM_INSTRUCTION
   code_size: INTEGER

   retry_code: LIBERTY_ASM_INSTRUCTION
   retry_size: INTEGER

   precondition: LIBERTY_ASM_INSTRUCTION
   precondition_size: INTEGER

   postcondition: LIBERTY_ASM_INSTRUCTION
   postcondition_size: INTEGER

   parameters: COLLECTION[LIBERTY_ASM_PARAMETER]

   is_equal (other: like Current): BOOLEAN is
      do
         Result := id = other.id and then type.id = other.type.id -- don't check type.is_equal because it would incur an infinite recursion
            and then parameters.is_equal(other.parameters)
            and then safe_equal(code, other.code)
            and then safe_equal(retry_code, other.retry_code)
            and then safe_equal(precondition, other.precondition)
            and then safe_equal(postcondition, other.postcondition)
      end

   set_code (a_code: like code) is
      require
         a_code /= Void
      do
         code := a_code
      ensure
         code = a_code
      end

   set_code_size (a_code_size: like code_size) is
      require
         code_size = 0
         a_code_size > 0
      do
         code_size := a_code_size
      ensure
         code_size = a_code_size
      end

   set_retry (a_retry: like retry_code) is
      require
         retry_code /= Void implies a_retry /= Void
      do
         retry_code := a_retry
      ensure
         retry_code = a_retry
      end

   set_retry_size (a_retry_size: like retry_size) is
      require
         a_retry_size > 0
         retry_code /= Void
      do
         retry_size := a_retry_size
      ensure
         retry_size = a_retry_size
      end

   set_precondition (a_precondition: like precondition) is
      require
         precondition /= Void implies a_precondition /= Void
      do
         precondition := a_precondition
      ensure
         precondition = a_precondition
      end

   set_precondition_size (a_precondition_size: like precondition_size) is
      require
         a_precondition_size > 0
         precondition /= Void
      do
         precondition_size := a_precondition_size
      ensure
         precondition_size = a_precondition_size
      end

   set_postcondition (a_postcondition: like postcondition) is
      require
         postcondition /= Void implies a_postcondition /= Void
      do
         postcondition := a_postcondition
      ensure
         postcondition = a_postcondition
      end

   set_postcondition_size (a_postcondition_size: like postcondition_size) is
      require
         a_postcondition_size > 0
         postcondition /= Void
      do
         postcondition_size := a_postcondition_size
      ensure
         postcondition_size = a_postcondition_size
      end

feature {}
   make (a_type: like type; a_code: like code; a_parameters: like parameters) is
      require
         a_type /= Void
         a_code /= Void
         a_parameters /= Void
      do
         type := a_type
         code := a_code
         parameters := a_parameters
         id := type.add_method(Current)
      ensure
         type = a_type
         type.has_method(Current)
         code = a_code
         parameters = a_parameters
      end

invariant
   type /= Void
   code /= Void
   parameters /= Void

end -- class LIBERTY_ASM_METHOD
