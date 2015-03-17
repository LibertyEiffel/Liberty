expanded class GTK_ARGUMENTS

insert
   ANY
   ARGUMENTS
      rename command_arguments as args
      export {} all
      end

feature {}
   command_arguments: FAST_ARRAY[STRING]
      once
         Result := args.twin
      end

end -- class GTK_ARGUMENTS
