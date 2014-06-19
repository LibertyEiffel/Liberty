expanded class GTK

feature {}
   gtk_main
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtk_main()"
         }"
      end

   gtk_main_quit
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtk_main_quit()"
         }"
      end

end -- class GTK
