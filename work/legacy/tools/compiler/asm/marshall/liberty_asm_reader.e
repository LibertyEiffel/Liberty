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
class LIBERTY_ASM_READER

inherit
   LIBERTY_ASM_INSTRUCTION_VISITOR
   LIBERTY_ASM_PROXY_VISITOR

insert
   LIBERTY_ASM_CODES
   STRING_HANDLER

create {LIBERTY_ASM_MARSHALLER}
   read

feature {LIBERTY_ASM_MARSHALLER}
   system: LIBERTY_ASM_SYSTEM
   error: STRING

feature {}
   types_map: DICTIONARY[LIBERTY_ASM_TYPE, INTEGER]

   read (a_stream: INPUT_STREAM) is
      require
         a_stream /= Void
      local
         marker, method_id, type_id: INTEGER
      do
         marker := read_data(a_stream)
         if error = Void then
            if marker /= system_marker then
               set_bad_format("read: invalid system marker")
            else
               method_id := read_data(a_stream)
               if error = Void then
                  type_id := read_data(a_stream)
                  if error = Void then
                     from
                        create {HASHED_DICTIONARY[LIBERTY_ASM_TYPE, INTEGER]} types_map.make
                     until
                        a_stream.end_of_input or else error /= Void
                     loop
                        read_type(a_stream)
                     end
                     if error = Void then
                        resolve_all(a_stream, method_id, type_id)
                     end
                     if error /= Void then
                        types_map := Void
                     end
                  end
               end
            end
         end
      end

   read_type (a_stream: INPUT_STREAM) is
      require
         error = Void
         a_stream /= Void
      local
         marker, id, attributes_count, methods_count: INTEGER
         type: LIBERTY_ASM_TYPE
      do
         marker := read_data_eof(a_stream)
         if not a_stream.end_of_input then
            if marker /= type_marker then
               set_bad_format("read_type: invalid type marker")
            else
               id := read_data(a_stream)
               if error = Void then
                  if types_map.has(id) then
                     set_bad_format("read_type: duplicate type id " + id.out)
                  else
                     attributes_count := read_data(a_stream)
                     if error = Void then
                        if attributes_count < 0 then
                           set_bad_format("read_type: invalid negative attributes_count")
                        else
                           methods_count := read_data(a_stream)
                           if error = Void then
                              if methods_count < 0 then
                                 set_bad_format("read_type: invalid negative methods_count")
                              else
                                 create type.make(id, attributes_count)
                                 types_map.add(type, id)
                                 (1 |..| methods_count).do_all(agent read_method(a_stream, type))
                              end
                           end
                        end
                     end
                  end
               end
            end
         end
      end

   read_method (a_stream: INPUT_STREAM; a_type: LIBERTY_ASM_TYPE) is
      require
         a_stream /= Void
         a_type /= Void
      local
         marker, id, parameters_count: INTEGER
         flags: INTEGER_8
      do
         if error = Void then
            marker := read_data(a_stream)
            if marker /= method_marker then
               set_bad_format("read_method: invalid method marker")
            else
               id := read_data(a_stream)
               if error = Void then
                  parameters_count := read_data(a_stream)
                  if error = Void then
                     if parameters_count < 0 then
                        set_bad_format("read_method: invalid negative parameters_count")
                     else
                        flags := read_code(a_stream)
                        if error = Void then
                           create_method(a_stream, a_type, parameters_count, flags)
                        end
                     end
                  end
               end
            end
         end
      end

   create_method (a_stream: INPUT_STREAM; a_type: LIBERTY_ASM_TYPE; parameters_count: INTEGER; flags: INTEGER_8) is
      require
         error = Void
         a_stream /= Void
         a_type /= Void
         parameters_count >= 0
      local
         method: LIBERTY_ASM_METHOD
         code: LIBERTY_ASM_INSTRUCTION
      do
         code := read_instructions(a_stream)
         if error = Void then
            create method.make(a_type, code, create_parameters(parameters_count))
            if flags & flag_retry /= 0 and then error = Void then
               code := read_instructions(a_stream)
               if error = Void then
                  method.set_retry(code)
               end
            end
            if flags & flag_precondition /= 0 and then error = Void then
               code := read_instructions(a_stream)
               if error = Void then
                  method.set_precondition(code)
               end
            end
            if flags & flag_postcondition /= 0 and then error = Void then
               code := read_instructions(a_stream)
               if error = Void then
                  method.set_postcondition(code)
               end
            end
         end
      end

   create_parameters (count: INTEGER): COLLECTION[LIBERTY_ASM_PARAMETER] is
      require
         error = Void
         count >= 0
      local
         i: INTEGER
      do
         create {FAST_ARRAY[LIBERTY_ASM_PARAMETER]} Result.with_capacity(count)
         from
            i := 1
         until
            i > count
         loop
            Result.add_last(create {LIBERTY_ASM_PARAMETER}.make)
            i := i + 1
         end
      end

   read_instructions (a_stream: INPUT_STREAM): LIBERTY_ASM_INSTRUCTION is
      require
         error = Void
         a_stream /= Void
      local
         size: INTEGER
      do
         size := read_data(a_stream)
         if error = Void then
            if size < 0 then
               set_bad_format("read_instructions: invalid negative size")
            else
               Result := read_instructions_until(a_stream, size)
            end
         end
      end

   read_instructions_until (a_stream: INPUT_STREAM; size: INTEGER): LIBERTY_ASM_INSTRUCTION is
      require
         error = Void
         a_stream /= Void
         size >= 0
      local
         code: INTEGER_8; next: LIBERTY_ASM_INSTRUCTION
      do
         if size > 0 then
            code := read_code(a_stream)
            if error = Void then
               Result := create_instruction(a_stream, code)
               if error = Void then
                  next := read_instructions_until(a_stream, size - positions.sizeof(Result))
                  if error = Void and then next /= Void then
                     Result.set_next(next)
                  end
               end
            end
         end
      end

   create_instruction (a_stream: INPUT_STREAM; code: INTEGER_8): LIBERTY_ASM_INSTRUCTION is
      require
         error = Void
         a_stream /= Void
      do
         inspect
            code
         when asm_new then
            Result := create_new(a_stream)
         when asm_jump then
            Result := create_jump(a_stream)
         when asm_invoke then
            Result := create_invoke(a_stream)
         when asm_return then
            create {LIBERTY_ASM_RETURN} Result.make
         when asm_call_native then
            Result := create_call_native(a_stream)
         when asm_not then
            create {LIBERTY_ASM_NOT} Result.make
         when asm_and then
            create {LIBERTY_ASM_AND} Result.make
         when asm_or then
            create {LIBERTY_ASM_OR} Result.make
         when asm_load_int then
            Result := create_load_int(a_stream)
         when asm_add_int then
            create {LIBERTY_ASM_ADD_INT} Result.make
         when asm_sub_int then
            create {LIBERTY_ASM_SUB_INT} Result.make
         when asm_mul_int then
            create {LIBERTY_ASM_MUL_INT} Result.make
         when asm_div_int then
            create {LIBERTY_ASM_DIV_INT} Result.make
         when asm_rem_int then
            create {LIBERTY_ASM_REM_INT} Result.make
         else
            set_bad_format("create_instruction: invalid code 0x" + code.to_hexadecimal)
         end
      ensure
         Result = Void implies error /= Void
         Result /= Void implies Result.next = Void
      end

   create_new (a_stream: INPUT_STREAM): LIBERTY_ASM_INSTRUCTION_PROXY is
      require
         a_stream /= Void
      local
         type_id: INTEGER
      do
         type_id := read_data(a_stream)
         if error = Void then
            create Result.new(type_id)
         end
      ensure
         (Result = Void) /= (error = Void)
      end

   create_invoke (a_stream: INPUT_STREAM): LIBERTY_ASM_INSTRUCTION_PROXY is
      require
         a_stream /= Void
      local
         type_id, method_id: INTEGER
      do
         type_id := read_data(a_stream)
         if error = Void then
            method_id := read_data(a_stream)
            if error = Void then
               create Result.invoke(method_id, type_id)
            end
         end
      ensure
         (Result = Void) /= (error = Void)
      end

   create_call_native (a_stream: INPUT_STREAM): LIBERTY_ASM_CALL_NATIVE is
      require
         a_stream /= Void
      local
         symbol: FIXED_STRING
         arguments_count: INTEGER
         arguments: FAST_ARRAY[LIBERTY_ASM_NATIVE_VALUE]
         return: LIBERTY_ASM_NATIVE_VALUE
      do
         return := read_native(a_stream)
         if error = Void then
            symbol := read_string(a_stream)
            if error = Void then
               arguments_count := read_data(a_stream)
               if error = Void then
                  if arguments_count < 0 then
                     set_bad_format("create_call_native: invalid negative arguments_count")
                  else
                     create arguments.with_capacity(arguments_count)
                     (1 |..| arguments_count).do_all(agent put_native(a_stream, arguments))
                     if error = Void then
                        create Result.make(symbol, arguments, return)
                     end
                  end
               end
            end
         end
      ensure
         (Result = Void) /= (error = Void)
      end

   create_load_int (a_stream: INPUT_STREAM): LIBERTY_ASM_LOAD_INT is
      require
         a_stream /= Void
      local
         value: INTEGER
      do
         value := read_data(a_stream)
         if error = Void then
            create Result.make(value)
         end
      end

   put_native (a_stream: INPUT_STREAM; arguments: FAST_ARRAY[LIBERTY_ASM_NATIVE_VALUE]) is
      require
         a_stream /= Void
         arguments /= Void
      local
         argument: LIBERTY_ASM_NATIVE_VALUE
      do
         if error = Void then
            argument := read_native(a_stream)
            if error = Void then
               if argument = Void then
                  set_bad_format("put_native: invalid void argument")
               else
                  arguments.add_last(argument)
               end
            end
         end
      end

   read_string (a_stream: INPUT_STREAM): FIXED_STRING is
      require
         a_stream /= Void
      local
         count, i: INTEGER; char: INTEGER_8; string: STRING
      do
         count := read_data(a_stream)
         if error = Void then
            if count < 0 then
               set_bad_format("read_string: invalid negative count")
            else
               string := once ""
               string.clear_count
               string.ensure_capacity(count)
               from
                  i := 1
               until
                  error /= Void or else i > count
               loop
                  char := read_code(a_stream)
                  if error = Void then
                     string.add_last(char.to_character)
                  end
                  i := i + 1
               end
               if error = Void then
                  Result := string.intern
               end
            end
         end
      ensure
         (error = Void) /= (Result = Void)
      end

   read_native (a_stream: INPUT_STREAM): LIBERTY_ASM_NATIVE_VALUE is
      require
         a_stream /= Void
      local
         native_code: INTEGER_8
      do
         native_code := read_code(a_stream)
         if error = Void then
            inspect
               native_code
            when native_void then
               check
                  Result = Void
               end
            when native_integer then
               create Result.integer
            when native_pointer then
               create Result.pointer
            else
               set_bad_format("read_native: invalid native_code 0x" + native_code.to_hexadecimal)
            end
         end
      ensure
         error /= Void implies Result = Void
      end

   create_jump (a_stream: INPUT_STREAM): LIBERTY_ASM_INSTRUCTION_PROXY is
      require
         a_stream /= Void
      local
         position: INTEGER
      do
         position := read_data(a_stream)
         if error = Void then
            create Result.jump(position)
         end
      ensure
         (Result = Void) /= (error = Void)
      end

   read_code (a_stream: INPUT_STREAM): INTEGER_8 is
      require
         a_stream /= Void
         error = Void
      do
         Result := do_read_code(a_stream, False)
      end

   do_read_code (a_stream: INPUT_STREAM; allow_eof: BOOLEAN): INTEGER_8 is
      require
         a_stream /= Void
         error = Void
      do
         a_stream.read_character
         if a_stream.end_of_input then
            if not allow_eof then
               set_bad_format("read_code: unexpected end of input")
            end
         else
            Result := a_stream.last_character.to_integer_8
         end
      end

   read_data (a_stream: INPUT_STREAM): INTEGER is
      require
         a_stream /= Void
         error = Void
      do
         Result := do_read_data(a_stream, False)
      end

   read_data_eof (a_stream: INPUT_STREAM): INTEGER is
      require
         a_stream /= Void
         error = Void
      do
         Result := do_read_data(a_stream, True)
      end

   do_read_data (a_stream: INPUT_STREAM; allow_eof: BOOLEAN): INTEGER is
      require
         a_stream /= Void
         error = Void
      local
         a, b, c, d: INTEGER_8
      do
         a := do_read_code(a_stream, allow_eof)
         if error = Void and then not a_stream.end_of_input then
            b := read_code(a_stream)
            if error = Void then
               c := read_code(a_stream)
               if error = Void then
                  d := read_code(a_stream)
                  if error = Void then
                     Result := (a.to_integer_32 & 0x000000ff) | ((b.to_integer_32 & 0x000000ff) |<< 8) | ((c.to_integer_32 & 0x000000ff) |<< 16) | ((d.to_integer_32 & 0x000000ff) |<< 24)
                  end
               end
            end
         end
      end

