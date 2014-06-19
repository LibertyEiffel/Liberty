class TEST_CLI_06

insert
   ARGUMENTS
   EIFFELTEST_TOOLS
   COMMAND_LINE_ARGUMENT_FACTORY

create {}
   make

feature {}
   make
      local
         verbose_option: COMMAND_LINE_TYPED_ARGUMENT[INTEGER]
         arg1: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
         arg2: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      do
         verbose_option := option_counter("v", "verbose", "The verbose option, set more than once for increased verbosity")
         arg1 := positional_string("arg1", "The first positional parameter")
         arg2 := positional_string("arg2", "The second positional parameter")
         create args.make(verbose_option and arg1 and arg2)

         -- an empty command line is not valid
         setup
         assert(not args.parse_command_line)

         -- an option alone is not valid
         setup
         command_arguments.add_last("--verbose")
         assert(not args.parse_command_line)

         -- check mixed verbosity levels
         setup
         command_arguments.add_last("first arg")
         command_arguments.add_last("-v")
         command_arguments.add_last("second arg")
         assert(args.parse_command_line)
         assert(arg1.item.is_equal("first arg"))
         assert(arg2.item.is_equal("second arg"))
         assert(verbose_option.item = 1)
         setup
         command_arguments.add_last("first arg")
         command_arguments.add_last("-vv")
         command_arguments.add_last("second arg")
         assert(args.parse_command_line)
         assert(arg1.item.is_equal("first arg"))
         assert(arg2.item.is_equal("second arg"))
         assert(verbose_option.item = 2)
      end

   setup
      do
         command_arguments.make(1)
      end

   args: COMMAND_LINE_ARGUMENTS

end
