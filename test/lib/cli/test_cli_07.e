class TEST_CLI_07

insert
   ARGUMENTS
   EIFFELTEST_TOOLS
   COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY[AUX_CLI_07_CUSTOM_OPTION]

create {}
   make

feature {}
   make
      local
         custom_option: COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[AUX_CLI_07_CUSTOM_OPTION]]
      do
         custom_option := option_customs("c", "custom", "custom", "The custom option", agent validate(?), agent decode(?))
         create args.make(custom_option and no_parameters)

         -- check the custom option building
         setup
         command_arguments.add_last("-c")
         command_arguments.add_last("foo")
         assert(args.parse_command_line)
         assert(custom_option.item.count = 1)
         assert(custom_option.item.first.items.count = 1)
         assert(custom_option.item.first.items.fast_reference_at("foo".intern) = Void)
         setup
         command_arguments.add_last("-c")
         command_arguments.add_last("foo = ")
         assert(args.parse_command_line)
         assert(custom_option.item.count = 1)
         assert(custom_option.item.first.items.count = 1)
         assert(custom_option.item.first.items.fast_reference_at("foo".intern).is_empty)
         setup
         command_arguments.add_last("-cc")
         command_arguments.add_last("foo=something")
         command_arguments.add_last("bar=anything")
         assert(args.parse_command_line)
         assert(custom_option.item.count = 2)
         assert(custom_option.item.first.items.count = 1)
         assert(custom_option.item.first.items.fast_reference_at("foo".intern).is_equal("something"))
         assert(custom_option.item.last.items.count = 1)
         assert(custom_option.item.last.items.fast_reference_at("bar".intern).is_equal("anything"))
         setup
         command_arguments.add_last("-c")
         command_arguments.add_last("foo=something")
         command_arguments.add_last("-c")
         command_arguments.add_last("bar=anything")
         assert(args.parse_command_line)
         assert(custom_option.item.count = 2)
         assert(custom_option.item.first.items.count = 1)
         assert(custom_option.item.first.items.fast_reference_at("foo".intern).is_equal("something"))
         assert(custom_option.item.last.items.count = 1)
         assert(custom_option.item.last.items.fast_reference_at("bar".intern).is_equal("anything"))
         setup
         command_arguments.add_last("-c")
         command_arguments.add_last("foo = something else; bar = anything else   ")
         assert(args.parse_command_line)
         assert(custom_option.item.count = 1)
         assert(custom_option.item.first.items.count = 2)
         assert(custom_option.item.first.items.fast_reference_at("foo".intern).is_equal("something else"))
         assert(custom_option.item.first.items.fast_reference_at("bar".intern).is_equal("anything else"))
      end

   setup
      do
         command_arguments.make(1)
      end

   args: COMMAND_LINE_ARGUMENTS

   validate (arg: STRING): BOOLEAN
      do
         Result := not arg.is_empty
      end

   decode (arg: STRING): AUX_CLI_07_CUSTOM_OPTION
      do
         create Result.make(arg)
      end

end