feature {}
   resolve_all (a_stream: INPUT_STREAM; method_id, type_id: INTEGER) is
      local
         types_list: FAST_ARRAY[LIBERTY_ASM_TYPE]
         main_type: LIBERTY_ASM_TYPE
         main_method: LIBERTY_ASM_METHOD
      do
         create types_list.with_capacity(types_map.count)
         types_map.item_map_in(types_list)
         positions.set_positions(types_list)
         types_list.do_all(agent do_resolve_type)
         main_type := types_map.reference_at(type_id)
         if main_type = Void then
            set_bad_format("resolve_all: unknown main type")
         else
            main_method := main_type.resolve_method(method_id)
            if main_method = Void then
               set_bad_format("resolve_all: unknown main method")
            else
               create system.make(types_list, main_method)
            end
         end
      end

   do_resolve_type (a_type: LIBERTY_ASM_TYPE) is
      require
         a_type /= Void
      do
         a_type.do_all_methods(agent do_resolve_method)
      end

   do_resolve_method (a_method: LIBERTY_ASM_METHOD) is
      require
         a_method /= Void
      do
         a_method.set_code(resolve_code(a_method.code))
         a_method.set_retry(resolve_code(a_method.retry_code))
         a_method.set_precondition(resolve_code(a_method.precondition))
         a_method.set_postcondition(resolve_code(a_method.postcondition))
      end

   resolve_code (a_instruction: LIBERTY_ASM_INSTRUCTION): LIBERTY_ASM_INSTRUCTION is
      do
         if a_instruction /= Void then
            current_code := a_instruction
            Result := do_resolve_code(a_instruction)
         end
      end

   do_resolve_code (a_instruction: LIBERTY_ASM_INSTRUCTION): LIBERTY_ASM_INSTRUCTION is
      require
         a_instruction /= Void
      do
         current_instruction := a_instruction
         a_instruction.accept(Current)
         Result := resolved_instruction
         if a_instruction.next /= Void then
            Result.set_next(do_resolve_code(a_instruction.next))
         end
      end

   current_code: LIBERTY_ASM_INSTRUCTION
   current_instruction: LIBERTY_ASM_INSTRUCTION
   resolved_instruction: LIBERTY_ASM_INSTRUCTION

   resolve_target (position: INTEGER): LIBERTY_ASM_INSTRUCTION is
      do
         from
            if position >= current_instruction.position then
               Result := current_instruction
            else
               Result := current_code
            end
         until
            Result = Void or else Result.position >= position
         loop
            Result := Result.next
         end
         if Result = Void or else Result.position > position then
            set_bad_format("resolve_target: invalid position")
         else
            -- if the resolved target is itself a proxy, it must be resolved too
            Result.accept(Current)
            Result := resolved_instruction
         end
      ensure
         (error = Void) /= (Result = Void)
      end

