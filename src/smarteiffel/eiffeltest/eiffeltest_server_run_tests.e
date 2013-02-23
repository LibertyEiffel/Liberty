-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_RUN_TESTS

inherit
   JOB

insert
   GLOBALS

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         echo.put_line(once "Server #(1): prepare tests runner" # port.out)
         events.expect(stream.event_can_write)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := events.event_occurred(stream.event_can_write)
         echo.put_line(once "Server #(1): is_ready tests runner: #(2)" # port.out # Result.out)
      end

   continue is
      local
         test_file: FIXED_STRING
         bd: BASIC_DIRECTORY
      do
         echo.put_line(once "Server #(1): testing #(2)" # port.out # path)
         if not good_tests.is_empty then
            bd.change_current_working_directory(path)
            test_file := good_tests.first
            good_tests.remove_first
            echo.put_line(once "Server #(1): testing 'good test' #(2)" # port.out # test_file)
            check_good_test(test_file)
            log.put_line(once "----------------------------------------------------------------")
         elseif not bad_tests.is_empty then
            test_file := bad_tests.first
            bad_tests.remove_first
            echo.put_line(once "Server #(1): testing 'bad test' #(2)" # port.out # test_file)
            check_bad_test(test_file)
            log.put_line(once "----------------------------------------------------------------")
         else
            echo.put_line(once "Server #(1): disconnecting" # port.out)
            disconnect
         end
      end

   done: BOOLEAN is
      do
         Result := not stream.is_connected
         echo.put_line(once "Server #(1): tests runner done: #(2)" # port.out # Result.out)
      end

   restart is
      do
         check False end
      end

feature {} -- Good tests: tests that must pass
   check_good_test (test_file: FIXED_STRING) is
      require
         test_file.has_prefix(once "test")
         test_file.has_suffix(once ".e")
      do
         if ace_test(test_file) then
            -- Well, it was actually an ace_*.ace test.
         else
            check_mocks_with(test_file)

            test_file_check_with(once "-boost", test_file)
            test_file_check_with(once "-flat_check -all_check -debug", test_file)
            test_file_check_with(once "-no_check", test_file)
            test_file_check_with(once "-flat_check -require_check", test_file)
            test_file_check_with(once "-flat_check -ensure_check", test_file)
            test_file_check_with(once "-flat_check -invariant_check", test_file)
            test_file_check_with(once "-flat_check -loop_check", test_file)
            test_file_check_with(once "-flat_check -all_check", test_file)
            --
            test_file_check_with(once "-no_gc -boost", test_file)
            test_file_check_with(once "-no_gc -boost -debug", test_file)
            test_file_check_with(once "-no_gc -no_check", test_file)
            test_file_check_with(once "-no_gc -flat_check -require_check", test_file)
            test_file_check_with(once "-no_gc -ensure_check", test_file)
            test_file_check_with(once "-no_gc -flat_check -invariant_check", test_file)
            test_file_check_with(once "-no_gc -flat_check -loop_check", test_file)
            test_file_check_with(once "-no_gc -flat_check -all_check", test_file)
            --
            test_file_check_with(once "-all_check -debug", test_file)
            test_file_check_with(once "-require_check", test_file)
            test_file_check_with(once "-ensure_check", test_file)
            test_file_check_with(once "-invariant_check", test_file)
            test_file_check_with(once "-loop_check", test_file)
            test_file_check_with(once "-all_check", test_file)
            --
            test_file_check_with(once "-no_gc -require_check", test_file)
            test_file_check_with(once "-no_gc -ensure_check", test_file)
            test_file_check_with(once "-no_gc -invariant_check", test_file)
            test_file_check_with(once "-no_gc -loop_check", test_file)
            test_file_check_with(once "-no_gc -all_check", test_file)
            --
            test_file_check_with(once "-profile -boost", test_file)
            test_file_check_with(once "-profile -all_check -debug", test_file)
            test_file_check_with(once "-profile -no_check", test_file)
            test_file_check_with(once "-profile -require_check", test_file)
            test_file_check_with(once "-profile -ensure_check", test_file)
            test_file_check_with(once "-profile -invariant_check", test_file)
            test_file_check_with(once "-profile -loop_check", test_file)
            test_file_check_with(once "-profile -all_check", test_file)
            --
            test_file_check_with(once "-profile -no_gc -boost", test_file)
            test_file_check_with(once "-profile -no_gc -no_check", test_file)
            test_file_check_with(once "-profile -no_gc -require_check", test_file)
            test_file_check_with(once "-profile -no_gc -ensure_check", test_file)
            test_file_check_with(once "-profile -no_gc -invariant_check", test_file)
            test_file_check_with(once "-profile -no_gc -loop_check", test_file)
            test_file_check_with(once "-profile -no_gc -all_check", test_file)
            --
            test_file_check_with(once "-profile -flat_check -require_check", test_file)
            test_file_check_with(once "-profile -flat_check -ensure_check", test_file)
            test_file_check_with(once "-profile -flat_check -invariant_check", test_file)
            test_file_check_with(once "-profile -flat_check -loop_check", test_file)
            test_file_check_with(once "-profile -flat_check -all_check", test_file)
            --
            test_file_check_with(once "-no_split -boost", test_file)
            test_file_check_with(once "-no_split -no_gc -boost", test_file)
            --
         end
      end

   check_mocks_with (test_file: FIXED_STRING) is
      require
         test_file.has_prefix(once "test")
         test_file.has_suffix(once ".e")
      local
         cmd, mock: STRING
         tfr: TEXT_FILE_READ
      do
         mock := once "................"
         mock.make_from_string(test_file)
         mock.remove_suffix(once ".e")
         mock.append(once ".mock")

         if file_tools.file_exists(mock) then
            from
               create tfr.connect_to(mock)
               tfr.read_line
            until
               tfr.end_of_input
            loop
               cmd := once "se mock " + tfr.last_string
               if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False)) then
                  log.put_line(once "**** Warning: mock generation skipped (by excluded.lst). Expect problems.")
               end
               tfr.read_line
            end
            tfr.disconnect
         end
      end

   test_file_check_with (options: STRING; test_file: FIXED_STRING) is
      require
         not options.is_empty
         test_file.has_prefix(once "test_")
         test_file.has_suffix(once ".e")
      local
         cmd, exe_name, c_glu, cecil, extra_options: STRING
         dummy, cecil_flag: BOOLEAN
         tfr: TEXT_FILE_READ
      do
         exe_name := change_exe_name(test_file)

         cmd := once "................"
         cmd.copy(once "se c ")
         cmd.append(options)
         cmd.extend(' ')
         cmd.append(test_file)
         cmd.append(once " -o ")
         cmd.append(exe_name)

         -- Looking for some C glu (glu_*.c) file:
         c_glu := once "................"
         c_glu.make_from_string(test_file)
         c_glu.remove_prefix(once "test_")
         c_glu.prepend(once "glu_")
         c_glu.remove_suffix(once ".e")
         c_glu.append(once ".c")
         if file_tools.file_exists(c_glu) then
            cmd.extend(' ')
            cmd.append(c_glu)
         end

         -- Looking for some -cecil extra file:
         cecil := once "................"
         cecil.make_from_string(test_file)
         cecil.remove_prefix(once "test_")
         cecil.prepend(once "cecil_")
         cecil.remove_suffix(once ".e")
         cecil.append(once ".se")
         if file_tools.file_exists(cecil) then
            cecil_flag := True
            cmd.append(once " -cecil ")
            cmd.append(cecil)
         end

         -- Finally, looking for the extra_options_*.se file
         extra_options := once "................"
         extra_options.make_from_string(test_file)
         extra_options.remove_prefix(once "test_")
         extra_options.prepend(once "extra_options_")
         extra_options.remove_suffix(once ".e")
         extra_options.append(once ".se")
         if file_tools.file_exists(extra_options) then
            cmd.extend(' ')
            from
               create tfr.connect_to(extra_options)
               tfr.read_line
            until
               tfr.end_of_input
            loop
               cmd.append(tfr.last_string)
               tfr.read_line
            end
            tfr.disconnect
         end

         if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False)) then
            -- Command skipped.
         elseif not file_tools.file_exists(exe_name) then
            log.put_line(once "**** Error: could not compile %"#(1)%" using command:%N#(2)" # test_file # cmd)
            status := status + 1
         else
            running_of(test_file, exe_name, options)
            if cecil_flag then
               dummy := excluded_execution_of(once "Removing (#(1)) %"cecil.h%" file." # options,
                                              agent file_tools.delete(once "cecil.h"))
            end
         end
      end

   ace_test (test_file: FIXED_STRING): BOOLEAN is
         -- Result is True when `test_file' appears to be an ACE test.
      require
         test_file.has_prefix(once "test_")
         test_file.has_suffix(once ".e")
      local
         ace_file, cmd, exe_name: STRING
      do
         ace_file := once "................"
         ace_file.make_from_string(test_file)
         ace_file.remove_prefix(once "test_")
         ace_file.prepend(once "ace_")
         ace_file.remove_suffix(once ".e")
         ace_file.append(once ".ace")
         if file_tools.file_exists(ace_file) then
            Result := True
            cmd := once "................"
            cmd.copy(once "se c ")
            cmd.append(ace_file)

            exe_name := change_exe_name(test_file)

            if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False)) then
               -- Command skipped.
            elseif not file_tools.file_exists(exe_name) then
               log.put_line(once "**** Error: could not compile %"#(1)%" using command:%N#(2)" # test_file # cmd)
               status := status + 1
            else
               running_of(test_file, exe_name, Void)
            end
         end
      end

   change_exe_name (test_file: FIXED_STRING): STRING is
      require
         test_file.has_suffix(once ".e")
      do
         Result := once "................"
         Result.make_from_string(test_file)
         Result.remove_tail(2)
         Result.append(once ".exe")
      ensure
         not Result.is_empty
      end

   running_of (test_file: FIXED_STRING; exe_name: STRING; options: STRING) is
      local
         log_line, exe_path, cmd: STRING; dummy: BOOLEAN
         bd: BASIC_DIRECTORY
      do
         log_line := once ".........................................................."
         log_line.copy(once "Running ")
         if options /= Void then
            log_line.extend('(')
            log_line.append(options)
            log_line.append(once ") ")
         end
         log_line.extend('%"')
         log_line.append(exe_name)
         log_line.append(once "%".")

         exe_path := once "........................................................."
         bd.compute_file_path_with(path, exe_name)
         exe_path.copy(bd.last_entry)

         if excluded_execution_of(log_line, agent execute_command(log_line, exe_path, False)) then
            -- Well, the `log_line' is filtered by the "excluded.lst" file.
         elseif file_tools.file_exists(once "profile.se") then
            log_line.copy(once "Removing %"profile.se%" of %"")
            if options /= Void then
               log_line.append(options)
               log_line.extend(' ')
            end
            log_line.append(exe_name)
            log_line.append(once "%".")
            dummy := excluded_execution_of(log_line, agent file_tools.delete(once "profile.se"))
         end

         cmd := once "................"
         cmd.copy(once "se clean ")
         cmd.append(test_file)
         dummy := excluded_execution_of(cmd, agent execute_command(cmd, cmd, False))

         log_line.copy(once "Removing ")
         if options /= Void then
            log_line.extend('(')
            log_line.append(options)
            log_line.extend(')')
            log_line.extend(' ')
         end
         log_line.append(once "%"")
         log_line.append(exe_name)
         log_line.append(once "%".")
         dummy := excluded_execution_of(log_line, agent file_tools.delete(exe_name))
      end

feature {} -- Bad tests: tests that must fail
   check_bad_test (bad_file: FIXED_STRING) is
      require
         bad_file.has_prefix(once "bad")
         bad_file.has_suffix(once ".e")
      local
         cmd, exe_name, msg, new, h_file: STRING; dummy: BOOLEAN
      do
         exe_name := change_exe_name(bad_file)

         msg := once "................"
         msg.make_from_string(bad_file)
         msg.remove_tail(2)
         msg.append(once ".msg")

         new := once "................"
         new.make_from_string(bad_file)
         new.remove_tail(2)
         new.append(once ".new")

         cmd := once "................"
         cmd.copy(once "se c ")
         cmd.append(bad_file)
         cmd.append(once " -o ")
         cmd.append(exe_name)
         cmd.append(once " -output_error_warning_on ")
         cmd.append(new)
         if excluded_execution_of(cmd, agent execute_command(cmd, cmd, True)) then
            -- Command skipped.
         elseif not file_tools.file_exists(new) then
            log.put_line(once "**** Error: Unable to locate the new error/warning file #(1) for test #(2)" # new # bad_file)
            status := status + 1
         elseif not file_tools.file_exists(msg) then
            log.put_line(once "**** Error: No original error/warning file #(1) for test #(2)" # msg # bad_file)
            log.put_line(once "     Please check #(1) and rename it to #(2)" # new # msg)
            status := status + 1
         else
            error_message_comparator.do_compare(msg, new)
            if error_message_comparator.error_flag then
               log.put_line(once "**** Error: The new error/warning file #(1) differs from #(2) for test #(3)" # new # msg # bad_file)
               status := status + 1
            else
               dummy := excluded_execution_of(once "Removing %"#(1)%"." # new, agent file_tools.delete(new))
            end
         end

         if file_tools.file_exists(exe_name) then
            -- May be we got only warnings:
            running_of(bad_file, exe_name, Void)
         end

         -- Because the error may occurs during C code generation, we also check test for
         -- the existance of the corresponding *.h file:
         h_file := once "....."
         h_file.make_from_string(bad_file)
         h_file.remove_last
         h_file.add_last('h')
         if file_tools.file_exists(h_file) then
            cmd := once "................"
            cmd.copy(once "se clean ")
            cmd.append(bad_file)
            dummy := excluded_execution_of(cmd, agent execute_command(cmd, cmd, False))
         end
      end

feature {}
   disconnect is
      require
         not done
      do
         if log /= Void and then log.is_connected then
            check_unused_excluded_patterns
            log.disconnect
         end
         stream.put_line(once "status #(1) #(2)" # status.out # path)
         stream.flush
         stream.disconnect
      ensure
         done
      end

   log: TEXT_FILE_WRITE

   collection_sorter: COLLECTION_SORTER[FIXED_STRING]
   good_tests, bad_tests: RING_ARRAY[FIXED_STRING]

   load_tests is
      do
         if not done then
            open_log_file
         end
         if not done then
            check_excluded_lst
         end
         if not done then
            load_unit_tests
         end
      end

   load_unit_tests is
      require
         not done
      local
         bd: BASIC_DIRECTORY
      do
         echo.put_line(once "Server #(1): loading unit tests from #(2)" # port.out # path)
         bd.connect_to(path)
         if bd.is_connected then
            from
               create good_tests.make(1, 0)
               create bad_tests.make(1, 0)
               bd.read_entry
            until
               bd.end_of_input
            loop
               if bd.last_entry.first /= '.' and then not file_tools.is_directory(bd.last_entry) and then bd.last_entry.has_suffix(once ".e") then
                  if bd.last_entry.has_prefix(once "test") then
                     echo.put_line(once "Server #(1): adding 'good' tests #(2)" # port.out # bd.last_entry)
                     collection_sorter.add(good_tests, bd.last_entry.intern)
                  elseif bd.last_entry.has_prefix(once "bad") then
                     echo.put_line(once "Server #(1): adding 'bad' tests #(2)" # port.out # bd.last_entry)
                     collection_sorter.add(bad_tests, bd.last_entry.intern)
                  end
               end
               bd.read_entry
            end
            bd.disconnect
         else
            log.put_line(once "**** Error: Unable to scan directory %"#(1)%"" # path)
            status := status + 1
            disconnect
         end

         log.put_line(once "Found #(1) good test#(2)" # good_tests.count.out # plural(good_tests.count))
         log.put_line(once "Found #(1) bad test#(2)" # bad_tests.count.out # plural(bad_tests.count))
      end

   plural (count: INTEGER): STRING is
      do
         if count = 1 then
            Result := once ""
         else
            Result := once "s"
         end
      end

   check_excluded_lst is
      require
         not done
      local
         bd: BASIC_DIRECTORY
         filepath: STRING
         tfw: TEXT_FILE_WRITE
      do
         filepath := once "................................................................"
         bd.compute_subdirectory_with(path, once "eiffeltest")
         filepath.copy(bd.last_entry)
         bd.compute_file_path_with(filepath, once "excluded.lst")
         filepath.copy(bd.last_entry)
         if file_tools.file_exists(filepath) then
            load_excluded_lst(filepath)
         else
            create tfw.connect_to(filepath)
            if tfw.is_connected then
               tfw.put_string(once "{
se c -profile
se c -no_gc
se c -all_check -debug
se c -all_check
se c -loop_check
se c -invariant_check
se c -ensure_check

               }")
               tfw.disconnect
               load_excluded_lst(filepath)
            else
               log.put_line(once "**** Error: Unable to create file %"#(1)%". Check for read/write permissions or disk space." # filepath)
               status := status + 1
               disconnect
            end
         end
      end

   load_excluded_lst (filepath: STRING) is
      local
         tfr: TEXT_FILE_READ
      do
         log.put_line(once "Server #(1): loading excluded patterns from #(2)" # port.out # filepath)
         create tfr.connect_to(filepath)
         if tfr.is_connected then
            create excluded_patterns.make(0)
            create excluded_patterns_usage.make(0)
            from
               tfr.read_line
            until
               tfr.end_of_input
            loop
               excluded_patterns.add_last(tfr.last_string.intern)
               excluded_patterns_usage.add_last(False)
               tfr.read_line
            end
            tfr.disconnect
         else
            log.put_line(once "**** Error: Unable to read file %"#(1)%". Check for read/write permissions or disk space." # filepath)
            status := status + 1
            disconnect
         end
      end

   excluded_patterns: FAST_ARRAY[FIXED_STRING]
   excluded_patterns_usage: FAST_ARRAY[BOOLEAN]

   check_unused_excluded_patterns is
      require
         log.is_connected
      local
         i, total_unused: INTEGER
      do
         total_unused := excluded_patterns_usage.fast_occurrences(False)
         if total_unused = 0 then
            log.put_line(once "All entries of the %"excluded.lst%" file were matched.")
         else
            log.put_line(once "**** Warning: #(1) entries of %"excluded.lst%" not matched:" # total_unused.out)
            from
               i := excluded_patterns_usage.lower
            until
               i > excluded_patterns_usage.upper
            loop
               if not excluded_patterns_usage.item(i) then
                  log.put_line(once "     Entry %"#(1)%" not used." # excluded_patterns.item(i))
               end
               i := i + 1
            end
         end
      end

   open_log_file is
      require
         not done
      local
         bd: BASIC_DIRECTORY
         p: STRING
      do
         bd.compute_subdirectory_with(path, once "eiffeltest")
         p := bd.last_entry.twin
         bd.compute_file_path_with(p, once "log.new")
         echo.put_line(once "Server #(1): opening log file: #(2)" # port.out # bd.last_entry)
         create log.connect_for_appending_to(bd.last_entry)
         if not log.is_connected then
            echo.w_put_line("**** Error: Unable to create file %"#(1)%". Check for read/write permissions or disk space." # bd.last_entry)
            status := status + 1
            disconnect
         end
      ensure
         not done implies log /= Void
      end

feature {}
   excluded_execution_of (log_line: ABSTRACT_STRING; action: PROCEDURE[TUPLE]): BOOLEAN is
      require
         not log_line.is_empty
         action /= Void
      local
         i: INTEGER
      do
         from
            i := excluded_patterns.lower
         until
            Result or else i > excluded_patterns.upper
         loop
            if log_line.has_substring(excluded_patterns.item(i)) then
               log.put_line(once "Excluded command: %"#(1)%"." # log_line)
               log.put_line(once "By excluded.lst:  %"#(1)%"." # excluded_patterns.item(i))
               excluded_patterns_usage.put(True, i)
               Result := True
            end
            i := i + 1
         end
         if not Result then
            log.put_line(log_line)
            action.call([])
         end
      end

   execute_command (log_line, cmd: STRING; bad_file_flag: BOOLEAN) is
      local
         system: SYSTEM; exit_status: INTEGER
      do
         echo.put_line(once "Server #(1): executing command: #(2)" # port.out # cmd)
         exit_status := system.execute_command(cmd) --|**** TODO: time box
         if exit_status /= exit_success_code then
            if bad_file_flag then
               -- A bad `exit_status' is just normal.
            else
               log.put_line(once "**** Error: status #(1) while running: #(2)" # exit_status.out # log_line)
               if not log_line.is_equal(cmd) then
                  log.put_line("     Command was: #(1)" # cmd)
               end
               status := status + 1
            end
         end
      end

feature {}
   make (a_port: like port; a_path: like path; a_stream: like stream; a_server: like server) is
      require
         a_path /= Void
         a_stream.is_connected
         a_server /= Void
      do
         port := a_port
         path := a_path
         stream := a_stream
         server := a_server
         echo.put_line(once "Server #(1): loading tests for #(2)" # port.out # path)
         load_tests
      ensure
         port = a_port
         path = a_path
         stream = a_stream
         server = a_server
      end

   port: INTEGER
   stream: SOCKET_INPUT_OUTPUT_STREAM
   server: EIFFELTEST_SERVER_SOCKET
   path: STRING

   status: INTEGER

   file_tools: FILE_TOOLS

   error_message_comparator: ERROR_MESSAGE_COMPARATOR is
      once
         create Result.make
      end

invariant
   path /= Void
   stream /= Void
   server /= Void

   excluded_patterns /= Void implies excluded_patterns.count = excluded_patterns_usage.count

end -- class EIFFELTEST_SERVER_RUN_TESTS
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
-- Copyright(C) 2013: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
