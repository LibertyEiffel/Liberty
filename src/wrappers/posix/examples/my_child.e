class MY_CHILD
inherit POSIX_PROCESS
feature {ANY} 
   run
   local r: INTEGER; gen: MINIMAL_RANDOM_NUMBER_GENERATOR
   do
      create gen.make
      r := gen.last_integer(10)
      ("Greeting from child process (###(1)); faking some work for #(2) seconds%N" # process_id.out # r.out).print_on(std_output)
      r := sleep(r.to_natural_32).to_integer_32
      if r=0 then
         ("(Child #(1)) Yahwn... I feel refreshed...%N" # process_id.out).print_on(std_output)
      else
         ("(Child #(2)) Ouch! Who awaked me after only #(2) seconds?%N" # process_id.out # &r).print_on(std_output)
      end
   end
end


