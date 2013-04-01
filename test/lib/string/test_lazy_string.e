class TEST_LAZY_STRING
creation make
feature 
   make is
      do
      ("My PID is "| &pid |".%N").print_on(std_output)
   end

   pid: INTEGER_32 is
      do
         Result:=getpid
      end

   getpid: INTEGER_32 is
       -- getpid (node at line 5374)
      external "plug_in"
      alias "{
         location: "../../../src/wrappers/posix/library/externals"
         module_name: "plugin"
         feature_name: "getpid()"
      }"
   end

end
