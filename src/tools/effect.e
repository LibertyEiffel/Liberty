-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EFFECT
   --
   -- A parser builder.
   --

create {}
   make

feature {}
   generate (name: FIXED_STRING; input: INPUT_STREAM) is
      do
         io.put_line("generate #(1)" # name)
      end

feature {}
   make is
      local
         input: REGULAR_FILE
      do
         if not arguments.parse_command_line then
            arguments.usage(std_error)
            die_with_code(1)
         elseif option_help.is_set then
            arguments.usage(std_output)
            die_with_code(0)
         elseif not arguments.parse_command_line or else not argument_file.is_set then
            arguments.usage(std_error)
            die_with_code(1)
         end

         input := argument_file.item

         if not input.name.has_suffix(".ef") then
            std_error.put_line("File does not have the right suffix (expect *.ef): #(1)" # input.path)
            die_with_code(1)
         end

         if not input.exists then
            std_error.put_line("File does not exist: #(1)" # input.path)
            die_with_code(1)
         end

         generate(input.name.substring(input.name.lower, input.name.upper - 3), input.read)
         input.read.disconnect
      end

   arguments: COMMAND_LINE_ARGUMENTS is
      once
         create Result.make(option_help or argument_file)
      end

   argument_file: COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
      once
         Result := cli_factory.positional_file("grammar.ef", "The file containing the grammar (*.ef files)")
      end

   option_help: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN] is
      once
         Result := cli_factory.option_boolean("h", "help", "Command usage")
      end

   cli_factory: COMMAND_LINE_ARGUMENT_FACTORY

end -- class EFFECT
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
