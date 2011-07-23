-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MAKE_RELEASE

inherit
   COMMAND_LINE_TOOLS
      rename system_tools as dummy_system_tools
      end

insert
   INSTALL_GLOBALS
   GRAPHIC

creation {}
   make

feature {ANY}
   command_line_name: STRING is "make_releas"

   command_line_help_summary: STRING is "[
                                         Usage: make_release {build|release} [-plain|-mini] [-verbose] [-cc <compiler>]
                                                make_release -help

                                         -verbose  make the installer a bit more talkative.
                                         -plain    make the installer not use fancy interfaces but only plain text.
                                         -mini     forces the use of the %"mini%" interface even if Vision is available.
                                         -cc       choose the C compiler. The default is gcc.
                                         -help     just shows this text.


                                         ]"

feature {}
   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
         -- Is the `arg' command line argument allowed in ACE file mode ?
      do
      ensure
         not Result
      end

   valid_argument_for_ace_mode: STRING is ""

feature {}
   make is
      local
         i, n: INTEGER; arg, action, cc: STRING
         gui: MAKE_RELEASE_GUI
      do -- once
         if argument_count < 1 then
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
         search_for_verbose_flag
         from
            i := 1
         until
            i > argument_count
         loop
            arg := argument(i)
            if is_help_flag(arg) then
               i := i + 1
            elseif is_version_flag(arg) then
               i := i + 1
            elseif is_verbose_flag(arg) then
               i := i + 1
            elseif flag_match(once "plain", arg) then
               if gui /= Void then
                  system_tools.bad_use_exit(command_line_name, command_line_help_summary)
               end
               create {MAKE_RELEASE_PLAIN_GUI} gui.make
               i := i + 1
            elseif flag_match(once "mini", arg) then
               if gui /= Void then
                  system_tools.bad_use_exit(command_line_name, command_line_help_summary)
               end
               create {MAKE_RELEASE_MINI_GUI} gui.make
               i := i + 1
            elseif flag_match(once "cc", arg) then
               if i < argument_count then
                  n := system_tools.compiler_list.first_index_of(argument(i + 1))
                  if system_tools.compiler_list.valid_index(n) then
                     cc := system_tools.compiler_list.item(n)
                  else
                     echo.w_put_string("Unknown compiler: " + argument(i + 1))
                     die_with_code(1)
                  end
                  i := i + 2
               else
                  system_tools.bad_use_exit(command_line_name, command_line_help_summary)
               end
            elseif action /= Void then
               system_tools.bad_use_exit(command_line_name, command_line_help_summary)
            else
               action := arg
               i := i + 1
            end
         end
         if gui = Void then
            if vision_available then
               create {MAKE_RELEASE_VISION_GUI} gui.make
            else
               create {MAKE_RELEASE_MINI_GUI} gui.make
            end
         end
         check
            gui /= Void
         end
         if cc = Void then
            cc := system_tools.gcc
         end
         check
            cc /= Void
         end
         inspect
            action
         when "build" then
            gui.start(create {MAKE_RELEASE_JOB_BUILD}.make(gui, cc))
         when "release" then
            -- gui.start(create {MAKE_RELEASE_JOB_RELEASE}.make(gui, cc))
         else
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
      end

   compile_feedback (name: STRING; slice, max: INTEGER) is
      do
         check False end
      end

   execute_command (command: STRING): BOOLEAN is
      do
         check False end
      end

end -- class MAKE_RELEASE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
