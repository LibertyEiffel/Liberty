deferred class EXEC_STREAM

feature {PROCESS}
	pipe: POINTER

feature {}
	create_pipe is
		do
			if pipe.is_null then
				pipe := basic_exec_alloc_pipe
			end
			if not basic_exec_init_pipe(pipe) then
				basic_exec_free_pipe(pipe)
				pipe := default_pointer
			end
		end

	basic_exec_alloc_pipe: POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_alloc_pipe()"
			}"
		end

	basic_exec_free_pipe (p: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_free_pipe"
			}"
		end

	basic_exec_init_pipe (p: POINTER): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_init_pipe"
			}"
		end

end -- class EXEC_STREAM
