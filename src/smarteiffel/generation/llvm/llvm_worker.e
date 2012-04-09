class LLVM_WORKER

inherit 
	POSIX_PROCESS
	CLASS_TEXT_VISITOR -- To access CLASS_TEXT.feature_dictionary


insert 
	EXCEPTIONS 
	GLOBALS -- these are the compiler's global
	SHARED_LLVM
	LLVM_C_TYPES
	LLVM_VALUES_FACTORY

creation communicating_over

feature {} -- Creation
	communicating_over (an_endpoint: ABSTRACT_STRING) is
		-- Start a new worker process that will wait for commands over a øMQ socket connected to `an_endpoint'
	require an_endpoint/=Void
	do
		endpoint := an_endpoint
		start -- this will fork a new process and invoke `run'
	end

feature -- Commands
	run is
		local command: ZMQ_STRING_MESSAGE
		do
			pid := process_id;
			("Worker #(1) listening on '#(2)'%N" # & pid # endpoint).print_on(std_output)
			create context
			socket := context.new_pull_socket
			from socket.connect(endpoint)
			until socket.is_unsuccessful loop 
				create command
				-- print("Worker "+pid.out+" waiting for commands%N")
				socket.wait_for(command)
				-- print("Worker "+pid.out+" received command%N")
				if socket.is_successful then 
					-- command.print_on(std_output)
					process(command)
				else throw(socket.zmq_exception)
				end
			end
			("Worker #(1) ending%N" # & pid ).print_on(std_error)
		end

feature {} -- Implementation
	process (a_command: ZMQ_STRING_MESSAGE) is
		require a_command/=Void
		local words: COLLECTION[STRING]; index: INTEGER; cluster: CLUSTER
		do
			-- ("Worker process #(1) received command `#(2)'%N" # &pid # a_command).print_on(std_output)
			words := a_command.split
			if words/=Void and then words.count=2 and then
				words.first.is_equal("compile-cluster") and then 
				words.last.is_integer then
				index := words.last.to_integer
				cluster := ace.cluster_at(index)
				("Worker process #(1) starts compiling cluster '#(2)' (##(3))%N" # &pid # cluster.name # &index).print_on(std_output)
				
				create module.with_name(cluster.name)
				cluster.for_all(agent visit_class_text)
			end
			("Cluster '#(2)' (##(3)) compiled by worker #(1)%N" # &pid # cluster.name # &index).print_on(std_output)
		end

	compile_class, visit_class_text (a_class: CLASS_TEXT) is
		local name: STRING
		do
			name := a_class.name.to_string;
			("Worker #(1) compiling class '#(2)'%N" # & pid # name).print_on(std_output);
			if a_class.is_generic then
				-- I do know that a class is not a type, and expecially a live
				-- type. I dream to provide one binary implementation of
				-- generic classes whenever possible, expecially when the
				-- generics are reference classes. Paolo 2012-04-02
				("Generic class #(1)%N" # name).print_on(std_output);
			else
				("Non-generic class #(1)%N" # name).print_on(std_output);
			end
			a_class.feature_dictionary.do_all(agent compile_feature)
		end

	compile_feature (a_feauture: ANONYMOUS_FEATURE; its_name: FEATURE_NAME) is
		require a_feauture/=Void
		local name: ABSTRACT_STRING
		do
			name := its_name.to_string;
			("Worker #(1) compiling feature '#(2)'%N" # & pid # name).print_on(std_output);
		end
		
	endpoint: ABSTRACT_STRING
	context: ZMQ_CONTEXT
	socket: ZMQ_PULL_SOCKET

	pid: like process_id
feature -- Low-Level Virtual Machine data 
	calling_convention: LLVMCALLCONV_ENUM
	module: LLVM_MODULE 
	builder: LLVM_BUILDER  
	block: LLVM_BASIC_BLOCK 
	
end -- class LLVM_WORKER
