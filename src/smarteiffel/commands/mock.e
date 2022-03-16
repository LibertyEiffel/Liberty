-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCK
   --
   -- The `mock' command.
   --

   --| **** TODO: this class is a sibling of CLASS_CHECK and SHORT. It should be an heir of CLASS_CHECKER,
   --| which needs some refactoring. The short framework should be a visitor instead of being hard-coded
   --| throughout the whole AST.

inherit
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "mock"

   command_line_help_summary: STRING "[
      Usage: mock [options] <ClassName>

      Generate mock object test support files.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      Warning levels:
        -style_warning      Print warnings about style violations
        -no_warning         Don't print any warnings

      Message styles:
        -flymake_mode       Display messages in a compact format suitable for
                             processing by tools such as Emacs' Flymake mode

      Class lookup:
        -loadpath <file>    Specify an extra loadpath file to read

      Mock generation:
        -mock <file>        Specify the name of the "MOCK" class file
                             (the class name is derived from the file name)
        -expect <file>      Specify the name of the "EXPECT" class file
                             (the class name is derived from the file name)

   ]"

feature {}
   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         Result := True
         if is_version_flag(arg) then
         elseif is_verbose_flag(arg) then
         elseif is_help_flag(arg) then
         elseif is_case_insensitive_flag(arg) then
         elseif is_no_warning_flag(arg) then
         elseif is_flymake_mode_flag(arg) then
         elseif is_style_warning_flag(arg) then
         elseif arg.item(1) = '-' then
            Result := False
         else
            if arg.has_suffix(eiffel_suffix) then
               arg.remove_suffix(eiffel_suffix)
            end
            ace.set_root_class_name_using(arg)
         end
      end

   valid_argument_for_ace_mode: STRING "Only the flags -version, -help, -no_warning, -style_warning, and -flymake_mode%N%
      %are allowed in ACE file mode.%N"

   parse_arguments
      local
         i: INTEGER; arg: STRING
      do
         -- `mock' has the same needs as `short' and `class_check'
         smart_eiffel.set_short_or_class_check_flag
         if argument_count = 0 then
            fatal_bad_usage
         end
         if ace_file_mode then
         else
            from
               i := 1
            until
               i > argument_count
            loop
               arg := argument(i)
               if flag_match(fz_loadpath, arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     system_tools.add_loadpath_file(argument(i + 1))
                     i := i + 1
                  end
               elseif is_valid_argument_for_ace_mode(arg) then
               elseif flag_match(fz_mock, arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     mock_file := argument(i + 1)
                     i := i + 1
                  end
               elseif flag_match(fz_expect, arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     expect_file := argument(i + 1)
                     i := i + 1
                  end
               else
                  fatal_bad_usage
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

         ace.reset_roots
         if not ace.has_root then
            fatal_bad_usage
         else
            root_class_name := ace.root_class_name
            ace.next_root
            if ace.has_root then
               fatal_bad_usage
            end
         end
      ensure
         root_class_name /= Void
      end

feature {}
   mock (class_text: CLASS_TEXT)
      require
         class_text /= Void
         parent_list.is_empty
         not class_text.name.is_tuple_related -- because TUPLE is not deferred
      local
         mock_gen: MOCK_MOCK_GENERATOR; expect_gen: MOCK_EXPECT_GENERATOR
      do
         parent_list.add_last(class_text.declaration_type_of_like_current)
         parent_list.last.up_to_any_in(parent_list)
         ace.set_command_line_debug --| **** what for???

         type := class_text.declaration_type_of_like_current
         collect_features

         if mock_file = Void then
            mock_file := compute_file_name(fz_mock)
         end
         create mock_gen.make(class_text, mock_file)

         if expect_file = Void then
            expect_file := compute_file_name(fz_expect)
         end
         create expect_gen.make(class_text, expect_file)

         mock_gen.sibling := expect_gen
         expect_gen.sibling := mock_gen

         mock_gen.generate(features_collector.features)
         expect_gen.generate(features_collector.features)
      end

   compute_file_name (suffix: STRING): STRING
      require
         suffix = fz_mock or else suffix = fz_expect
      do
         Result := type.class_text.name.to_string.twin
         Result.to_lower
         Result.extend('_')
         Result.append(suffix)
         Result.append(once ".e")
      end

   collect_features
      require
         type /= Void
      local
         i: INTEGER
      do
         create features_collector.make
         from
            i := parent_list.lower
         until
            i > parent_list.upper
         loop
            features_collector.collect(parent_list.item(i), type)
            i := i + 1
         end
      end

   make
      local
         bc: CLASS_TEXT; cn: CLASS_NAME
      do
         smart_eiffel.set_short_or_class_check_flag
         parse_arguments
         smart_eiffel.initialize_any_tuple

         create cn.unknown_position(root_class_name, False)
         bc := smart_eiffel.class_text(cn)
         if not bc.is_deferred then
            error_handler.append(once "The class ")
            error_handler.append(root_class_name.to_string)
            error_handler.append(once " is not deferred. It cannot be mocked.")
            error_handler.print_as_fatal_error
         end
         if bc.obsolete_mark /= Void then
            error_handler.append(once "The class ")
            error_handler.append(root_class_name.to_string)
            error_handler.append(once " is obsolete: ")
            error_handler.append(bc.obsolete_mark.to_string)
            error_handler.print_as_warning
         end

         mock(bc)

         smart_eiffel.very_last_information
      end

   root_class_name: HASHED_STRING
   type: TYPE

   mock_file, expect_file: STRING

   features_collector: MOCK_FEATURES_COLLECTOR

   parent_list: FAST_ARRAY[TYPE]
         -- All paths from the type to `mock' to the ANY type excluded. Actually, this `parent_list' is used
         -- to select the order of features output of command `mock'.
      once
         create Result.with_capacity(4)
      end

end -- class MOCK
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
