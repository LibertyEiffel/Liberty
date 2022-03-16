-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST
   --
   -- The `eiffeltest' command.
   --

insert
   COMMAND_LINE_TOOLS

create {}
   main

feature {ANY}
   command_line_name: STRING "eiffeltest"

   command_line_help_summary: STRING "[
      Usage: eiffeltest [options] <DirectoryPath>

      Run a suite of tests.

      Option summary:
        -force              To force automatic creation of the eiffeltest directory
                             (useful while creating new test directories)
        -flat               Only launch tests in the current directory
                             (don't recurse)
        -check              Only check the log.new file
                             (called by -flat, not so useful otherwise)
        -boost              Only launch boost tests (useful for quick checks)

      Information:
        -help               Display this help information (no test run)
        -version            Display Liberty Eiffel version information
                             (no test run)
        -verbose            Display detailed information about what the program is
                             doing

   ]"

feature {}
   directory_path: STRING
         -- The uppermost directory. The directory where tests are stored.

   eiffeltest_directory_path: STRING
         -- Which is a subdirectory of `directory_path'.

   log_file: TEXT_FILE_WRITE

   main
      do
         final_die_with_code_result := exit_success_code
         auto_calibrate_time_1.update
         parse_arguments
         echo.put_string(once "Starting eiffeltest for directory %"")
         echo.put_string(directory_path)
         echo.put_string(once "%".%N")

         echo.put_string(once "Trying to change current directory in order to make %"")
         echo.put_string(directory_path)
         echo.put_string(once "%" the current working directory.%N")
         basic_directory.change_current_working_directory(directory_path)
         if basic_directory.last_entry.is_empty then
            echo.w_put_string("se test (eiffeltest): Unable to change directory in order to make %"")
            echo.w_put_string(directory_path)
            echo.w_put_string("%" the current working directory.%N")
            die_with_code(exit_failure_code)
         end
         directory_path.make_from_string(basic_directory.current_working_directory)
         echo.put_string(once "Current working directory is now %"")
         echo.put_string(directory_path)
         echo.put_string(once "%".%N")

         if version_flag or else help_flag then
            -- We just finish here.
         elseif check_flag then
            check_eiffel_directory_path
            log_file_comparison
         else
            check_eiffel_directory_path
            eiffeltest_normal_running_mode
         end

         echo.put_string(once "Exiting with status ")
         echo.put_integer(final_die_with_code_result)
         echo.put_line(once ".")
         die_with_code(final_die_with_code_result)
      end

   plural (count: INTEGER): STRING
      do
         if count = 1 then
            Result := once ""
         else
            Result := once "s"
         end
      end

   plural_y (count: INTEGER): STRING
      do
         if count = 1 then
            Result := once "y"
         else
            Result := once "ies"
         end
      end

   eiffeltest_watch_diff_mode (dir_path: STRING)
         -- No other "se test" in progress.
         -- We will now look for diff between existing "log.new" / "log.ref".
      require
         file_tools.is_directory(dir_path)
      local
         log_new_path, log_ref_path, subdir_path, name: STRING; directory_scanner: BASIC_DIRECTORY
      do
         log_ref_path := once "....................................................................."
         log_ref_path.copy(dir_path)
         basic_directory.compute_subdirectory_with(log_ref_path, once "eiffeltest")
         log_ref_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(log_ref_path, logref_basename)
         log_ref_path.copy(basic_directory.last_entry)
         log_ref.connect_to(log_ref_path)

         log_new_path := once "....................................................................."
         log_new_path.copy(dir_path)
         basic_directory.compute_subdirectory_with(log_new_path, once "eiffeltest")
         log_new_path.copy(basic_directory.last_entry)
         basic_directory.compute_file_path_with(log_new_path, lognew_basename)
         log_new_path.copy(basic_directory.last_entry)
         log_new.connect_to(log_new_path)

         if log_ref.is_connected and then log_new.is_connected then
            log_ref.disconnect
            log_new.disconnect
            if not file_tools.same_files(log_new_path, log_ref_path) then
               final_die_with_code_result := exit_failure_code
               echo.w_put_string(once "Files differ. Check manually %"#(1)%" / %"#(2)%" %
                                 %files in%Ndirectory %"" # logref_basename # lognew_basename)
               basic_directory.compute_subdirectory_with(dir_path, once "eiffeltest")
               echo.w_put_string(basic_directory.last_entry)
               echo.w_put_string(once "%".%N")
            end
         elseif log_new.is_connected then
            log_new.disconnect
            final_die_with_code_result := exit_failure_code
            echo.w_put_string(once "It seems to be the first run of %"se test%" into%Ndirectory %"")
            echo.w_put_string(directory_path)
            echo.w_put_string("%".%NPlease check manually the log file %"")
            echo.w_put_string(log_new_path)
            echo.w_put_string("%".%NThen, rename this file as %"")
            echo.w_put_string(log_ref_path)
            echo.w_put_string("%".%N")
         elseif log_ref.is_connected then
            log_ref.disconnect
         end

         directory_scanner.connect_with(dir_path)
         if directory_scanner.is_connected then
            from
               directory_scanner.read_entry
            until
               directory_scanner.end_of_input
            loop
               name := once ".................................................."
               name.copy(directory_scanner.last_entry)
               if not ignored_subdirectory_name(name) then
                  basic_directory.compute_subdirectory_with(dir_path, name)
                  subdir_path := strings.new
                  subdir_path.copy(basic_directory.last_entry)
                  if file_tools.is_directory(subdir_path) then
                     eiffeltest_watch_diff_mode(subdir_path)
                  end
                  strings.recycle(subdir_path)
               end
               directory_scanner.read_entry
            end
            directory_scanner.disconnect
         end
      end

   check_eiffel_directory_path
      local
         path: STRING
      do
         echo.put_string("Now checking or creating %"eiffeltest%" subdirectory.%N")
         path := directory_path.twin
         basic_directory.compute_subdirectory_with(path, once "eiffeltest")
         check
            not basic_directory.last_entry.is_empty
         end
         path.copy(basic_directory.last_entry)
         eiffeltest_directory_path := path.twin
         if file_tools.file_exists(eiffeltest_directory_path) then
            if file_tools.is_directory(eiffeltest_directory_path) then
               echo.put_string(once "Directory %"")
               echo.put_string(eiffeltest_directory_path)
               echo.put_string(once "%" already exists.%N")
            else
               echo.w_put_string(once "se test (eiffeltest): Path %"")
               echo.w_put_string(eiffeltest_directory_path)
               echo.w_put_string(once "%" already exists but is not a writable directory.%N")
               die_with_code(exit_failure_code)
            end
         else
            echo.put_string(once "Must create directory %"")
            echo.put_string(eiffeltest_directory_path)
            echo.put_string(once "%".%N")
            if not force_flag then
               echo.w_put_string(once "se test (eiffeltest): Directory %"")
               echo.w_put_string(eiffeltest_directory_path)
               echo.w_put_string(once "%" does not exists yet.%N")
               echo.w_put_string(once "It is probably the first time %"se test%" is running here.%N")
               echo.w_put_string(once "Add the %"-force%" extra flag to force automatic creation %
                                      %of the %"eiffeltest%" subdirectories.%N")
               die_with_code(exit_failure_code)
            elseif not basic_directory.create_new_directory(eiffeltest_directory_path) then
               echo.w_put_string(once "se test (eiffeltest): Unable to create directory %"")
               echo.w_put_string(eiffeltest_directory_path)
               echo.w_put_string(once "%". Check for read/write permissions.%N")
               die_with_code(exit_failure_code)
            else
               new_eiffeltest_directory_flag := True
            end
         end
         update_eiffeltest_readme_file

         if new_eiffeltest_directory_flag then
            create_the_default_excluded_lst
         end
      end

   eiffeltest_normal_running_mode
      require
         checked: eiffeltest_directory_path /= Void
      local
         path, name: STRING; directory_scanner: BASIC_DIRECTORY
         subdirectory_list, test_list, bad_list: FAST_ARRAY[STRING]
      do
         create_the_lock_file

         echo.put_string(once "Now opening the %"eiffeltest/#(1)%" file for write.%N" # lognew_basename)
         path := eiffeltest_directory_path.twin
         basic_directory.compute_file_path_with(path, lognew_basename)
         check
            not basic_directory.last_entry.is_empty
         end
         path.copy(basic_directory.last_entry)
         create log_file.connect_to(path)
         if not log_file.is_connected then
            echo.w_put_string(once "se test (eiffeltest): Unable to create log file %"")
            echo.w_put_string(path)
            echo.w_put_string(once "%". Check for read/write permissions.%N")
            die_with_code(exit_failure_code)
         end
         log(once "This log file was generated by %"se test%" version #1.0.%N%
                  %The %"#(1)%" file must be identical to the %"#(2)%" file.%N%
                  %The reference file is %"#(2)%" and this file must be created manually.%N%
                  %If you confirm that %"#(1)%" is correct, just overwrite %"#(2)%" with %"#(1)%".%N" # lognew_basename # logref_basename)
         long_line_draw_in_log_file

         loading_excluded_lst

         echo.put_string(once "Now scanning the current working directory (%"")
         echo.put_string(directory_path)
         echo.put_string(once "%").%N")

         directory_scanner.connect_to_current_working_directory
         if directory_scanner.is_connected then
            from
               directory_scanner.read_entry
               create subdirectory_list.with_capacity(32)
               create test_list.with_capacity(32)
               create bad_list.with_capacity(32)
            until
               directory_scanner.end_of_input
            loop
               name := once ".................................................."
               name.copy(directory_scanner.last_entry)
               if not ignored_subdirectory_name(name) then
                  if file_tools.is_directory(name) then
                     subdirectory_list.add_last(name.twin)
                  elseif name.has_suffix(once ".e") then
                     if name.has_prefix(once "test_") then
                        test_list.add_last(name.twin)
                     elseif name.has_prefix(once "bad_") then
                        bad_list.add_last(name.twin)
                     else
                        -- Ignored.
                     end
                  else
                     -- Ignored.
                  end
               end
               directory_scanner.read_entry
            end
            directory_scanner.disconnect
         end

         log(once "Found #(1) test_* file#(2).%N" # test_list.count.to_string # plural(test_list.count))
         log(once "Found #(1) bad_* file#(2).%N" # bad_list.count.to_string # plural(bad_list.count))
         log(once "Found #(1) subdirector#(2).%N" # subdirectory_list.count.to_string # plural_y(subdirectory_list.count))

         long_line_draw_in_log_file

         if not test_list.is_empty then
            collection_sorter.sort(test_list)
            test_list_check(test_list)
            long_line_draw_in_log_file
         end
         if not bad_list.is_empty then
            collection_sorter.sort(bad_list)
            bad_list_check(bad_list)
            long_line_draw_in_log_file
         end
         if not subdirectory_list.is_empty then
            collection_sorter.sort(subdirectory_list)
            subdirectory_list_check(subdirectory_list)
            long_line_draw_in_log_file
         end

         log_unused_excluded_entries
         long_line_draw_in_log_file

         echo.put_string(once "Now closing the %"#(1)%".%N" # log_file.path)

         log(once "End of %"se test%" log file (%"#(1)%" should be identical with %"#(2)%").%N%
                  %Check that manually and overwrite %"#(2)%" with %"#(1)%" if you agree.%N" # lognew_basename # logref_basename)
         log_file.disconnect

         log_file_comparison

         remove_the_lock_file

         create_the_time_info_file

         echo.put_string(once "Finished %"#(1)%" directory.%N" # directory_path)
      end

   parse_arguments
      local
         i: INTEGER; arg: STRING
      do
         search_for_verbose_flag
         from
            i := 1
         until
            i > argument_count
         loop
            arg := argument(i)
            if is_verbose_flag(arg) then
               check
                  already_done: echo.is_verbose
               end
            elseif is_version_flag(arg) then
               check
                  version_flag
               end
            elseif is_help_flag(arg) then
               check
                  help_flag
               end
            elseif flag_match(once "boost", arg) then
               boost_flag := True
            elseif flag_match(once "flat", arg) then
               flat_flag := True
            elseif flag_match(once "check", arg) then
               check_flag := True
            elseif flag_match(once "force", arg) then
               force_flag := True
            elseif file_tools.is_directory(arg) then
               if directory_path /= Void then
                  echo.w_put_string(once "se test (eiffeltest): must give only one directory as argument.%N")
                  echo.w_put_string(once "Found first directory %"#(1)%" then directory %"#(2)%".%N" # arg # directory_path)
                  die_with_code(exit_failure_code)
               end
               directory_path := arg
            else
               echo.w_put_string(once "se test (eiffeltest): %"#(1)%": unknown argument or option.%N" # arg)
               die_with_code(exit_failure_code)
            end
            i := i + 1
         end
         if directory_path = Void then
            echo.w_put_string(once "se test (eiffeltest): must give a directory as argument (where tests are stored).%N")
            die_with_code(exit_failure_code)
         end
         if boost_flag then
            lognew_basename := once "log-boost.new"
            logref_basename := once "log-boost.ref"
         else
            lognew_basename := once "log.new"
            logref_basename := once "log.ref"
         end
      end

   file_tools: FILE_TOOLS

   basic_directory: BASIC_DIRECTORY

   collection_sorter: COLLECTION_SORTER[STRING]

   force_flag, flat_flag, check_flag, boost_flag: BOOLEAN
         -- Various obvious CLI flags

   lognew_basename, logref_basename: STRING

   new_eiffeltest_directory_flag: BOOLEAN
         -- When the subdirectory "eiffeltest" is a new one.

   update_eiffeltest_readme_file
      local
         path: STRING; text_file_write: TEXT_FILE_WRITE
      do
         path := eiffeltest_directory_path.twin
         basic_directory.compute_file_path_with(path, once "READ_ME.txt")
         path.copy(basic_directory.last_entry)
         check
            not path.is_empty
         end
         echo.put_string(once "Trying to create/update READ_ME.txt file %"#(1)%".%N" # path)
         create text_file_write.connect_to(path)
         if not text_file_write.is_connected then
            echo.w_put_string(once "se test (eiffeltest): Unable to create file %"#(1)%". Check for read/write permissions.%N" # path)
            die_with_code(exit_failure_code)
         end
         text_file_write.put_string(once "{
The READ_ME.txt file is automatically created by the "eiffeltest" command of Liberty Eiffel.
(Liberty Eiffel is The GNU Eiffel Compiler, Eiffel tools and libraries.)

This "eiffeltest" directory is used by the "eiffeltest" command to store data or
informations about your Eiffel test directory.

Inside the "eiffeltest" directory, the "LOCK" file, when it exists, indicates that
some other "eiffeltest" process is still running. Actually, if you are sure that
there is no other "eiffeltest" in progress, just remove this "LOCK" file.
Check the content of the "LOCK" file to know more about the other "eiffeltest"
in progress.

Ideally, in some "eiffeltest" directory, the "log.ref" file should be always
identical with the "log.new" file.
The "log.ref" file is the reference log file (i.e. the manually checked/created one).
The "log.new" file is the latest automatically-generated log file.
Please, note that when the "LOCK" file exists, the "log.new" file is still under
construction.

File "excluded.lst" must be manually created in order to exclude some action from
the "log.new" / "log.ref" file. This is useful when, for example, it takes too much
time to run all tests of some directory or, for example, when one does not want to
compile some Eiffel test code with all compilations modes.
Each line of the "excluded.lst" file is a new entry which can exclude zero, one, or
many actions from the log file.
The easiest way to exclude one action from the log file is to copy the line of the
action you want to avoid in the "excluded.lst". Just update your "excluded.lst"
file and re-run again "eiffeltest" and the corresponding action won't be executed.
Actually, as soon as an entry of "excluded.lst" is the prefix of an action, this
action is excluded. Then one may exclude many actions with a single entry in file
"excluded.lst" file. As an example, the line "se c -all_check" added in the
"excluded.lst" file would avoid all compilations with the -all_check mode.

Take the time to read the content of the generated "log.new" file carefully and
you'll learn a lot. See also the LibertyEiffel/test_suite directory for examples.

         }")
         text_file_write.disconnect
      end

   create_the_lock_file
      local
         path: STRING; text_file_write: TEXT_FILE_WRITE
         time: TIME; time_in_english: TIME_IN_ENGLISH
      do
         echo.put_string(once "Now checking whether another %"eiffeltest%" is already running.%N")
         path := eiffeltest_directory_path.twin
         basic_directory.compute_file_path_with(path, once "LOCK")
         check
            not basic_directory.last_entry.is_empty
         end
         path.copy(basic_directory.last_entry)
         if file_tools.file_exists(path) then
            echo.w_put_string(once "se test (eiffeltest): Another %"eiffeltest%" process seems to work%N%
                                   %in %"#(1)%".%NJust remove this LOCK file if it is wrong.%N%
                                   %(Cannot run more than one eiffeltest at a time in the same directory.)%N" # path)
            die_with_code(exit_failure_code)
         end
         echo.put_string(once "Now creating the %"#(1)%" file.%N" # path)
         create text_file_write.connect_to(path)
         if not text_file_write.is_connected then
            echo.w_put_string(once "se test (eiffeltest): Unable to create LOCK file %"#(1)%". Check for read/write permissions.%N" # path)
            die_with_code(exit_failure_code)
         end
         time.update
         create time_in_english.set_time(time)
         text_file_write.put_string(once "This LOCK file indicate that some %"eiffeltest%" process is still running in this directory.%N%N%
                                         %se test (eiffeltest): started on#(1)%N%N%
                                         %If you think that it is wrong, just remove this file.%N%
                                         %Only one eiffeltest process can be run at-a-time in some directory.%N" # time_in_english.to_string)
         text_file_write.disconnect
      end

   remove_the_lock_file
      local
         path: STRING
      do
         echo.put_string(once "Now removing the LOCK file.%N")
         path := eiffeltest_directory_path.twin
         basic_directory.compute_file_path_with(path, once "LOCK")
         check
            not basic_directory.last_entry.is_empty
         end
         path.copy(basic_directory.last_entry)
         remove_file(path)
      end

   remove_file (path: STRING)
      do
         if file_tools.file_exists(path) then
            file_tools.delete(path)
            if not file_tools.last_delete_succeeded or else file_tools.file_exists(path) then
               echo.w_put_string(once "se test (eiffeltest): Unable to delete file %"#(1)%".%N%
                                      %Check for read/write permissions. Weird!%N" # path)
               die_with_code(exit_failure_code)
            end
         end
      end

   test_list_check (test_list: FAST_ARRAY[STRING])
      require
         not test_list.is_empty
         collection_sorter.is_sorted(test_list)
      local
         i: INTEGER; test_file: STRING
      do
         from
            i := test_list.lower
         until
            i > test_list.upper
         loop
            test_file := test_list.item(i)
            if ace_test(test_file) then
               -- Well, it was actually an ace_*.ace test.
            else
               check_mocks_with(test_file)
               --
               test_file_check_with(once "-boost", test_file)
               if not boost_flag then
                  test_file_check_with(once "-flat_check -all_check -debug", test_file)
                  test_file_check_with(once "-no_check", test_file)
                  test_file_check_with(once "-flat_check -require_check", test_file)
                  test_file_check_with(once "-flat_check -ensure_check", test_file)
                  test_file_check_with(once "-flat_check -invariant_check", test_file)
                  test_file_check_with(once "-flat_check -loop_check", test_file)
                  test_file_check_with(once "-flat_check -all_check", test_file)
               end
               --
               test_file_check_with(once "-no_gc -boost", test_file)
               test_file_check_with(once "-no_gc -boost -debug", test_file)
               if not boost_flag then
                  test_file_check_with(once "-no_gc -no_check", test_file)
                  test_file_check_with(once "-no_gc -flat_check -require_check", test_file)
                  test_file_check_with(once "-no_gc -ensure_check", test_file)
                  test_file_check_with(once "-no_gc -flat_check -invariant_check", test_file)
                  test_file_check_with(once "-no_gc -flat_check -loop_check", test_file)
                  test_file_check_with(once "-no_gc -flat_check -all_check", test_file)
               end
               --
               test_file_check_with(once "-boost -bdw_gc", test_file)
               test_file_check_with(once "-boost -debug -bdw_gc", test_file)
               if not boost_flag then
                  test_file_check_with(once "-no_check -bdw_gc", test_file)
                  test_file_check_with(once "-flat_check -require_check -bdw_gc", test_file)
                  test_file_check_with(once "-ensure_check -bdw_gc", test_file)
                  test_file_check_with(once "-flat_check -invariant_check -bdw_gc", test_file)
                  test_file_check_with(once "-flat_check -loop_check -bdw_gc", test_file)
                  test_file_check_with(once "-flat_check -all_check -bdw_gc", test_file)
               end
               --
               if not boost_flag then
                  test_file_check_with(once "-all_check -debug", test_file)
                  test_file_check_with(once "-require_check", test_file)
                  test_file_check_with(once "-ensure_check", test_file)
                  test_file_check_with(once "-invariant_check", test_file)
                  test_file_check_with(once "-loop_check", test_file)
                  test_file_check_with(once "-all_check", test_file)
               end
               --
               if not boost_flag then
                  test_file_check_with(once "-no_gc -require_check", test_file)
                  test_file_check_with(once "-no_gc -ensure_check", test_file)
                  test_file_check_with(once "-no_gc -invariant_check", test_file)
                  test_file_check_with(once "-no_gc -loop_check", test_file)
                  test_file_check_with(once "-no_gc -all_check", test_file)
               end
               --
               if not boost_flag then
                  test_file_check_with(once "-require_check -bdw_gc", test_file)
                  test_file_check_with(once "-ensure_check -bdw_gc", test_file)
                  test_file_check_with(once "-invariant_check -bdw_gc", test_file)
                  test_file_check_with(once "-loop_check -bdw_gc", test_file)
                  test_file_check_with(once "-all_check -bdw_gc", test_file)
               end
               --
               test_file_check_with(once "-profile -boost", test_file)
               if not boost_flag then
                  test_file_check_with(once "-profile -all_check -debug", test_file)
                  test_file_check_with(once "-profile -no_check", test_file)
                  test_file_check_with(once "-profile -require_check", test_file)
                  test_file_check_with(once "-profile -ensure_check", test_file)
                  test_file_check_with(once "-profile -invariant_check", test_file)
                  test_file_check_with(once "-profile -loop_check", test_file)
                  test_file_check_with(once "-profile -all_check", test_file)
               end
               --
               test_file_check_with(once "-profile -no_gc -boost", test_file)
               if not boost_flag then
                  test_file_check_with(once "-profile -no_gc -no_check", test_file)
                  test_file_check_with(once "-profile -no_gc -require_check", test_file)
                  test_file_check_with(once "-profile -no_gc -ensure_check", test_file)
                  test_file_check_with(once "-profile -no_gc -invariant_check", test_file)
                  test_file_check_with(once "-profile -no_gc -loop_check", test_file)
                  test_file_check_with(once "-profile -no_gc -all_check", test_file)
               end
               --
               test_file_check_with(once "-profile -boost -bdw_gc", test_file)
               if not boost_flag then
                  test_file_check_with(once "-profile -no_check -bdw_gc", test_file)
                  test_file_check_with(once "-profile -require_check -bdw_gc", test_file)
                  test_file_check_with(once "-profile -ensure_check -bdw_gc", test_file)
                  test_file_check_with(once "-profile -invariant_check -bdw_gc", test_file)
                  test_file_check_with(once "-profile -loop_check -bdw_gc", test_file)
                  test_file_check_with(once "-profile -all_check -bdw_gc", test_file)
               end
               --
               if not boost_flag then
                  test_file_check_with(once "-profile -flat_check -require_check", test_file)
                  test_file_check_with(once "-profile -flat_check -ensure_check", test_file)
                  test_file_check_with(once "-profile -flat_check -invariant_check", test_file)
                  test_file_check_with(once "-profile -flat_check -loop_check", test_file)
                  test_file_check_with(once "-profile -flat_check -all_check", test_file)
               end
               --
               test_file_check_with(once "-no_split -boost", test_file)
               test_file_check_with(once "-no_split -no_gc -boost", test_file)
               test_file_check_with(once "-no_split -boost -bdw_gc", test_file)
               --
            end
            i := i + 1
         end
      end

   check_mocks_with (test_file: STRING)
      require
         test_file.has_prefix(once "test_")
         test_file.has_suffix(once ".e")
      local
         cmd, mock: STRING
      do
         mock := once "..............."
         mock.copy(test_file)
         mock.remove_suffix(once ".e")
         mock.append(once ".mock")

         if file_tools.file_exists(mock) then
            sedb_breakpoint
            from
               text_file_read.connect_to(mock)
               text_file_read.read_line
            until
               text_file_read.end_of_input
            loop
               cmd := once "se mock " + text_file_read.last_string
               execute_command(cmd, cmd, False)
               text_file_read.read_line
            end
            text_file_read.disconnect
         end
      end

   test_file_check_with (options: STRING; test_file: STRING)
      require
         not options.is_empty
         test_file.has_prefix(once "test_")
         test_file.has_suffix(once ".e")
      local
         cmd, exe_name, log_line, c_glu, cecil, extra_options: STRING
         dummy, cecil_flag: BOOLEAN
      do
         exe_name := change_exe_name(test_file)

         cmd := (once "se c #(1) #(2) -o #(3)" # options # test_file # exe_name).out

         -- Looking for some C glu (glu_*.c) file:
         c_glu := once "..............."
         c_glu.copy(test_file)
         c_glu.remove_prefix(once "test_")
         c_glu.prepend(once "glu_")
         c_glu.remove_suffix(once ".e")
         c_glu.append(once ".c")
         if file_tools.file_exists(c_glu) then
            cmd.extend(' ')
            cmd.append(c_glu)
         end

         -- Looking for some -cecil extra file:
         cecil := once "..............."
         cecil.copy(test_file)
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
         extra_options := once "..............."
         extra_options.copy(test_file)
         extra_options.remove_prefix(once "test_")
         extra_options.prepend(once "extra_options_")
         extra_options.remove_suffix(once ".e")
         extra_options.append(once ".se")
         if file_tools.file_exists(extra_options) then
            sedb_breakpoint
            cmd.extend(' ')
            from
               text_file_read.connect_to(extra_options)
               text_file_read.read_line
            until
               text_file_read.end_of_input
            loop
               cmd.append(text_file_read.last_string)
               text_file_read.read_line
            end
            text_file_read.disconnect
         end

         log_line := cmd
         if excluded_execution_of(log_line, agent execute_command(log_line, cmd, False)) then
            -- Command skipped.
         elseif not file_tools.file_exists(exe_name) then
            echo.w_put_string(once "se test (eiffeltest): Unable to compile %"#(1)%".%N%
                                   %Command used:%N%
                                   %#(2)%N%
                                   %In directory %"#(3)%".%N" # test_file # cmd # directory_path)
         else
            running_of(test_file, exe_name, options)
            if cecil_flag then
               log_line := (once "Removing (#(1)) %"cecil.h%" file." # options).out
               dummy := excluded_execution_of(log_line, agent remove_file(once "cecil.h"))
            end
         end
      end

   bad_list_check (bad_list: FAST_ARRAY[STRING])
      require
         not bad_list.is_empty
         collection_sorter.is_sorted(bad_list)
      local
         i: INTEGER
      do
         from
            i := bad_list.lower
         until
            i > bad_list.upper
         loop
            bad_file_check_of(bad_list.item(i))
            i := i + 1
         end
      end

   bad_file_check_of (bad_file: STRING)
      require
         bad_file.has_prefix(once "bad_")
         bad_file.has_suffix(once ".e")
      local
         cmd, exe_name, msg, new, h_file, log_line: STRING; dummy: BOOLEAN
      do
         exe_name := change_exe_name(bad_file)

         msg := bad_file.twin
         msg.remove_tail(2)
         msg.append(once ".msg")

         new := bad_file.twin
         new.remove_tail(2)
         new.append(once ".new")

         cmd := (once "se c #(1) -o #(2) -style_warning -output_error_warning_on #(3)" # bad_file # exe_name # new).out
         log_line := cmd
         if excluded_execution_of(log_line, agent execute_command(log_line, cmd, True)) then
            -- Command skipped.
         elseif not file_tools.file_exists(new) then
            echo.w_put_string("se test (eiffeltest): Bad file %"#(1)%" does not create error/warning output.%N%
                              %Check that manually (in directory %"#(1)%").%N" # bad_file # directory_path)
            log(once "Abnormal: no error/warning message for %"#(1)%".%N" # bad_file)
         elseif not file_tools.file_exists(msg) then
            echo.w_put_string("se test (eiffeltest): In directory %"#(1)%",%N%
                              %check manually that the error file %"#(2)%",%N%
                              %is the correct one for %"#(3)%".%N%
                              %If so, then, change the name of this file as %"#(4)%".%N%
                              %This will register this message as correct.%N" # directory_path # new # bad_file # msg)
            log(once "Abnormal: missing reference error/warning message for %"#(1)%".%N" # bad_file)
         else
            error_message_comparator.do_compare(msg, new)
            if error_message_comparator.error_flag then
               echo.w_put_string("se test (eiffeltest): Error/warning message has changed for file %"#(1)%".%N%
                                 %In directory %"#(2)%",%N%
                                 %files %"#(3)%" and %"#(4)%" differ too much.%N%
                                 %Please check manually.%N" # bad_file # directory_path # new # msg)
               log(once "Abnormal: differing error/warning message for %"#(1)%".%N" # bad_file)
            else
               log_line := (once "Removing %"#(1)%"." # new).out
               dummy := excluded_execution_of(log_line, agent remove_file(new))
            end
         end

         if file_tools.file_exists(exe_name) then
            -- May be we got only warnings:
            running_of(bad_file, exe_name, Void)
         end

         -- Because the error may occurs during C code generation, we also check test for
         -- the existence of the corresponding *.h file:
         h_file := bad_file.twin
         h_file.remove_last
         h_file.add_last('h')
         if file_tools.file_exists(h_file) then
            cmd := once "se clean " + bad_file
            dummy := excluded_execution_of(cmd, agent execute_command(cmd, cmd, False))
         end

      end

   log (log_line: ABSTRACT_STRING)
      require
         not log_line.is_empty
      do
         log_file.put_string(log_line)
         log_file.flush
      end

   log_file_comparison
      require
         checked: eiffeltest_directory_path /= Void
      local
         log_ref_path, log_new_path: STRING
      do
         echo.put_string("Now comparing %"#(1)%" and %"#(2)%".%N" # lognew_basename # logref_basename)

         basic_directory.compute_file_path_with(eiffeltest_directory_path, logref_basename)
         check
            not basic_directory.last_entry.is_empty
         end
         log_ref_path := basic_directory.last_entry.twin

         basic_directory.compute_file_path_with(eiffeltest_directory_path, lognew_basename)
         check
            not basic_directory.last_entry.is_empty
         end
         log_new_path := basic_directory.last_entry.twin

         if not file_tools.file_exists(log_ref_path) then
            echo.w_put_string("se test (eiffeltest): It seems to be the first run into%N%
                              %directory %"#(1)%".%N%
                              %Please check manually the log file %"#(2)%".%N%
                              %Then, rename this file as %"#(3)%".%N" # directory_path # log_new_path # log_ref_path)
            final_die_with_code_result := exit_failure_code
         elseif file_tools.same_files(log_ref_path, log_new_path) then
            echo.put_string("Identical %"#(2)%" / %"#(3)%" files in%N%
                            %directory %"#(1)%".%N%
                            %Test appears to be correct.%N" # eiffeltest_directory_path # logref_basename # lognew_basename)
         else
            echo.w_put_string("se test (eiffeltest): Log file changed for%N%
                              %directory %"#(1)%".%N%
                              %Please compare manually the log file %"#(2)%".%N%
                              %with %"#(3)%".%N%
                              %Overwrite %"#(4)%" with %"#(5)%" if you agree.%N" # directory_path # log_new_path # log_ref_path # logref_basename # lognew_basename)
            final_die_with_code_result := exit_failure_code
         end
      end

   error_message_comparator: ERROR_MESSAGE_COMPARATOR
      once
         create Result.make
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
      end

   valid_argument_for_ace_mode: STRING ""

   subdirectory_list_check (subdirectory_list: FAST_ARRAY[STRING])
      require
         not subdirectory_list.is_empty
      local
         i: INTEGER
      do
         from
            i := subdirectory_list.lower
         until
            i > subdirectory_list.upper
         loop
            subdirectory_check_with(subdirectory_list.item(i))
            i := i + 1
         end
      end

   subdirectory_check_with (subdirectory: STRING)
      require
         file_tools.is_directory(subdirectory)
      local
         cmd, log_line: STRING; subdirectory_path: STRING; dummy: BOOLEAN
      do
         log_line := (once "Launching %"se test%" on %"#(1)%" subdirectory." # subdirectory).out

         basic_directory.compute_subdirectory_with(directory_path, subdirectory)
         subdirectory_path := basic_directory.last_entry.twin

         cmd := "se test "
         if echo.is_verbose then
            cmd.append(once "-verbose ")
         end
         if force_flag then
            cmd.append(once "-force ")
         end
         if flat_flag then
            cmd.append(once "-check ")
         end
         cmd.append(subdirectory_path)

         dummy := excluded_execution_of(log_line, agent execute_command(log_line, cmd, False))
      end

   excluded_lst: FAST_ARRAY[EIFFELTEST_PATTERN]
      once
         create Result.with_capacity(32)
      end

   loading_excluded_lst
      local
         path, entry: STRING
      do
         echo.put_string(once "Trying to load the optional %"excluded.lst%" file.%N")
         basic_directory.compute_file_path_with(eiffeltest_directory_path, once "excluded.lst")
         path := basic_directory.last_entry.twin
         if file_tools.file_exists(path) then
            from
               text_file_read.connect_to(path)
            until
               text_file_read.end_of_input
            loop
               text_file_read.read_line
               entry := text_file_read.last_string
               if not entry.is_empty then
                  excluded_lst.add_last(create {EIFFELTEST_PATTERN}.make(entry))
               end
            end
            text_file_read.disconnect
         end
      end

   log_unused_excluded_entries
      local
         i, total_unused: INTEGER
      do
         if excluded_lst.is_empty then
            log(once "No %"excluded.lst%" here (good).%N")
         else
            total_unused := count_unused_excluded_lst
            if total_unused = 0 then
               log(once "All entries of the %"excluded.lst%" file are used (good).%N")
            else
               log(once "Warning, #(1) entr#(2) of %"excluded.lst%" not used:%N" # total_unused.to_string # plural_y(total_unused))
               from
                  i := excluded_lst.lower
               until
                  i > excluded_lst.upper
               loop
                  if not excluded_lst.item(i).matched then
                     log(once "Entry %"#(1)%" not used.%N" # excluded_lst.item(i).text)
                  end
                  i := i + 1
               end
            end
         end
      end

   count_unused_excluded_lst: INTEGER
      local
         i: INTEGER
      do
         from
            i := excluded_lst.lower
         until
            i > excluded_lst.upper
         loop
            if not excluded_lst.item(i).matched then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   excluded_execution_of (log_line: STRING; action: PROCEDURE[TUPLE]): BOOLEAN
      require
         not log_line.is_empty
         action /= Void
      local
         i: INTEGER
      do
         from
            i := excluded_lst.lower
         until
            Result or else i > excluded_lst.upper
         loop
            if excluded_lst.item(i).match(log_line) then
               log(once "Excluded command: %"#(1)%".%N" # log_line)
               log(once "By excluded.lst:  %"#(1)%".%N" # excluded_lst.item(i).text)
               echo.put_string(once "Excluded %"#(1)%".%N" # log_line)
               Result := True
            end
            i := i + 1
         end
         if not Result then
            log(once "#(1)%N" # log_line)
            echo.put_string(once "#(1)%N" # log_line)
            action.call([])
         end
      end

   long_line_draw_in_log_file
      do
         log(once "--------------------------------------------------------------------------------%N")
      end

   create_the_default_excluded_lst
         -- Create the default "excluded.lst" file which comes with a brand new "eiffeltest" subdirectory.
      require
         new_eiffeltest_directory_flag
      local
         path: STRING; text_file_write: TEXT_FILE_WRITE
      do
         echo.put_string("Creating the default %"excluded.lst%" file.%N")
         basic_directory.compute_file_path_with(eiffeltest_directory_path, once "excluded.lst")
         path := basic_directory.last_entry.twin
         create text_file_write.connect_to(path)
         if not text_file_write.is_connected then
            echo.w_put_string("se test (eiffeltest): Unable to create file %"#(1)%". Check for read/write permissions or disk space.%N" # path)
            die_with_code(exit_failure_code)
         end
         text_file_write.put_string(once "{
se c -profile
se c -no_gc
se c -all_check -debug
se c -all_check
se c -loop_check
se c -invariant_check
se c -ensure_check

         }")
         text_file_write.disconnect
      end

   ignored_subdirectory_name (name: STRING): BOOLEAN
      require
         not name.is_empty
      do
         inspect
            name
         when "eiffeltest", ".", "..", ".svn", "CVS", ".git" then
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   auto_calibrate_time_1: MICROSECOND_TIME; auto_calibrate_time_2: MICROSECOND_TIME

   default_very_long_run_time: REAL 300.0

   very_long_run_time: REAL
         -- Automatically calibrated in number of seconds.
      local
         seconds: REAL
      do
         if very_long_run_time_memory <= 0.0 then
            -- Well, `very_long_run_time_memory' is not yet computed.
            auto_calibrate_time_2.update
            seconds := auto_calibrate_time_1.elapsed_seconds(auto_calibrate_time_2)
            sedb_breakpoint
            if seconds < 1.0 then
               -- Execution time is not yet significant enough:
               Result := default_very_long_run_time
            else
               very_long_run_time_memory := (seconds * 150).max(default_very_long_run_time)
               echo.put_string("Auto-calibrated value for %"very_long_run_time%" is now set to ")
               echo.put_real_format(very_long_run_time, 0)
               echo.put_string(" seconds.%N")
               Result := very_long_run_time_memory
            end
         else
            Result := very_long_run_time_memory
         end
      ensure
         Result >= default_very_long_run_time
      end

   very_long_run_time_memory: REAL

   execute_command (log_line, cmd: STRING; bad_file_flag: BOOLEAN)
      local
         system: SYSTEM; exit_status: INTEGER; wait_loop_time_1, wait_loop_time_2: TIME
      do
         exit_status := system.execute_command(cmd)
         if exit_status /= exit_success_code then
            wait_loop_time_1.update
            if bad_file_flag then
               -- A bad `exit_status' is just normal.
            else
               echo.w_put_string(once "se test (eiffeltest): Error while running:%N   #(1)%N" # log_line)
               if not log_line.is_equal(cmd) then
                  echo.w_put_string(once "   #(1)%N" # cmd)
               end
               echo.w_put_string(once "(Return status was #(1))%N" # exit_status.to_string)
               log(once "Abnormal: exit status #(1) of %"#(2)%".%N" # exit_status.to_string # log_line)
            end
            -- Now one second of pause to allow the user to kill the main "se test" process.
            -- Actually, this is not a pause... I do not like to use the cpu for nothing,
            -- but we are sure to be killable by control-c (Dom. May 25th 2006).
            from
               wait_loop_time_2.update
            until
               wait_loop_time_1.elapsed_seconds(wait_loop_time_2) >= 0.1
            loop
               wait_loop_time_2.update
            end
         end
      end

   text_file_read: TEXT_FILE_READ
      once
         create Result.make
      end

   log_new: TEXT_FILE_READ
      once
         create Result.make
      end

   log_ref: TEXT_FILE_READ
      once
         create Result.make
      end

   ace_test (test_file: STRING): BOOLEAN
         -- Result is True when `test_file' appears to be an ACE test.
      require
         test_file.has_prefix(once "test_")
         test_file.has_suffix(once ".e")
      local
         ace_file, cmd, exe_name: STRING
      do
         ace_file := once "..............."
         ace_file.copy(test_file)
         ace_file.remove_prefix(once "test_")
         ace_file.prepend(once "ace_")
         ace_file.remove_suffix(once ".e")
         ace_file.append(once ".ace")
         if file_tools.file_exists(ace_file) then
            Result := True
            cmd := once "..............."
            cmd.copy(once "se c ")
            cmd.append(ace_file)

            exe_name := change_exe_name(test_file)

            if excluded_execution_of(cmd, agent execute_command(cmd, cmd, False)) then
               -- Command skipped.
            elseif not file_tools.file_exists(exe_name) then
               echo.w_put_string(once "se test (eiffeltest): Unable to compile %"#(1)%".%N%
                                      %Command used:%N%
                                      %#(2)%N%
                                      %In directory %"#(3)%".%N" # test_file # cmd # directory_path)
            else
               running_of(test_file, exe_name, Void)
            end
         end
      end

   change_exe_name (test_file: STRING): STRING
      require
         test_file.has_suffix(once ".e")
      do
         Result := once "..............."
         Result.copy(test_file)
         Result.remove_tail(2)
         Result.append(once ".exe")
      ensure
         not Result.is_empty
      end

   running_of (test_file, exe_name: STRING; options: STRING)
      local
         log_line, exe_path, cmd: STRING; start_time, end_time: TIME; dummy: BOOLEAN
      do
         start_time.update
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
         basic_directory.compute_file_path_with(directory_path, exe_name)
         exe_path.copy(basic_directory.last_entry)

         if excluded_execution_of(log_line, agent execute_command(log_line, exe_path, False)) then
            -- Well, the `log_line' is filtered by the "excluded.lst" file.
         else
            end_time.update
            if start_time.elapsed_seconds(end_time) > very_long_run_time then
               echo.w_put_string(once "se test (eiffeltest): Very long run-time (")
               echo.w_put_integer(start_time.elapsed_seconds(end_time).force_to_integer_32)
               echo.w_put_string(once " s) for %"")
               echo.w_put_string(test_file)
               echo.w_put_string(once "%" ")
               if options /= Void then
                  echo.w_put_string(once "(options %"")
                  echo.w_put_string(options)
                  echo.w_put_string(once "%") ")
               end
               echo.w_put_string(once "in directory %"")
               echo.w_put_string(directory_path)
               echo.w_put_string(once "%".%N(Time limit was set to ")
               echo.w_put_integer(very_long_run_time.force_to_integer_32)
               echo.w_put_string(once "%".)%N")
            end

            if file_tools.file_exists(once "profile.se") then
               log_line.copy(once "Removing %"profile.se%" of %"")
               if options /= Void then
                  log_line.append(options)
                  log_line.extend(' ')
               end
               log_line.append(exe_name)
               log_line.append(once "%".")
               dummy := excluded_execution_of(log_line, agent remove_file(once "profile.se"))
            end
         end

         cmd := once ".............................."
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
         dummy := excluded_execution_of(log_line, agent remove_file(exe_name))

      end

   create_the_time_info_file
      local
         path: STRING; text_file_write: TEXT_FILE_WRITE; time_in_english: TIME_IN_ENGLISH
         time_1, time_2: TIME;
      do
         path := eiffeltest_directory_path.twin
         basic_directory.compute_file_path_with(path, once "time_info.txt")
         path.copy(basic_directory.last_entry)
         check
            not path.is_empty
         end
         echo.put_string(once "Trying to update %"")
         echo.put_string(path)
         echo.put_string(once "%".%N")
         create text_file_write.connect_to(path)
         if not text_file_write.is_connected then
            echo.w_put_string(once "se test (eiffeltest): Unable to create file %"")
            echo.w_put_string(path)
            echo.w_put_string(once "%". Check for read/write permissions.%N")
            die_with_code(exit_failure_code)
         end

         time_1 := auto_calibrate_time_1.time
         create time_in_english.set_time(time_1)
         text_file_write.put_string("Execution of %"se test%" started: ")
         text_file_write.put_string(time_in_english.to_string)
         text_file_write.put_string("%N")

         time_2.update
         create time_in_english.set_time(time_2)
         text_file_write.put_string("                    terminated: ")
         text_file_write.put_string(time_in_english.to_string)
         text_file_write.put_string("%N")

		 text_file_write.put_string("(")
         text_file_write.put_real_format(time_1.elapsed_seconds(time_2), 0)
         text_file_write.put_string(" elapsed seconds in %"")
         text_file_write.put_string(directory_path)
         text_file_write.put_string("%".)%N")

         text_file_write.disconnect
      end

   final_die_with_code_result: INTEGER
         -- For those who are using "se test" with scripts.

end -- class EIFFELTEST
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
