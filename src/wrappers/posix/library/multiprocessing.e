deferred class MULTIPROCESSING
	-- Facilities for multiprocessing
insert UNISTD_EXTERNALS
feature 
	processors_count: INTEGER is
		-- Number of processors available in the machine
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "processors_count()"
			}"
		end

	process_id: INTEGER_32 is
		do
			Result:=getpid
		end

end 

