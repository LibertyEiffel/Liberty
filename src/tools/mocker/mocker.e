-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCKER
   --
   -- A mock builder.
   --

insert
   LOGGING
   LIBERTY_VERSION

create {}
   make

feature {ANY}
   liberty_authors: STRING is "C.ADRIAN"
   liberty_dates: STRING is "2013"

feature {}
   input, out_mock, out_expect: REGULAR_FILE

   generate_mocks is
      require
         input.exists
         not out_mock.exists
         not out_expect.exists
      local
         grammar: EIFFEL_GRAMMAR
         parser: DESCENDING_PARSER
         file_content: STRING
         buffer: MINI_PARSER_BUFFER
      do
         create grammar.make_default
         create parser.make

         file_content := ""
         from
            input.read.read_line
         until
            input.read.end_of_input
         loop
            file_content.append(input.read.last_string)
            file_content.extend('%N')
            input.read.read_line
         end
         file_content.append(input.read.last_string)
         create buffer.initialize_with(file_content)

         if not parser.eval(buffer, grammar.table, "Class") then
            std_error.put_line("Incomplete input")
            die_with_code(1)
         elseif parser.error /= Void then
            std_error.put_line(parser.error.message)
            die_with_code(1)
         elseif grammar.root_node = Void then
            std_error.put_line("Invalid input")
            die_with_code(1)
         end

         std_output.put_line(once "Writing mock class: #(1)" # out_mock.path)
         grammar.root_node.accept(create {MOCKER_MOCK}.make(out_mock.write, classname(out_mock), classname(out_expect)))
         out_mock.write.disconnect

         std_output.put_line(once "Writing expect class: #(1)" # out_expect.path)
         grammar.root_node.accept(create {MOCKER_EXPECT}.make(out_expect.write, classname(out_mock), classname(out_expect)))
         out_expect.write.disconnect

         std_output.put_line(once "Done.")
      ensure
         out_mock.exists
         out_expect.exists
      end

   classname (file: REGULAR_FILE): STRING is
      require
         file.name.has_suffix(once ".e")
      do
         Result := file.name.substring(file.name.lower, file.name.upper - 2).as_upper
      end

   check_output (type: STRING; option: COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE]): REGULAR_FILE is
      require
         input /= Void
         type /= Void
      local
         bd: BASIC_DIRECTORY
         name: ABSTRACT_STRING
      do
         if option.is_set then
            Result := option.item

            if not Result.name.has_suffix(".e") then
               std_error.put_line("#(1) file does not have the right suffix (expect *.e): #(2)" # type # Result.path)
               die_with_code(1)
            end

            if Result.exists then
               std_error.put_line("#(1) file does exist: #(2)" # type # Result.path)
               die_with_code(1)
            end
         else
            name := (once "#(1)_#(2).e" # input.name.substring(input.name.lower, input.name.upper - 2) # type).as_lower
            if input.parent = Void then
               bd.compute_absolute_file_path_with(name)
            else
               bd.compute_file_path_with(input.parent.path, name)
            end
            create Result.make(bd.last_entry)
         end
      ensure
         Result /= Void
      end

   make is
      do
         if not arguments.parse_command_line then
            arguments.usage(std_error)
            die_with_code(1)
         elseif option_help.is_set then
            arguments.usage(std_output)
            die_with_code(0)
         elseif option_version.is_set then
            print_version
            die_with_code(0)
         elseif not argument_file.is_set then
            arguments.usage(std_error)
            die_with_code(1)
         end

         input := argument_file.item

         if not input.name.has_suffix(".e") then
            std_error.put_line("File does not have the right suffix (expect *.e): #(1)" # input.path)
            die_with_code(1)
         end

         if not input.exists then
            std_error.put_line("File does not exist: #(1)" # input.path)
            die_with_code(1)
         end

         out_mock := check_output("Mock", option_out_mock)
         out_expect := check_output("Expect", option_out_expect)

         generate_mocks
      end

   arguments: COMMAND_LINE_ARGUMENTS is
      once
         create Result.make(option_help or option_version or (option_out_mock and option_out_expect and argument_file))
      end

   option_help: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN] is
      once
         Result := cli_factory.option_boolean("h", "help", "Command usage")
      end

   option_version: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN] is
      once
         Result := cli_factory.option_boolean("v", "version", "Command version")
      end

   option_out_mock: COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
      once
         Result := cli_factory.option_file("m", "mock", "out_mock", "Mock file to generate (also implies the mock class name)")
      end

   option_out_expect: COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
      once
         Result := cli_factory.option_file("e", "expect", "out_expect", "Expect file to generate (also implies the expect class name)")
      end

   argument_file: COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
      once
         Result := cli_factory.positional_file("classfile.e", "The file containing the class to mock")
      end

   cli_factory: COMMAND_LINE_ARGUMENT_FACTORY

end -- class MOCKER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2013: Cyril ADRIAN
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
-- ------------------------------------------------------------------------------------------------------------------------------