feature {LIBERTY_ASM_INSTRUCTION}
   visit_and (a_instruction: LIBERTY_ASM_AND) is
      do
         resolved_instruction := a_instruction
      end

   visit_invoke (a_instruction: LIBERTY_ASM_INVOKE) is
      do
         resolved_instruction := a_instruction
      end

   visit_jump (a_instruction: LIBERTY_ASM_JUMP) is
      do
         resolved_instruction := a_instruction
      end

   visit_new (a_instruction: LIBERTY_ASM_NEW) is
      do
         resolved_instruction := a_instruction
      end

   visit_not (a_instruction: LIBERTY_ASM_NOT) is
      do
         resolved_instruction := a_instruction
      end

   visit_or (a_instruction: LIBERTY_ASM_OR) is
      do
         resolved_instruction := a_instruction
      end

   visit_return (a_instruction: LIBERTY_ASM_RETURN) is
      do
         resolved_instruction := a_instruction
      end

   visit_load_int (a_instruction: LIBERTY_ASM_LOAD_INT) is
      do
         resolved_instruction := a_instruction
      end

   visit_add_int (a_instruction: LIBERTY_ASM_ADD_INT) is
      do
         resolved_instruction := a_instruction
      end

   visit_sub_int (a_instruction: LIBERTY_ASM_SUB_INT) is
      do
         resolved_instruction := a_instruction
      end

   visit_mul_int (a_instruction: LIBERTY_ASM_MUL_INT) is
      do
         resolved_instruction := a_instruction
      end

   visit_div_int (a_instruction: LIBERTY_ASM_DIV_INT) is
      do
         resolved_instruction := a_instruction
      end

   visit_rem_int (a_instruction: LIBERTY_ASM_REM_INT) is
      do
         resolved_instruction := a_instruction
      end

   visit_call_native (a_instruction: LIBERTY_ASM_CALL_NATIVE) is
      do
         resolved_instruction := a_instruction
      end

