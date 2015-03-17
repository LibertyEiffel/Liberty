class TEST01

insert
   EIFFELTEST_TOOLS
   LIBERTY_ASM_MARSHALLER

create {}
   make

feature {}
   make
      local
         system: LIBERTY_ASM_SYSTEM
         type: LIBERTY_ASM_TYPE
         method: LIBERTY_ASM_METHOD
         load_1, load_2: LIBERTY_ASM_LOAD_INT
         add: LIBERTY_ASM_ADD_INT
         return: LIBERTY_ASM_RETURN

         string: STRING
         string_input: STRING_INPUT_STREAM
         string_output: STRING_OUTPUT_STREAM

         read_system: TUPLE[LIBERTY_ASM_SYSTEM, FIXED_STRING]
      do
         create type.make(1, 0)
         create load_1.make(1)
         create load_2.make(2)
         load_1.set_next(load_2)
         create add.make
         load_2.set_next(add)
         create return.make
         add.set_next(return)
         create method.make(type, load_1, create {FAST_ARRAY[LIBERTY_ASM_PARAMETER]}.make(0))
         create system.make({FAST_ARRAY[LIBERTY_ASM_TYPE] << type >>}, method)

         string := ""
         create string_output.connect_to(string)
         write(string_output, system)

         create string_input.from_string(string)
         read_system := read(string_input)

         if read_system.second /= Void then
            std_error.put_string("*** ")
            std_error.put_line(read_system.second)
         end

         assert(read_system.first /= Void)
         assert(read_system.first.is_equal(system))
      end

end
