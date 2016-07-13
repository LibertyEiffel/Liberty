-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PRETTY
   --
   -- The `pretty' command.
   --
   --| TODO: support ACE files

inherit
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "pretty"

   command_line_help_summary: STRING "[
      Usage: pretty [options] <SourceFilePath> ...

      Pretty print a class source file.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program
                             doing

      Warning levels:
        -style_warning      Print warnings about style violations
        -no_warning         Don't print any warnings

      Message styles:
         -flymake_mode      Display messages in a compact format suitable for
                             processing by tools such as Emacs' Flymake mode

      Style (default is -default):
        -zen                Print as little as possible ("Current" only when
                             necessary, no end comments, compact printing)
        -default            Print using the default style options
        -end                Include end comments (implies -default)
        -parano             Print as much as possible (implies -end)

   ]"

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
      end

   valid_argument_for_ace_mode: STRING ""

feature {}
   make
      local
         i: INTEGER; arg, style, file_path: STRING
      do
         smart_eiffel.set_pretty_flag
         search_for_verbose_flag
         if argument_count < 1 then
            fatal_bad_usage
         end
         from
            i := 1
         until
            i > argument_count
         loop
            arg := argument(i)
            if is_some_flag(arg) then
               if is_flymake_mode_flag(arg) then
               elseif is_style_warning_flag(arg) then
               elseif is_no_warning_flag(arg) then
               elseif is_verbose_flag(arg) then
               elseif is_help_flag(arg) then
               elseif is_version_flag(arg) then
               elseif flag_match(once "default", arg) then
                  style := selected_style_check(style, arg)
                  pretty_printer.set_default
               elseif flag_match(once "zen", arg) then
                  style := selected_style_check(style, arg)
                  pretty_printer.set_zen
               elseif flag_match(once "end", arg) then
                  style := selected_style_check(style, arg)
                  pretty_printer.set_end
               elseif flag_match(once "parano", arg) then
                  style := selected_style_check(style, arg)
                  pretty_printer.set_parano
               elseif flag_match(once "smarteiffel_copyright_for_gnu", arg) then
                  -- Secret flag to add the good copyright for GNU parts of Liberty Eiffel.
                  pretty_printer.set_replacement_header(copyright_header_for_gnu)
                  pretty_printer.set_replacement_footer(copyright_footer_for_gnu)
               elseif flag_match(once "smarteiffel_copyright_for_lib", arg) then
                  -- Secret flag to add the good copyright for LIB parts of Liberty Eiffel.
                  pretty_printer.set_replacement_header(copyright_header_for_lib)
                  pretty_printer.set_replacement_footer(copyright_footer_for_lib)
               else
                  error_handler.append(command_line_name)
                  error_handler.append(once ": unknown flag: %"")
                  error_handler.append(arg)
                  error_handler.append(once "%"%N")
                  error_handler.print_as_fatal_error
               end
            elseif arg.has_suffix(eiffel_suffix) or else arg.has_suffix(once ".E") then
               -- Accept *.E files too.
               file_path_list.add_last(arg.twin)
            else
               error_handler.append(command_line_name)
               error_handler.append(once ": wrong suffix for an eiffel source file: %"")
               error_handler.append(arg)
               error_handler.append(once "%".%N")
               error_handler.print_as_fatal_error
            end
            i := i + 1
         end
         ace.set_all_check
         ace.set_command_line_debug
         ace.set_root_class_name_using(once "dummy")
         ace.command_line_parsed(command_line_name)
         if nb_errors > 0 then
            error_handler.append(command_line_name)
            error_handler.append(once ": no pretty printing done.")
            error_handler.print_as_fatal_error
         end
         if file_path_list.is_empty then
            error_handler.append(command_line_name)
            error_handler.append(once ": no eiffel source file path.")
            error_handler.print_as_fatal_error
         end
         from
            i := file_path_list.lower
         until
            i > file_path_list.upper
         loop
            file_path := file_path_list.item(i)
            if file_path.has_suffix(once "tuple.e") then
               echo.put_string("class TUPLE is a special case which cannot be %
                                              %handled with command `pretty'. File %"")
               echo.put_string(file_path)
               echo.put_string("%" skipped (not touched.)%N")
            else
               pretty_for(file_path)
            end
            i := i + 1
         end
      end

   file_path_list: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(12)
      end

   selected_style_check (style, arg: STRING): STRING
         -- To check that two different styles are not given at command line.
      require
         not arg.is_empty
      do
         if style /= Void and then not style.is_equal(arg) then
            error_handler.append(command_line_name)
            error_handler.append(once ": format style is already set to %"")
            error_handler.append(style)
            error_handler.append(once "%". Bad flag ")
            error_handler.append(arg)
            error_handler.append(once ".")
            error_handler.print_as_fatal_error
         end
         Result := arg
      ensure
         Result = arg
      end

   pretty_for (file_path: STRING)
      require
         not file_path.is_empty
         not file_path.has_suffix(once "tuple.e")
      local
         root_class: HASHED_STRING; class_text: CLASS_TEXT; class_name: CLASS_NAME; backup_path: STRING; ft: FILE_TOOLS
      do
         -- Check first that `file_path' is readable:
         echo.tfr_connect_or_exit(tmp_file_read, file_path)
         if echo.read_word_in(tmp_file_read) = Void then
            error_handler.append(command_line_name)
            error_handler.append(once ": cannot read content of file %"")
            error_handler.append(file_path)
            error_handler.append(once "%".%N")
            error_handler.print_as_fatal_error
         end
         tmp_file_read.disconnect
         --
         ace.set_root_class_name_using(file_path)
         root_class := ace.root_class_name
         create class_name.unknown_position(root_class, False)
         class_text := smart_eiffel.class_text_for_pretty(file_path, class_name)
         if class_text = Void then
            error_handler.append(command_line_name)
            error_handler.append(once ": no pretty printing done for %"")
            error_handler.append(file_path)
            error_handler.append(once "%".")
            error_handler.print_as_fatal_error
         end
         backup_path := file_path.twin
         backup_path.remove_suffix(eiffel_suffix)
         backup_path.append(backup_suffix)
         if ft.is_readable(backup_path) then
            error_handler.append(command_line_name)
            error_handler.append(once ": security backup file %"")
            error_handler.append(backup_path)
            error_handler.append(once "%" already exists. Remove this file first and then run pretty again.")
            error_handler.print_as_fatal_error
         end
         ft.rename_to(file_path, backup_path)
         if not ft.last_rename_succeeded or else not ft.is_readable(backup_path) then
            error_handler.append(command_line_name)
            error_handler.append(once ": cannot rename %"")
            error_handler.append(file_path)
            error_handler.append(once "%".")
            error_handler.print_as_fatal_error
         end
         pretty_printer.connect_to(file_path)
         class_text.pretty
         pretty_printer.disconnect
         -- Try to parse again the newly created file:
         smart_eiffel.remove_loaded_class(class_text)
         class_text := smart_eiffel.class_text_for_pretty(file_path, class_name)
         if class_text = Void then
            error_handler.append(command_line_name)
            error_handler.append(once ": error during `pretty' printing. Cannot parse output of pretty.%N")
            error_handler.append(once "Backup file %"")
            error_handler.append(backup_path)
            error_handler.append(once "%" not removed.")
            error_handler.print_as_fatal_error
         end
      end

   copyright_header_for_gnu: STRING "{
-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--

   }"

   copyright_footer_for_gnu: STRING "{

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

   }"

   copyright_header_for_lib: STRING "{
-- See the Copyright notice at the end of this file.
--

   }"

   copyright_footer_for_lib: STRING "{

--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the Liberty Eiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------

   }"

end -- class PRETTY
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
