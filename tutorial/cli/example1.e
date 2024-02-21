class EXAMPLE1

create {ANY}
   make

feature {ANY}
   make
      do
         if not args.parse_command_line then
            -- Invalid options, print help and exit
            args.usage(std_error)
            die_with_code(1)
         end

         if opt_verbose.is_set then
            io.put_string("Verbosity level: ")
            io.put_integer(opt_verbose.item)
            io.put_new_line
         end

         -- Print a simple MLA-like citation:

         if opt_organization.is_set then
            io.put_string(opt_organization.item)
         else
            io.put_string(opt_author_last.item.as_upper)
            io.put_string(", ")
            io.put_character(opt_author_first.item.item(1))
            io.put_string(". ")
            if opt_is_editor.is_set then
               io.put_string("(ed.) ")
            end
         end

         io.put_string(arg_title.item)
         io.put_string(". ")

         io.put_integer(arg_year.item)
         io.put_new_line
      end

feature {}
   factory: COMMAND_LINE_ARGUMENT_FACTORY
      once
         create Result
      end

   args: COMMAND_LINE_ARGUMENTS
      once
         -- Options which may be used together are composed with "and"
         create Result.make(modifiers and author and arg_title and arg_year)
      end

feature {} -- Argument groups
   modifiers: COMMAND_LINE_ARGUMENT
      once
         Result := opt_verbose
      end

   author: COMMAND_LINE_ARGUMENT
      once
         -- Unary operator "+" makes an option mandatory;
         -- positional arguments are always mandatory.
         --
         -- Mutually exclusive options or groups of options
         -- are composed with "or"
         Result := (+opt_organization or (+opt_author_first and +opt_author_last and opt_is_editor))
      end

feature {} -- Individual arguments
   opt_verbose: COMMAND_LINE_TYPED_ARGUMENT[INTEGER_32]
      once
         Result := factory.option_counter("v", "verbose", "Verbose output (repeat option to increase verbosity level)")
      end

   opt_organization: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      once
         Result := factory.option_string("o", "organization", "name", "Organization name")
      end

   opt_author_first: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      once
         Result := factory.option_string("f", "author_first", "name", "Author's first name")
      end

   opt_author_last: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      once
         Result := factory.option_string("l", "author_last", "name", "Author's last name")
      end

   opt_is_editor: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
      once
         Result := factory.option_boolean("e", "editor", "The 'author' is actually an editor")
      end

   arg_title: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
      once
         Result := factory.positional_string("title", "Title of the publication")
      end

   arg_year: COMMAND_LINE_TYPED_ARGUMENT[INTEGER_32]
      once
         Result := factory.positional_integer("year", "Publication year")
      end

end -- class EXAMPLE1
