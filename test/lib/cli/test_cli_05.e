class TEST_CLI_05

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
         arg1: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
         arg2: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      do
         foo_option := option_string("f", "foo", "foo", "The foo string")
         bar_option := option_integer("b", "bar", "bar", "The bar integer")
         arg1 := positional_string("arg1", "The first positional parameter")
         arg2 := positional_string("arg2", "The second positional parameter")
         create args.make(foo_option and bar_option and arg1 and arg2)

         -- positional arguments are mandatory
         assert(arg1.is_mandatory)
         assert(arg2.is_mandatory)

         -- an empty command line is not valid
         setup
         assert(not args.parse_command_line)

         -- an option alone is not valid
         setup
         command_arguments.add_last("--bar=42")
         assert(not args.parse_command_line)

         -- must have at least both positional arguments
         setup
         command_arguments.add_last("first arg")
         command_arguments.add_last("second arg")
         assert(args.parse_command_line)
         assert(arg1.item.is_equal("first arg"))
         assert(arg2.item.is_equal("second arg"))

         -- options may be freely intermixed
         setup
         command_arguments.add_last("first arg")
         command_arguments.add_last("-bf")
         command_arguments.add_last("42")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("second arg")
         assert(args.parse_command_line)
         assert(arg1.item.is_equal("first arg"))
         assert(arg2.item.is_equal("second arg"))
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("first arg")
         command_arguments.add_last("second arg")
         command_arguments.add_last("-b")
         command_arguments.add_last("42")
         assert(args.parse_command_line)
         assert(arg1.item.is_equal("first arg"))
         assert(arg2.item.is_equal("second arg"))
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
         setup
         command_arguments.add_last("--foo")
         command_arguments.add_last("the foo z'option")
         command_arguments.add_last("--bar=42")
         command_arguments.add_last("first arg")
         command_arguments.add_last("second arg")
         assert(args.parse_command_line)
         assert(arg1.item.is_equal("first arg"))
         assert(arg2.item.is_equal("second arg"))
         assert(foo_option.item.is_equal("the foo z'option"))
         assert(bar_option.item = 42)
      end

   setup
      do
         command_arguments.make(1)
      end

   args: COMMAND_LINE_ARGUMENTS

end
