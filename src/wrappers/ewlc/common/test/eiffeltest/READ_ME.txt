READ_ME.txt file automatically created by the "eiffeltest" command of SmartEiffel.
(SmartEiffel is The GNU Eiffel Compiler, Eiffel tools and libraries.)

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
The easyest way to exclude one action from the log file is to copy the line of the
action you want to avoid in the "excluded.lst". Just update your "excluded.lst"
file and re-run again "eiffeltest" and the corresponding action won't be executed.
Actually, as soon as an entry of "excluded.lst" is the prefix of an action, this
action is excluded. Then one may exclude many actions with a single entry in file
"excluded.lst" file. As an example, the line "se c -all_check" added in the
"excluded.lst" file would avoid all compilations with the -all_check mode.

Take the time to read carefully the content of the generated "log.new" file and
you'll learn a lot. See also the SmartEiffel/test_suite directory for examples.
