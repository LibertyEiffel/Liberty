class TEST_CLI_01

insert
   ARGUMENTS
   EIFFELTEST_TOOLS
   COMMAND_LINE_ARGUMENT_FACTORY

create {}
   make

feature {}
   make
      do
         -- the program takes no argument
         create args.make(no_parameters)
         args.set_helper(agent call_usage(?))

         -- an empty command line is valid
         setup
         assert(args.parse_command_line)
         assert(not usage_called)

         -- an extra argument is not valid...
         setup
         command_arguments.add_last(once "foo")
         assert(not args.parse_command_line)
         assert(not usage_called)

         -- ... except -h...
         setup
         command_arguments.add_last(once "-h")
         assert(args.parse_command_line)
         assert(usage_called)

         -- ... and --help
         setup
      command_arguments.add_last(once "--help")
      assert(args.parse_command_line)
      assert(usage_called)
      end

   setup
      do
         command_arguments.make(1)
         usage_called := False
      end

   args: COMMAND_LINE_ARGUMENTS

   usage_called: BOOLEAN
   call_usage (a_args: COMMAND_LINE_ARGUMENTS)
      do
         assert(a_args = args)
         -- a_args.usage(std_output)
         usage_called := True
      ensure
         usage_called
      end

end
