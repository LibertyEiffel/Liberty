deferred class MULTIPROCESSING
	-- Facilities for multiprocessing
insert 
   UNISTD_EXTERNALS
   WAIT_EXTERNALS
feature {ANY} 
	processors_count: INTEGER
		-- Number of processors available in the machine
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "processors_count()"
			}"
		end

	process_id: INTEGER_32
		do
			Result:=getpid
		end

    parent_process_id: INTEGER_32
        do 
           Result:=getppid
        end

    wait_any_process: INTEGER_32 
      -- Wait for any child process to terminate
   do
      Result := wait($last_result)
   end

   last_result: INTEGER_32
      -- The exit status of the last terminated children

end 

