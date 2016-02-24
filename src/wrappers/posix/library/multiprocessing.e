deferred class MULTIPROCESSING
	-- Facilities for multiprocessing
insert UNISTD_EXTERNALS
feature {ANY} 
	processors_count: INTEGER
		-- Number of processors available in the machine
		external "plug_in"
		alias "{
			location: "externals/generated"
			module_name: "plugin"
			feature_name: "processors_count()"
			}"
		end

	process_id: INTEGER_32
		do
			Result:=getpid
		end

end 

