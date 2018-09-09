-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_RUN_TESTS

inherit
   JOB

insert
   LOGGING
   PROCESS_WAIT
      rename
         in as waitpid_in,
         job as waitpid_job
      end

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      local
         t: TIME_EVENTS
      do
         log.trace.put_line(once "Server #(1): prepare tests runner (queue: #(2))" # port.out # process_list.count.out)
         if process_list.is_empty then
            events.expect(stream.event_can_write)
         else
            if process_list.first.is_running then
               log.trace.put_line(once "Server #(1): queued command is running: #(2)" # port.out # process_list.first.cmd)
            else
               log.trace.put_line(once "Server #(1): queued command is waiting: #(2)" # port.out # process_list.first.cmd)
               events.expect(t.timeout(0))
            end
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         if process_list.is_empty then
            Result := events.event_occurred(stream.event_can_write)
         else
            Result := not process_list.first.is_running
         end
         log.trace.put_line(once "Server #(1): is_ready tests runner: #(2)" # port.out # Result.out)
      end

   continue
      local
         test_file: FIXED_STRING
         process: EIFFELTEST_SERVER_PROCESS
      do
         if not process_list.is_empty then
            check
               not process_list.first.is_running
            end
            process := process_list.first
            running_level := running_level + 1
            log.info.put_line(once "Server #(1): running queued command: #(2)" # port.out # process.cmd)
            process.run
         elseif not good_tests.is_empty then
            test_file := good_tests.first
            good_tests.remove_first
            log.info.put_line(once "Server #(1): testing 'good test' #(2)" # port.out # test_file)
            check_good_test(test_file)
         elseif not bad_tests.is_empty then
            test_file := bad_tests.first
            bad_tests.remove_first
            log.info.put_line(once "Server #(1): testing 'bad test' #(2)" # port.out # test_file)
            check_bad_test(test_file)
         else
            log.trace.put_line(once "Server #(1): disconnecting" # port.out)
            disconnect
            waitpid_job.unset_action(port.out)
         end
      end

   done: BOOLEAN
      do
         Result := not stream.is_connected
         log.trace.put_line(once "Server #(1): tests runner done: #(2)" # port.out # Result.out)
      end

   restart
      do
         check False end
      end

feature {} -- Good tests: tests that must pass
   check_good_test (test_file: FIXED_STRING)
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

   check_mocks_with (test_file: FIXED_STRING)
      require
         test_file.has_prefix(once "test")
         test_file.has_suffix(once ".e")
      local
         cmd, mock: STRING
         tfr: TEXT_FILE_READ
      do
         mock := test_file.out
         mock.remove_suffix(once ".e")
         mock.append(once ".mock")

         if file_tools.file_exists(mock) then
            from
               create tfr.connect_to(mock)
               tfr.read_line
            until
               tfr.end_of_input
            loop
               cmd := strings.new
               cmd.copy(once "se mock ")
               cmd.append(tfr.last_string)
               if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False, Void, 0)) then
                  strings.recycle(cmd)
                  test_log.put_line(once "**** Warning: mock generation skipped (by excluded.lst). Expect problems.")
               end
               tfr.read_line
            end
            tfr.disconnect
         end
      end

   test_file_check_with (options: STRING; test_file: FIXED_STRING)
      require
         not options.is_empty
         test_file.has_prefix(once "test_")
         test_file.has_suffix(once ".e")
      local
         cmd, exe_name, c_glu, cecil, extra_options: STRING
         cecil_flag: BOOLEAN
         tfr: TEXT_FILE_READ
      do
         exe_name := change_exe_name(test_file)

         cmd := strings.new
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

         if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False, agent run_file_check_with(options, cmd, exe_name, cecil_flag, test_file), -1)) then
            -- Command skipped.
            strings.recycle(cmd)
            strings.recycle(exe_name)
         end
      end

   run_file_check_with (options, cmd, exe_name: STRING; cecil_flag: BOOLEAN; test_file: FIXED_STRING)
      local
         cleanup: PROCEDURE[TUPLE]
      do
         if not file_tools.file_exists(exe_name) then
            test_log.put_line(once "**** Error: could not compile %"#(1)%" using command:%N#(2)" # test_file # cmd)
            status := status + 1
         else
            if cecil_flag then
               cleanup := agent (options_, exe_name_: STRING)
                          local
                             dummy: BOOLEAN
                          do
                             dummy := excluded_execution_of(once "Removing (#(1)) %"cecil.h%" file." # options_,
                                                            agent file_tools.delete(once "cecil.h"))
                             strings.recycle(exe_name_)
                          end (options, exe_name) --| **** TODO: closure on options, exe_name
            else
               cleanup := agent strings.recycle(exe_name)
            end
            running_of(test_file, exe_name, options, cleanup)
         end
      end

   ace_test (test_file: FIXED_STRING): BOOLEAN
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
            cmd := strings.new
            cmd.copy(once "se c ")
            cmd.append(ace_file)

            exe_name := change_exe_name(test_file)

            if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False, agent run_ace_test(test_file, cmd, exe_name), -1)) then
               -- Command skipped.
               strings.recycle(cmd)
               strings.recycle(exe_name)
            end
         end
      end

   run_ace_test (test_file: FIXED_STRING; cmd, exe_name: STRING)
      do
         if file_tools.file_exists(exe_name) then
            running_of(test_file, exe_name, Void, Void)
         else
            test_log.put_line(once "**** Error: could not compile %"#(1)%" using command:%N#(2)" # test_file # cmd)
            status := status + 1
         end
         strings.recycle(exe_name)
      end

   change_exe_name (test_file: FIXED_STRING): STRING
      require
         test_file.has_suffix(once ".e")
      do
         Result := strings.new
         Result.make_from_string(test_file)
         Result.remove_tail(2)
         Result.append(once ".exe")
      ensure
         not Result.is_empty
      end

   running_of (test_file: FIXED_STRING; exe_name: STRING; options: STRING; when_done: PROCEDURE[TUPLE])
      local
         log_line, exe_path: STRING
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

         exe_path := strings.new
         bd.compute_absolute_file_path_with(exe_name)
         exe_path.copy(bd.last_entry)

         if excluded_execution_of(log_line,
                                  agent execute_command(log_line, exe_path, False,
                                                        agent cleanup_running_of(test_file, exe_name, options, when_done, True),
                                                        60_000) --| **** TODO: customizable timeout. For now: 1 minute
                                  )
         then
            -- Well, the `log_line' is filtered by the "excluded.lst" file.
            strings.recycle(exe_path)
            cleanup_running_of(test_file, exe_name, options, when_done, False)
         end
      end

   cleanup_running_of (test_file: FIXED_STRING; exe_name: STRING; options: STRING; when_done: PROCEDURE[TUPLE]; was_run: BOOLEAN)
      local
         log_line, cmd: STRING; dummy: BOOLEAN
      do
         log_line := once ".........................................................."
         if was_run and then file_tools.file_exists(once "profile.se") then
            log_line.copy(once "Removing %"profile.se%" of %"")
            if options /= Void then
               log_line.append(options)
               log_line.extend(' ')
            end
            log_line.append(exe_name)
            log_line.append(once "%".")
            dummy := excluded_execution_of(log_line, agent file_tools.delete(once "profile.se"))
         end

         cmd := strings.new
         cmd.copy(once "se clean ")
         cmd.append(test_file)
         if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False, Void, 0)) then
            strings.recycle(cmd)
         end

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

         if when_done /= Void then
            when_done.call([])
         end
      end

feature {} -- Bad tests: tests that must fail
   check_bad_test (bad_file: FIXED_STRING)
      require
         bad_file.has_prefix(once "bad")
         bad_file.has_suffix(once ".e")
      local
         cmd, exe_name, msg, new: STRING
      do
         exe_name := change_exe_name(bad_file)

         msg := strings.new
         msg.make_from_string(bad_file)
         msg.remove_tail(2)
         msg.append(once ".msg")

         new := strings.new
         new.make_from_string(bad_file)
         new.remove_tail(2)
         new.append(once ".new")

         cmd := strings.new
         cmd.copy(once "se c ")
         cmd.append(bad_file)
         cmd.append(once " -o ")
         cmd.append(exe_name)
         cmd.append(once " -output_error_warning_on ")
         cmd.append(new)
         if excluded_execution_of(cmd, agent execute_command(cmd, cmd, True, agent run_bad_test(new, msg, exe_name, bad_file), -1)) then
            -- Command skipped.
            strings.recycle(cmd)
            strings.recycle(new)
            strings.recycle(msg)
            strings.recycle(exe_name)
         end
      end

   run_bad_test (new, msg, exe_name: STRING; bad_file: FIXED_STRING)
      local
         dummy: BOOLEAN
      do
         if not file_tools.file_exists(new) then
            test_log.put_line(once "**** Error: Unable to locate the new error/warning file #(1) for test #(2)" # new # bad_file)
            status := status + 1
         elseif not file_tools.file_exists(msg) then
            test_log.put_line(once "**** Error: No original error/warning file #(1) for test #(2)" # msg # bad_file)
            test_log.put_line(once "     Please check #(1) and rename it to #(2)" # new # msg)
            status := status + 1
         else
            error_message_comparator.do_compare(msg, new)
            if error_message_comparator.error_flag then
               test_log.put_line(once "**** Error: The new error/warning file #(1) differs from #(2) for test #(3)" # new # msg # bad_file)
               status := status + 1
            else
               dummy := excluded_execution_of(once "Removing %"#(1)%"." # new, agent file_tools.delete(new))
            end
         end

         strings.recycle(new)
         strings.recycle(msg)

         if file_tools.file_exists(exe_name) then
            -- May be we got only warnings:
            running_of(bad_file, exe_name, Void, agent cleanup_bad_test(bad_file))
         else
            cleanup_bad_test(bad_file)
         end
         strings.recycle(exe_name)
      end

   cleanup_bad_test (bad_file: FIXED_STRING)
      local
         cmd, h_file: STRING
      do
         -- Because the error may occurs during C code generation, we also check test for
         -- the existence of the corresponding *.h file:
         h_file := once "....."
         h_file.make_from_string(bad_file)
         h_file.remove_last
         h_file.add_last('h')
         if file_tools.file_exists(h_file) then
            cmd := strings.new
            cmd.copy(once "se clean ")
            cmd.append(bad_file)
            if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False, Void, 0)) then
               strings.recycle(cmd)
            end
         end
      end

feature {}
   disconnect
      require
         not done
      do
         if test_log /= Void and then test_log.is_connected then
            check_unused_excluded_patterns
            test_log.disconnect
         end
         stream.put_line(once "status #(1) #(2)" # status.out # path)
         stream.flush
         stream.disconnect
      ensure
         done
      end

   test_log: LINES_OUTPUT_STREAM

   collection_sorter: COLLECTION_SORTER[FIXED_STRING]
   good_tests, bad_tests: RING_ARRAY[FIXED_STRING]

   load_tests
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

   load_unit_tests
      require
         not done
      local
         bd: BASIC_DIRECTORY
      do
         log.info.put_line(once "Server #(1): loading unit tests from #(2)" # port.out # bd.current_working_directory)
         bd.connect_to_current_working_directory
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
                     log.trace.put_line(once "Server #(1): adding 'good' test #(2)" # port.out # bd.last_entry)
                     collection_sorter.add(good_tests, bd.last_entry.intern)
                  elseif bd.last_entry.has_prefix(once "bad") then
                     log.trace.put_line(once "Server #(1): adding 'bad' test #(2)" # port.out # bd.last_entry)
                     collection_sorter.add(bad_tests, bd.last_entry.intern)
                  else
                     log.trace.put_line(once "Server #(1): ignoring '#(2)': unknown file pattern" # port.out # bd.last_entry)
                  end
               else
                  log.trace.put_line(once "Server #(1): ignoring '#(2)': not an Eiffel file" # port.out # bd.last_entry)
               end
               bd.read_entry
            end
            bd.disconnect
         else
            test_log.put_line(once "**** Error: Unable to scan directory %"#(1)%"" # path)
            status := status + 1
            disconnect
         end

         test_log.put_line(once "Found #(1) good test#(2)" # good_tests.count.out # plural(good_tests.count))
         test_log.put_line(once "Found #(1) bad test#(2)" # bad_tests.count.out # plural(bad_tests.count))

         if log.is_info then
            log.info.put_line(once "Server #(1): #(2) 'good' test#(3)#(4)" # port.out # good_tests.count.out # plural(good_tests.count) # list(good_tests))
            log.info.put_line(once "Server #(1): #(2) 'bad' test#(3)#(4)" # port.out # bad_tests.count.out # plural(bad_tests.count) # list(bad_tests))
         end
      end

   plural (count: INTEGER): STRING
      do
         if count = 1 then
            Result := once ""
         else
            Result := once "s"
         end
      end

   list (tests: TRAVERSABLE[FIXED_STRING]): STRING
      local
         i: INTEGER
      do
         from
            Result := once ""
            Result.clear_count
            i := tests.lower
         until
            i > tests.upper
         loop
            Result.extend('%N')
            Result.append(tests.item(i))
            i := i + 1
         end
      end

   check_excluded_lst
      require
         not done
      local
         bd: BASIC_DIRECTORY
         filepath: STRING
         tfw: TEXT_FILE_WRITE
      do
         filepath := once "................................................................"
         bd.compute_file_path_with(once "eiffeltest", once "excluded.lst")
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
               test_log.put_line(once "**** Error: Unable to create file %"#(1)%". Check for read/write permissions or disk space." # filepath)
               status := status + 1
               disconnect
            end
         end
      end

   load_excluded_lst (filepath: STRING)
      local
         tfr: TEXT_FILE_READ
      do
         test_log.put_line(once "Loading excluded patterns from #(1)" # filepath)
         create tfr.connect_to(filepath)
         if tfr.is_connected then
            create excluded_patterns.make(0)
            from
               tfr.read_line
            until
               tfr.end_of_input
            loop
               excluded_patterns.add_last(create {EIFFELTEST_PATTERN}.make(tfr.last_string))
               tfr.read_line
            end
            tfr.disconnect
         else
            test_log.put_line(once "**** Error: Unable to read file %"#(1)%". Check for read/write permissions or disk space." # filepath)
            status := status + 1
            disconnect
         end
      end

   excluded_patterns: FAST_ARRAY[EIFFELTEST_PATTERN]

   check_unused_excluded_patterns
      require
         test_log.is_connected
      local
         i, total_unused: INTEGER
      do
         if excluded_patterns /= Void then
            from
               i := excluded_patterns.lower
            until
               i > excluded_patterns.upper
            loop
               if not excluded_patterns.item(i).matched then
                  total_unused := total_unused + 1
               end
               i := i + 1
            end
         end
         if total_unused = 0 then
            test_log.put_line(once "All entries of the %"excluded.lst%" file were matched.")
         else
            check
               by_construction: excluded_patterns /= Void
            end
            test_log.put_line(once "**** Warning: #(1) entries of %"excluded.lst%" not matched:" # total_unused.out)
            from
               i := excluded_patterns.lower
            until
               i > excluded_patterns.upper
            loop
               if not excluded_patterns.item(i).matched then
                  test_log.put_line(once "     Entry %"#(1)%" not used." # excluded_patterns.item(i).text)
               end
               i := i + 1
            end
         end
      end

   open_log_file
      require
         not done
      local
         bd: BASIC_DIRECTORY; tfw: TEXT_FILE_WRITE
      do
         bd.compute_file_path_with(once "eiffeltest", once "log.new")
         log.trace.put_line(once "Server #(1): opening log file: #(2)" # port.out # bd.last_entry)
         create tfw.connect_for_appending_to(bd.last_entry)
         if tfw.is_connected then
            create test_log.connect_to(tfw)
         else
            log.error.put_line("Unable to create file %"#(1)%". Check for read/write permissions or disk space." # bd.last_entry)
            status := status + 1
            disconnect
         end
      ensure
         not done implies test_log /= Void
      end

feature {}
   excluded_execution_of (log_line: ABSTRACT_STRING; action: PROCEDURE[TUPLE]): BOOLEAN
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
            if excluded_patterns.item(i).match(log_line) then
               test_log.put_line(once "Excluded command: %"#(1)%"." # log_line)
               test_log.put_line(once "By excluded.lst:  %"#(1)%"." # excluded_patterns.item(i).text)
               Result := True
            end
            i := i + 1
         end
         if not Result then
            test_log.put_line(log_line)
            action.call([])
         end
      end

   execute_command (log_line, cmd: STRING; bad_file_flag: BOOLEAN; when_done: PROCEDURE[TUPLE]; timeout: INTEGER)
      local
         system: SYSTEM; exit_status: INTEGER
         process: EIFFELTEST_SERVER_PROCESS
      do
         if when_done = Void then
            log.info.put_line(once "Server #(1): executing command now: #(2)" # port.out # cmd)
            exit_status := system.execute_command(cmd)
            cleanup_execute_command(exit_status, log_line, cmd, bad_file_flag, Void)
         else
            log.info.put_line(once "Server #(1): queueing timeboxed command: #(2)" # port.out # cmd)
            --process := process_pool.item
            if process = Void then
               create process
            end
            process.set(port, timeout, cmd, agent cleanup_execute_command(?, log_line, cmd, bad_file_flag, when_done))
            if running_level = 0 then
               log.trace.put_line(once "Server #(1): no process running, queuing at the end" # port.out)
               process_list.add_last(process)
            else
               log.trace.put_line(once "Server #(1): a process is running, queuing at #(2)" # port.out # running_level.out)
               process_list.add(process, running_level + process_list.lower)
            end
         end
      end

   cleanup_execute_command (exit_status: INTEGER; log_line, cmd: STRING; bad_file_flag: BOOLEAN; when_done: PROCEDURE[TUPLE])
      do
         if exit_status = exit_success_code then
            log.trace.put_line(once "Server #(1): command successful: #(2)" # port.out # cmd)
         elseif bad_file_flag then
            -- A bad `exit_status' is just normal.
         else
            log.error.put_line(once "Status #(1) while running: #(2)" # exit_status.out # log_line)
            test_log.put_line(once "**** Error: status #(1) while running: #(2)" # exit_status.out # log_line)
            if not log_line.is_equal(cmd) then
               test_log.put_line("     Command was: #(1)" # cmd)
            end
            status := status + 1
         end
         if when_done /= Void then
            when_done.call([])
         end
         strings.recycle(cmd)
      end

feature {}
   make (a_port: like port; a_path: like path; a_stream: like stream; a_server: like server)
      require
         a_path /= Void
         a_stream.is_connected
         a_server /= Void
      local
         bd: BASIC_DIRECTORY
      do
         port := a_port
         path := a_path
         stream := a_stream
         server := a_server
         log.trace.put_line(once "Server #(1): loading tests for #(2)" # port.out # path)
         bd.change_current_working_directory(path)
         load_tests
         waitpid_job.set_action(port.out, agent on_pid(?, ?), agent on_timeout)
         create process_list.make(1, 0)
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

   process_list: RING_ARRAY[EIFFELTEST_SERVER_PROCESS]
   running_level: INTEGER

   error_message_comparator: ERROR_MESSAGE_COMPARATOR
      once
         create Result.make
      end

   on_pid (a_pid, a_status: INTEGER)
         -- This feature is called on behalf of the waitpid job
      local
         process: EIFFELTEST_SERVER_PROCESS
      do
         process := process_list.first
         if process.is_running and then process.id = a_pid then
            process.on_done(a_status)
            unqueue_process
         end
      end

   on_timeout
         -- This feature is called on behalf of the waitpid job
      local
         process: EIFFELTEST_SERVER_PROCESS
      do
         process := process_list.first
         if process.is_running then
            process.on_timeout
            unqueue_process
         end
      end

   unqueue_process
      do
         log.trace.put_line(once "Server #(1): unqueueing process: #(2)" # port.out # process_list.first.cmd)
         process_pool.recycle(process_list.first)
         process_list.remove_first
         running_level := running_level - 1
         if process_list.is_empty then
            test_log.put_line(once "----------------------------------------------------------------")
         end
      end

   strings: STRING_RECYCLING_POOL
      once
         create Result.make
      end

   process_pool: RECYCLING_POOL[EIFFELTEST_SERVER_PROCESS]
      once
         create Result.make
      end

invariant
   path /= Void
   stream /= Void
   server /= Void

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
-- Copyright (C) 2013-2018: Cyril ADRIAN <cyril.adrian@gmail.com>
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
