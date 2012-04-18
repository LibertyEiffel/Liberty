-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class COMPILE_TO_JVM
   --
   -- The `compile_to_jvm' command.
   --

inherit
   COMMAND_LINE_TOOLS

creation {}
   make

feature {ANY}
   command_line_name: STRING is "compile_to_jvm"

   command_line_help_summary: STRING is "[
      Usage: compile_to_jvm [options] <Root-Class> <Root-Procedure>
         or: compile_to_jvm [options] <ACEfileName>.ace

      For information about and examples of ACE files, have a look
      in the SmartEiffel/tutorial/ace directory.

      Most of the following options are not available when using an ACE file.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the compiler is
                             doing

      Warning levels:
        -no_style_warning   Don't print warnings about style violations
        -no_warning         Don't print any warnings (implies -no_style_warning)

      Optimization and debugging levels (specify at most one; default is -all_check):
        -boost              Enable all optimizations,
                             but disable all run-time checks
        -no_check           Enable Void target and system-level checking
        -require_check      Enable precondition checking (implies -no_check)
        -ensure_check       Enable postcondition checking (implies -require_check)
        -invariant_check    Enable class invariant checking (implies -ensure_check)
        -loop_check         Enable loop variant and invariant checking
                             (implies -invariant_check)
        -all_check          Enable 'check' blocks (implies -loop_check)
        -debug              Enable 'debug' blocks
        -flat_check         Each assertion will be executed in no_check mode
                            Use with any mode from require_check to all_check

      Class lookup:
        -loadpath <file>   Specify an extra loadpath file to read

      Compilation and run-time system:
        -cecil <file>       Take CECIL information from <file>
                             (may be used more than once)
        -o <file>           Use <file> as the name of the output directory and the
                             name of the generated root class
        -sedb               Enable the internal debugger

      Specific options:
        -jar                Generate a .jar file
        -run                Automatically run the program after compilation
        -use_jar <jar>      Use the program <jar> to generate the .jar file
                             (implies -jar)
        -use_jvm <jvm>      Use the JVM <jvm> to run the program (implies -run)
        -java_compiler <compiler>
                            Use the Java <compiler> compiler to compile plugins and
                             runtime
        -ss <size>          Set the maximum stack size to <size> (implies -run)
        -mx <size>          Set the maximum heap size to <size> (implies -run)
        -ms <size>          Set the initial heap size to <size> (implies -run)
        -classpath <path>   Set the path which is search for compiled classes
                             (implies -run)

      ]"

feature {}
   make is
      local
         argi: INTEGER; arg, executable_name: STRING; string_command_line: STRING_COMMAND_LINE
         bd: BASIC_DIRECTORY; cmd, tgt: STRING; cmd_res : INTEGER; tfw: TEXT_FILE_WRITE
         echo_redirect: STRING
      do
         echo.w_put_string("WARNING: compile_to_jvm is currently broken. If you want to join the team that is %
                           %working to bring it back into shape, please drop us a note on SmartEiffel-dev@loria.fr")
         system_tools.set_plugin_factory(create {JVM_PLUGIN_FACTORY}.make)
         eiffel_parser.set_drop_comments
         string_command_line.set_command_line_name(command_line_name)
         if argument_count < 1 then
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
         echo_redirect := search_for_echo_redirect_flag
         if echo_redirect /= Void then
            echo.redirect_output_on(echo_redirect)
         end
         search_for_verbose_flag
         if not ace_file_mode then
            from
               argi := 1
            until
               argi > argument_count
            loop
               arg := argument(argi)
               if is_help_flag(arg) then
                  argi := argi + 1
               elseif is_case_insensitive_flag(arg) then
                  argi := argi + 1
               elseif is_no_style_warning_flag(arg) then
                  argi := argi + 1
               elseif is_no_warning_flag(arg) then
                  argi := argi + 1
               elseif is_version_flag(arg) then
                  argi := argi + 1
               elseif is_verbose_flag(arg) then
                  argi := argi + 1
               elseif is_a_compilation_level_flag(arg) then
                  argi := argi + 1
               elseif is_debug_flag(arg) then
                  argi := argi + 1
               elseif is_flat_check_flag(arg) then
                  argi := argi + 1
               elseif is_safety_check_flag(arg) then
                  argi := argi + 1
               elseif is_trace_flag(arg) then
                  argi := argi + 1
               elseif is_cecil_flag(arg, argi) then
                  argi := argi + 2
               elseif is_o_flag(arg, argi) then
                  argi := argi + 2
               elseif is_output_error_warning_on_flag(arg, argi) then
                  argi := argi + 2
               elseif is_jar(arg) then
                  argi := argi + 1
               elseif is_run(arg) then
                  argi := argi + 1
               elseif is_use_jar(arg, argi) then
                  argi := argi + 2
               elseif is_use_jvm(arg, argi) then
                  argi := argi + 2
               elseif is_java_compiler(arg, argi) then
                  argi := argi + 2
               elseif is_ss(arg, argi) then
                  argi := argi + 2
               elseif is_mx(arg, argi) then
                  argi := argi + 2
               elseif is_ms(arg, argi) then
                  argi := argi + 2
               elseif is_classpath(arg, argi) then
                  argi := argi + 2
               elseif flag_match(fz_loadpath, arg) then
                  if argi < argument_count then
                     system_tools.add_loadpath_file(argument(argi + 1))
                     argi := argi + 2
                  else
                     echo.w_put_string(command_line_name)
                     echo.w_put_string(": missing loadpath file path after -loadpath flag.%N")
                     die_with_code(exit_failure_code)
                  end
               elseif arg.item(1) /= '-' then
                  ace.set_root_class_name_using(arg)
                  argi := argi + 1
                  if argi <= argument_count then
                     arg := argument(argi)
                     if arg.item(1) /= '-' then
                        ace.set_root_procedure_name(arg)
                        argi := argi + 1
                     end
                  end
               else
                  unknown_flag_exit(arg)
               end
            end
            ace.command_line_parsed(command_line_name)
         end
         if ace.executable_name = Void then
            executable_name := ace.root_class_name.to_string.twin
            executable_name.to_lower
            ace.set_executable_name(executable_name)
         end
         if ace.java_compiler = Void and then ini_parser.section_has(fz_section_java, fz_section_java_java_compiler) then
            ace.set_java_compiler(ini_parser.section_item(fz_section_java, fz_section_java_java_compiler).twin)
         end
         if ace.classpath = Void and then ini_parser.section_has(fz_section_java, fz_section_java_classpath) then
            ace.set_classpath(ini_parser.section_item(fz_section_java, fz_section_java_classpath).twin)
         end
         smart_eiffel.compile(jvm)
         smart_eiffel.status.set_done
         string_aliaser.echo_information
         if ace.jar then
            if ace.use_jar /= Void then
               cmd := ace.use_jar.twin
            elseif ini_parser.section_has(fz_section_java, fz_section_java_jar) then
               cmd := ini_parser.section_item(fz_section_java, fz_section_java_jar).twin
            end
            if cmd /= Void then
               arg := ace.executable_name.twin
               arg.append(once ".mf")
               tgt := ace.executable_name.twin
               tgt.append(once ".jar")
               bd.compute_file_path_with(jvm.sup_directory, arg)
               arg := bd.last_entry.twin
               create tfw.connect_to(arg)
               tfw.put_string(once "Main-Class: ")
               tfw.put_string(ace.executable_name)
               tfw.put_new_line
               tfw.disconnect
               cmd.append(jvm_tools.get_jar_flags(cmd, tgt, arg, jvm.sup_directory))
               cmd_res := echo.system_call(cmd)
               if cmd_res /= 0 then
                  error_handler.append("Error during jar generation")
                  error_handler.print_as_fatal_error
               end
            else
               error_handler.append("No .jar generator available")
               error_handler.print_as_fatal_error
            end
         end
         if ace.run then
            if ace.use_jvm /= Void then
               cmd := ace.use_jvm.twin
            elseif ini_parser.section_has(fz_section_java, fz_section_java_jvm) then
               cmd := ini_parser.section_item(fz_section_java, fz_section_java_jvm).twin
            end
            if cmd /= Void then
               arg := bd.current_working_directory
               bd.change_current_working_directory(jvm.sup_directory)
               cmd.append(jvm_tools.get_jvm_flags(cmd))
               cmd.extend(' ')
               cmd.append(ace.executable_name)
               cmd_res := echo.system_call(cmd)
               bd.change_current_working_directory(arg)
               if cmd_res /= 0 then
                  error_handler.append("Error during automatic run")
                  error_handler.print_as_fatal_error
               end
            else
               error_handler.append("No JVM for automatic run")
               error_handler.print_as_fatal_error
            end
         end
         if ace.clean_classes then
            jvm.clean_output_directory
         end
         echo.before_exit_close
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
      do
         if is_version_flag(arg) or else is_help_flag(arg) or else is_no_style_warning_flag(arg) or else is_no_warning_flag(arg) or else is_verbose_flag(arg) then
            Result := True
         end
      end

   valid_argument_for_ace_mode: STRING is "Only the flags -verbose, -version, and -help are allowed in ACE%N%
      %file mode.%
      %%N"

end -- class COMPILE_TO_JVM
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
