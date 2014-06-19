expanded class GTK_INITIALISER

insert
   GTK_ARGUMENTS

create {} -- for Cecil
   init_from_c

feature {}
   init_from_c
      local
         argc, i: INTEGER; argv: NATIVE_ARRAY[POINTER]; s: STRING; p: POINTER
      do
         argc := command_arguments.count
         argv := argv.calloc(argc)
         from
            i := argc - 1
         until
            i < 0
         loop
            s := command_arguments.item(i)
            argv.put(s.to_external, i)
            i := i - 1
         end

         argc := gtk_init(argc, argv.to_external)
         command_arguments.resize(argc)
         from
            i := argc - 1
         until
            i < 0
         loop
            p := argv.item(i)
            create s.from_external_copy(p)
            command_arguments.put(s, i)
            i := i - 1
         end
      end

   gtk_init (argc: INTEGER; argv: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "mini_gtk_init"
         }"
      end

end -- class GTK_INITIALISER
