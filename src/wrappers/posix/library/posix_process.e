deferred class POSIX_PROCESS
	-- A process as described in the POSIX standard.

	-- Commands and queries of this class are loosely modelled after the
	-- multiprocessing API of Python
	-- (http://docs.python.org/library/multiprocessing.html).
insert 
	ERRNO
	MULTIPROCESSING
feature {ANY} 
	child_process_id: like process_id
		-- The process ID of the child process

	is_child: BOOLEAN is
		do
			Result := child_process_id=0
		end

	start is
		-- Create the new process and make it run 
		-- TODO:require not_invoked_multiple_times: not 
		do
			child_process_id := fork
			if     child_process_id =  0 then run; die_with_code(exit_success_code) -- executed by the child process
			elseif child_process_id = -1 then -- there is an error
				if errno = eagain then not_yet_implemented
				elseif errno = enomem then not_yet_implemented
				else not_yet_implemented -- unknown error code
				end
			else -- nothing, this is executed by the father process
			end
		end

	run is
		-- The command that will be executed in the child process
		deferred
		end

	terminate is
		-- Send SIGTERM signal to Current process
		do
			not_yet_implemented
		end

	is_running: BOOLEAN is
		do
			not_yet_implemented
		end
end -- class POSIX_PROCESS
