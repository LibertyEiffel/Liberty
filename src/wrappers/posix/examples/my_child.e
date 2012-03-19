class MY_CHILD
inherit POSIX_PROCESS
creation start
feature 
	run is
		do
			("Greeting from child process (#"| process_id.out |").%N").print_on(std_output)
		end
end
		
	
