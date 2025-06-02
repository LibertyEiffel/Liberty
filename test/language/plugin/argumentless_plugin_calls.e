class ARGUMENTLESS_PLUGIN_CALLS

create {ANY}
   make

feature {ANY}
   make
      do
         void_no_args

         io.put_integer (int_no_args)
         io.put_new_line

         void_with_args (1)

         io.put_integer (int_with_args (2))
         io.put_new_line
      end

feature {ANY} -- external calls
   void_no_args
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "void_no_args"
         }"
      end

   int_no_args: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "int_no_args"
         }"
      end

   void_with_args(a: INTEGER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "void_with_args"
         }"
      end

   int_with_args(a: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "int_with_args"
         }"
      end

end