feature {LIBERTY_ASM_INSTRUCTION_PROXY}
   visit_proxy_new (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; type_id: INTEGER) is
      local
         type: LIBERTY_ASM_TYPE
      do
         type := types_map.reference_at(type_id)
         if type = Void then
            set_bad_format("visit_proxy_new: unknown type")
         else
            create {LIBERTY_ASM_NEW} resolved_instruction.make(type)
            resolved_instruction.set_position(a_instruction.position)
         end
      end

   visit_proxy_invoke (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; method_id, type_id: INTEGER) is
      local
         type: LIBERTY_ASM_TYPE
         method: LIBERTY_ASM_METHOD
      do
         type := types_map.reference_at(type_id)
         if type = Void then
            set_bad_format("visit_proxy_invoke: unknown type")
         else
            method := type.resolve_method(method_id)
            if method = Void then
               set_bad_format("visit_proxy_invoke: unknown method")
            end
            create {LIBERTY_ASM_INVOKE} resolved_instruction.make(method)
            resolved_instruction.set_position(a_instruction.position)
         end
      end

   visit_proxy_jump (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; position: INTEGER) is
      local
         target: LIBERTY_ASM_INSTRUCTION
      do
         target := resolve_target(position)
         if target /= Void then
            create {LIBERTY_ASM_JUMP} resolved_instruction.set_target(target)
            resolved_instruction.set_position(a_instruction.position)
         end
      end

feature {}
   error_bad_format: STRING is "Bad data format in "

   set_bad_format (where: STRING) is
      do
         error := error_bad_format + where
         sedb_breakpoint
      end

invariant
   types_map = Void implies error /= Void

end -- class LIBERTY_ASM_READER
