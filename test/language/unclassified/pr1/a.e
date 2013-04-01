class A inherit ANY redefine default_create end
feature 
   default_create is do label:="foo" end
   foo is
      do
         print(label)
         -- print_run_time_stack
      end

   label: STRING 
end

