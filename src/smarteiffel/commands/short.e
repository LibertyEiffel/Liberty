-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SHORT
   --
   -- The `short' command.
   --

inherit
   CLASS_CHECKER

create {}
   make

feature {ANY}
   command_line_name: STRING "short"

   command_line_help_summary: STRING "[
      Usage: short [format] [options] <ClassName>
         or: short [format] [options] <ACEfileName>.ace <ClassName>

      Display the interface/contract view of a class.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      Warning levels:
        -style_warning      Print warnings about style violations
        -no_warning         Don't print any warnings

        -sort               Sort features alphabetically
        -short              Don't include inherited features

      Message styles:
        -flymake_mode       Display messages in a compact format suitable for
                             processing by tools such as Emacs' Flymake mode

      Formatting (specify at most one; default is -plain):
        -plain, -pretty, -tex1, -tex2, -tex3, -html1, -html2, -html_css
                            Specify the style of formatting

      Point of view:
        -client <class>     Specify the class whom the point of view is taken of
        -all_clients        Display all features even those which are not exported

      Class lookup:
        -loadpath <file>    Specify an extra loadpath file to read

      ]"

feature {}
   make
      do
         output := std_output
         start
      end

   parse_arguments
      local
         i: INTEGER; arg: STRING; client_found: BOOLEAN; root_class_name: HASHED_STRING
      do
         if argument_count = 0 then
            fatal_bad_usage
         end
         if ace_file_mode then
            from
               i := 1
            until
               client_found or else i > argument_count
            loop
               arg := argument(i)
               if is_client_flag(arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     arg := argument(i + 1)
                     client_none_obsolete_check(arg)
                     arg.to_upper
                     set_client(string_aliaser.hashed_string(arg))
                     client_found := True
                  end
               elseif is_all_clients_flag(arg) then
                  set_client(Void)
                  client_found := True
               else
                  i := i + 1
               end
            end
         else
            from
               i := 1
            until
               i > argument_count
            loop
               arg := argument(i)
               if is_client_flag(arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     i := i + 1
                     arg := argument(i)
                     client_none_obsolete_check(arg)
                     arg.to_upper
                     set_client(string_aliaser.hashed_string(arg))
                     client_found := True
                  end
               elseif is_all_clients_flag(arg) then
                  set_client(Void)
                  client_found := True
               elseif flag_match(fz_loadpath, arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     system_tools.add_loadpath_file(argument(i + 1))
                     i := i + 1
                  end
               elseif is_valid_argument_for_ace_mode(arg) then
               end
               i := i + 1
            end
            ace.command_line_parsed(command_line_name)
         end
         if help_flag then
            die_with_code(exit_success_code)
         end
         if version_flag then
            die_with_code(exit_success_code)
         end
         root_class_name := ace.root_class_name
         if root_class_name = Void or else root_class_name.to_string.is_empty then
            fatal_bad_usage
         end
         root_class_names.add_last(root_class_name)
         if not client_found then
            set_client(string_aliaser.hashed_string(as_any))
         end
         if format = Void then
            set_format(once "plain")
         end
      end

   is_sort_flag (flag: STRING): BOOLEAN
      do
         if flag_match(once "sort", flag) then
            short_printer.set_sort_flag(True)
            Result := True
         end
      end

   is_short_flag (flag: STRING): BOOLEAN
      do
         if flag_match(once "short", flag) then
            Result := True
            short := True
         end
      end

   is_client_flag (flag: STRING): BOOLEAN
      do
         Result := flag_match(once "client", flag)
      end

   is_all_clients_flag (flag: STRING): BOOLEAN
      do
         Result := flag_match(once "all_clients", flag)
      end

   client_none_obsolete_check (client_argument: STRING)
      do
         if client_argument.same_as(once "NONE") then
            echo.w_put_string("short: Option %"-client NONE%" is now obsolete.%NTo view all features of the %
                              %class, you must now use the new %"-all_clients%" flag.%N")
            die_with_code(exit_failure_code)
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
         -- Because of style options, this function always returns True.
         -- Furthermore, this function is used for non ACE mode too.
      do
         Result := True
         if is_client_flag(arg) then
         elseif is_all_clients_flag(arg) then
         elseif is_version_flag(arg) then
         elseif is_verbose_flag(arg) then
         elseif is_help_flag(arg) then
         elseif is_sort_flag(arg) then
         elseif is_short_flag(arg) then
         elseif is_case_insensitive_flag(arg) then
         elseif is_no_warning_flag(arg) then
         elseif is_flymake_mode_flag(arg) then
         elseif is_style_warning_flag(arg) then
         elseif arg.item(1) = '-' then
            arg.remove_first
            set_format(arg)
         else
            if arg.has_suffix(eiffel_suffix) then
               arg.remove_suffix(eiffel_suffix)
            end
            ace.set_root_class_name_using(arg)
         end
      end

   valid_argument_for_ace_mode: STRING "Only the flags -client, -version, -help, -no_warning, -style_warning, and%N%
      %-flymake_mode are allowed in ACE file mode.%N"

end -- class SHORT
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
