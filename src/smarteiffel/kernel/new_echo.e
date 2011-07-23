class NEW_ECHO

insert
   GLOBALS
   STRING_FORMATTER
      rename
         put_message as w_put_message
      redefine
         w_put_message
      end

creation {ANY}
   make

feature {ANY}
   put_message_1 (message: STRING; argument: ANY) is
      do
         if echo.is_verbose then
            w_put_message_1 (message, argument)
         end
      end

   put_message_2 (message: STRING; argument_1, argument_2: ANY) is
      do
         if echo.is_verbose then
            w_put_message_2 (message, argument_1, argument_2)
         end
      end

   put_message_3 (message: STRING; argument_1, argument_2, argument_3: ANY) is
      do
         if echo.is_verbose then
            w_put_message_3 (message, argument_1, argument_2, argument_3)
         end
      end

   put_message (message: STRING; arguments: TRAVERSABLE[ANY]) is
      do
         if echo.is_verbose then
            w_put_message(message, arguments)
         end
      end

feature {ANY}
   w_put_message_1 (message: STRING; argument: ANY) is
      do
         tmp_arguments.clear_count
         tmp_arguments.add_last(argument)
         w_put_message(message, tmp_arguments)
      end

   w_put_message_2 (message: STRING; argument_1, argument_2: ANY) is
      do
         tmp_arguments.clear_count
         tmp_arguments.add_last(argument_1)
         tmp_arguments.add_last(argument_2)
         w_put_message(message, tmp_arguments)
      end

   w_put_message_3 (message: STRING; argument_1, argument_2, argument_3: ANY) is
      do
         tmp_arguments.clear_count
         tmp_arguments.add_last(argument_1)
         tmp_arguments.add_last(argument_2)
         tmp_arguments.add_last(argument_3)
         w_put_message(message, tmp_arguments)
      end

   w_put_message (message: STRING; arguments: TRAVERSABLE[ANY]) is
      do
         Precursor(message, arguments)
         echo.output_stream.put_new_line
      end

feature {}
   make is
      do
      end

   tmp_arguments: ARRAY[ANY] is
      once
         create Result.with_capacity(3, 1)
      end

   put (c: CHARACTER) is
      do
         echo.output_stream.put_character(c)
      end

   put_item (item: ANY) is
      do
         item.print_on(echo.output_stream)
      end

end -- class NEW_ECHO
