-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCKER
   --
   -- A mock builder.
   --

insert
   LOGGING

create {}
   make

feature {}
   canonical_output (input: REGULAR_FILE): REGULAR_FILE is
      require
         input /= Void
      local
         bd: BASIC_DIRECTORY
         name: ABSTRACT_STRING
      do
         name := "#(1)_mock.e" # input.name.substring(input.name.lower, input.name.upper - 2)
         if input.parent = Void then
            bd.compute_absolute_file_path_with(name)
         else
            bd.compute_file_path_with(input.parent.path, name)
         end
         create Result.make(bd.last_entry)
      ensure
         Result /= Void
      end

   make is
      local
         input: REGULAR_FILE
         output: REGULAR_FILE
      do
         if not arguments.parse_command_line then
            arguments.usage(std_error)
            die_with_code(1)
         elseif option_help.is_set then
            arguments.usage(std_output)
            die_with_code(0)
         elseif option_version.is_set then
            std_output.put_line(once "mocker 2013.02 (C) Cyril ADRIAN <cyril.adrian@gmail.com>")
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

         if option_out.is_set then
            output := option_out.item

            if not output.name.has_suffix(".e") then
               std_error.put_line("Output file does not have the right suffix (expect *.e): #(1)" # output.path)
               die_with_code(1)
            end

            if output.exists then
               std_error.put_line("Output file does exist: #(1)" # output.path)
               die_with_code(1)
            end
         else
            output := canonical_output(input)
         end

         std_output.put_line("output is #(1)" # output.path)
      end

   arguments: COMMAND_LINE_ARGUMENTS is
      once
         create Result.make(option_help or option_version or (option_out and argument_file))
      end

   option_help: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN] is
      once
         Result := cli_factory.option_boolean("h", "help", "Command usage")
      end

   option_version: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN] is
      once
         Result := cli_factory.option_boolean("v", "version", "Command version")
      end

   option_out: COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
      once
         Result := cli_factory.option_file("o", "out", "out_file", "Output file (also implies the mock class name)")
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
