class PRINT_ARGUMENTS
   --
   -- Example of access to command-line arguments. This example display its arguments.
   --

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   make
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > argument_count
         loop
            std_output.put_string(argument(i))
            std_output.put_character(' ')
            i := i + 1
         end
         std_output.put_character('%N')
      end

end -- class PRINT_ARGUMENTS
