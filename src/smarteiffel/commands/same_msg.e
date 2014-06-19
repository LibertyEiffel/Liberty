class SAME_MSG
--
-- Check whether two *.msg file are the same (remove version numbers, Unix path for files,
-- blanks, tabs as well as non-meaningful line feed or informations...).
--

insert
   ARGUMENTS

create {}
   main

feature {}
   main
      local
         error_message_comparator: ERROR_MESSAGE_COMPARATOR
      do
         create error_message_comparator.make
         error_message_comparator.do_compare(argument(1), argument(2))
         if error_message_comparator.error_flag then
            std_output.put_string(error_message_comparator.error_message)
            die_with_code(exit_failure_code)
         else
            std_output.put_character('.')
            die_with_code(exit_success_code)
         end
      end

end
