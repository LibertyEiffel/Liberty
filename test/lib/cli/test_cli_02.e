class TEST_CLI_02

insert
   ARGUMENTS
   EIFFELTEST_TOOLS
   COMMAND_LINE_ARGUMENT_FACTORY

create {}
   make

feature {}
   make
      local
         foo_option: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
         bar_option: COMMAND_LINE_TYPED_ARGUMENT[INTEGER]
      do
         foo_option := option_string("f", "foo", "foo", "The foo string")
         bar_option := option_integer("b", "bar", "bar", "The bar integer")
         create args.make(foo_option and bar_option)

         -- an empty command line is valid
         setup
         assert(args.parse_command_line)

         -- a foo option takes a string
         setup
         command_arguments.add_last("--foo")
         assert(not args.parse_command_line)
         setup
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo option"))
         setup
         command_arguments.add_last("--foo=the foo option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo option"))
         setup
         command_arguments.add_last("-f")
         assert(not args.parse_command_line)
         setup
         command_arguments.add_last("-f")
         command_arguments.add_last("the foo option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo option"))

         -- a bar option takes an integer
         setup
         command_arguments.add_last("--bar")
         assert(not args.parse_command_line)
         setup
         command_arguments.add_last("--bar")
         command_arguments.add_last("the foo option")
         assert(not args.parse_command_line)
         setup
         command_arguments.add_last("--bar")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("--bar=42")
         assert(args.parse_command_line)
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-b")
         assert(not args.parse_command_line)
         setup
         command_arguments.add_last("-b")
         command_arguments.add_last("the foo option")
         assert(not args.parse_command_line)
         setup
         command_arguments.add_last("-b")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(bar_option.item = 42)

         -- can have both foo and bar...
         setup
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("--bar")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-f")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("-b")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-f")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("--bar")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("-b")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-fb")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)

         -- ... in any order
         setup
         command_arguments.add_last("--bar")
         command_arguments.add_last("42")
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo z'option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-b")
         command_arguments.add_last("42")
         command_arguments.add_last("-f")
         command_arguments.add_last("the foo z'option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("--bar")
         command_arguments.add_last("42")
         command_arguments.add_last("-f")
         command_arguments.add_last("the foo z'option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-b")
         command_arguments.add_last("42")
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo z'option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("-bf")
         command_arguments.add_last("42")
         command_arguments.add_last("the foo z'option")
         assert(args.parse_command_line)
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
      end

   setup
      do
         command_arguments.make(1)
      end

   args: COMMAND_LINE_ARGUMENTS

end
