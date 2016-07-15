-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FINDER
   --
   -- The `finder' command.
   --

inherit
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "finder"

   command_line_help_summary: STRING "[
      Usage: finder [options] <ClassName>
         or: finder [options] <ACEfileName>.ace <ClassName>

      Find a class file in the file system.

      The finder command tells you where the class <ClassName> is by printing the
      complete path of the corresponding file.  Hint: to see the search path used,
      just run finder with the -verbose flag and some non-existent class name.

      This command may also be useful in shell scripts to check if the source file
      exists. (Use the exit status.)

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing
        -raw                Do not display the cluster name

      Class lookup:
        -loadpath <file>    Specify an extra loadpath file to read

      ]"

feature {}
   make
      local
         argi, argc, i: INTEGER; arg, search_key: STRING; ace_mode, raw: BOOLEAN
         ct: CLASS_TEXT; class_texts: FAST_ARRAY[CLASS_TEXT]
      do
         argc := argument_count
         if argc = 0 then
            fatal_bad_usage
         end
         search_for_verbose_flag
         ace_mode := ace_file_mode
         from
            argi := 1
         until
            argi > argc
         loop
            arg := argument(argi)
            if ace.file_path /= Void and then arg.is_equal(ace.file_path) then
            elseif search_key /= Void then
               fatal_bad_usage
            elseif flag_match(fz_loadpath, arg) then
               if argi < argc then
                  system_tools.add_loadpath_file(argument(argi + 1))
                  argi := argi + 1
               else
                  echo.w_put_string(command_line_name)
                  echo.w_put_string(once ": missing loadpath file path after -loadpath flag.%N")
                  die_with_code(exit_failure_code)
               end
            elseif is_raw_flag(arg) then
               raw := True
            elseif is_some_flag(arg) then
               if is_valid_argument_for_ace_mode(arg) then
               end
            else
               search_key := arg
               ace.set_root_class_name_using(arg)
            end
            argi := argi + 1
         end
         if ace.file_path = Void then
            ace.command_line_parsed(command_line_name)
         end
         if search_key = Void then
            fatal_bad_usage
         end
         class_texts := smart_eiffel.find_paths_for(ace.root_class_name)
         if class_texts.is_empty then
            std_error.put_string("No file found for %"")
            std_error.put_string(search_key)
            std_error.put_string("%".%N")
            die_with_code(exit_failure_code)
         else
            from
               i := class_texts.lower
            until
               i > class_texts.upper
            loop
               ct := class_texts.item(i)
               std_output.put_string(ct.path)
               if not raw then
                  std_output.put_string(once " (class ")
                  std_output.put_string(ct.name.to_string)
                  std_output.put_string(once " in cluster %"")
                  std_output.put_string(ct.cluster.name)
                  std_output.put_string(once "%")")
               end
               std_output.put_new_line
               i := i + 1
            end
         end
      end

   is_raw_flag (flag: STRING): BOOLEAN
      do
         if flag_match(once "raw", flag) then
            Result := True
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         if is_some_flag(arg) then
            Result := is_verbose_flag(arg)
               or else is_version_flag(arg)
               or else is_help_flag(arg)
               or else is_raw_flag(arg)
         else
            Result := True
         end
      end

   valid_argument_for_ace_mode: STRING "Only the -verbose, -version, -help, and -raw flags are allowed in ACE file%N%
      %mode.%N"

end -- class FINDER
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
