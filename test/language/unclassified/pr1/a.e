class A

inherit
   ANY
      redefine default_create
      end

feature {ANY}
   default_create
      do
         label := "foo"
      end

   foo
      do
         print(label)
         -- print_run_time_stack
      end

   label: STRING

end
