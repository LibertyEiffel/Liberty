class MY_CHILD
inherit POSIX_PROCESS
create {ANY} start
feature {ANY} 
	run is
		do
			("Greeting from child process (#"| process_id.out |").%N").print_on(std_output)
		end
end
		
	
