class LLVM_WORKER

inherit 
	POSIX_PROCESS
	CLASS_TEXT_VISITOR -- To access CLASS_TEXT.feature_dictionary
	ANONYMOUS_FEATURE_VISITOR	
	CALL_INFIX_VISITOR
	CALL_PREFIX_VISITOR
	EXPRESSION_VISITOR
	NATIVE_VISITOR
	INSTRUCTION_VISITOR
	MANIFEST_EXPRESSION_VISITOR
	MANIFEST_GENERIC_VISITOR

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

feature -- Implementation
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
			-- Gather the attributes of inherited and inserted classes.
			-- Gather the attributes defined in a_class itself
			-- Build an array and create an LLVM_STRUCT_TYPE
			-- Gather all creation procedures

			-- For each attribute or parameter-less query define an accessor function. Note that Eiffel 
		end

	compile_feature (a_feature: ANONYMOUS_FEATURE; its_name: FEATURE_NAME) is
		require a_feature/=Void
		local name: ABSTRACT_STRING;

		do
				name := its_name.to_string;
			("Worker #(1) compiling feature '#(2)'%N" # & pid # name).print_on(std_output);

			if a_feature.is_attribute then 

			else
				
			end
		end

feature -- Attributes compiling 
	visit_cst_att_boolean (visited: CST_ATT_BOOLEAN) is do not_yet_implemented end
	visit_cst_att_character (a_cst_att_char: CST_ATT_CHARACTER) is do not_yet_implemented end
	visit_cst_att_integer (visited: CST_ATT_INTEGER) is do not_yet_implemented end
	visit_cst_att_real (visited: CST_ATT_REAL) is do not_yet_implemented end
	visit_cst_att_string (visited: CST_ATT_STRING) is do not_yet_implemented end
	visit_cst_att_unique (a_unique_cst_att: CST_ATT_UNIQUE) is do not_yet_implemented end
	visit_writable_attribute (visited: WRITABLE_ATTRIBUTE) is do not_yet_implemented end

feature -- Functions and procedures compiling
	visit_deferred_function (visited: DEFERRED_FUNCTION) is do not_yet_implemented end
	visit_deferred_procedure (a_deferred_procedure: DEFERRED_PROCEDURE) is do not_yet_implemented end
	visit_e_function (visited: E_FUNCTION) is do not_yet_implemented end
	visit_e_procedure (visited: E_PROCEDURE) is do not_yet_implemented end
	visit_external_function (visited: EXTERNAL_FUNCTION) is do not_yet_implemented end
	visit_external_procedure (visited: EXTERNAL_PROCEDURE) is do not_yet_implemented end
	visit_once_function (an_once_function: ONCE_FUNCTION) is do not_yet_implemented end
	visit_once_procedure (an_once_procedure: ONCE_PROCEDURE) is do not_yet_implemented end

feature -- Native features compiling
	visit_native_built_in (visited: NATIVE_BUILT_IN) is do not_yet_implemented end
	visit_native_c (visited: NATIVE_C) is do not_yet_implemented end
	visit_native_c_plus_plus (visited: NATIVE_C_PLUS_PLUS) is do not_yet_implemented end
	visit_native_java (visited: NATIVE_JAVA) is do not_yet_implemented end
	visit_native_plug_in (visited: NATIVE_PLUG_IN) is do not_yet_implemented end

feature -- Instructions compiling
	visit_agent_instruction (visited: AGENT_INSTRUCTION) is do not_yet_implemented end
	visit_assertion_list (visited: ASSERTION_LIST) is do not_yet_implemented end
	visit_assignment (visited: ASSIGNMENT) is do not_yet_implemented end
	visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT) is do not_yet_implemented end
	visit_c_inline (visited: C_INLINE) is do not_yet_implemented end
	visit_check_compound (visited: CHECK_COMPOUND) is do not_yet_implemented end
	visit_class_invariant (visited: CLASS_INVARIANT) is do not_yet_implemented end
	visit_comment (visited: COMMENT) is do not_yet_implemented end
	visit_compound (visited: COMPOUND) is do not_yet_implemented end
	visit_create_instruction (visited: CREATE_INSTRUCTION) is do not_yet_implemented end
	visit_debug_compound (visited: DEBUG_COMPOUND) is do not_yet_implemented end
	visit_ensure_assertion (visited: ENSURE_ASSERTION) is do not_yet_implemented end
	visit_ifthen (visited: IFTHEN) is do not_yet_implemented end
	visit_ifthenelse (visited: IFTHENELSE) is do not_yet_implemented end
	visit_loop_instruction (visited: LOOP_INSTRUCTION) is do not_yet_implemented end
	visit_loop_invariant (visited: LOOP_INVARIANT) is do not_yet_implemented end
	visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT) is do not_yet_implemented end
	visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT) is do not_yet_implemented end
	visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION) is do not_yet_implemented end
	visit_procedure_call_0 (visited: PROCEDURE_CALL_0) is do not_yet_implemented end
	visit_procedure_call_1 (visited: PROCEDURE_CALL_1) is do not_yet_implemented end
	visit_procedure_call_n (visited: PROCEDURE_CALL_N) is do not_yet_implemented end
	visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION) is do not_yet_implemented end
	visit_require_assertion (visited: REQUIRE_ASSERTION) is do not_yet_implemented end
	visit_retry_instruction (visited: RETRY_INSTRUCTION) is do not_yet_implemented end
	visit_static_call_0_c (visited: STATIC_CALL_0_C) is do not_yet_implemented end
	visit_when_clause (visited: WHEN_CLAUSE) is do not_yet_implemented end



	-- strange features, please cast me some light on them....
	visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER) is do not_yet_implemented end
	-- Non written instructions...
	visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION) is do not_yet_implemented end
	visit_sedb (visited: SEDB) is do not_yet_implemented end
	visit_unused_expression (visited: UNUSED_EXPRESSION) is do not_yet_implemented end
	visit_void_proc_call (visited: VOID_PROC_CALL) is do not_yet_implemented end

feature -- Prefix compiling
	visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP) is do not_yet_implemented end
	visit_call_prefix_minus (visited: CALL_PREFIX_MINUS) is do not_yet_implemented end
	visit_call_prefix_not (visited: CALL_PREFIX_NOT) is do not_yet_implemented end
	visit_call_prefix_plus (visited: CALL_PREFIX_PLUS) is do not_yet_implemented end

feature -- Infix Compiling
	visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN) is do not_yet_implemented end
	visit_call_infix_and (visited: CALL_INFIX_AND) is do not_yet_implemented end
	visit_call_infix_div (visited: CALL_INFIX_DIV) is do not_yet_implemented end
	visit_call_infix_freeop (visited: CALL_INFIX_FREEOP) is do not_yet_implemented end
	visit_call_infix_ge (visited: CALL_INFIX_GE) is do not_yet_implemented end
	visit_call_infix_gt (visited: CALL_INFIX_GT) is do not_yet_implemented end
	visit_call_infix_implies (visited: CALL_INFIX_IMPLIES) is do not_yet_implemented end
	visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV) is do not_yet_implemented end
	visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM) is do not_yet_implemented end
	visit_call_infix_le (visited: CALL_INFIX_LE) is do not_yet_implemented end
	visit_call_infix_lt (visited: CALL_INFIX_LT) is do not_yet_implemented end
	visit_call_infix_minus (visited: CALL_INFIX_MINUS) is do not_yet_implemented end
	visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE) is do not_yet_implemented end
	visit_call_infix_or (visited: CALL_INFIX_OR) is do not_yet_implemented end
	visit_call_infix_plus (visited: CALL_INFIX_PLUS) is do not_yet_implemented end
	visit_call_infix_power (visited: CALL_INFIX_POWER) is do not_yet_implemented end
	visit_call_infix_times (visited: CALL_INFIX_TIMES) is do not_yet_implemented end
	visit_call_infix_xor (visited: CALL_INFIX_XOR) is do not_yet_implemented end

feature -- Expression compiling
	visit_address_of (visited: ADDRESS_OF) is do not_yet_implemented end
	visit_agent_creation (visited: AGENT_CREATION) is do not_yet_implemented end
	visit_argument_name2 (visited: ARGUMENT_NAME2) is do not_yet_implemented end
	visit_agent_expression (visited: AGENT_EXPRESSION) is do not_yet_implemented end
	visit_assertion (visited: ASSERTION) is do not_yet_implemented end
	visit_assignment_test (visited: ASSIGNMENT_TEST) is do not_yet_implemented end
	visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ) is do not_yet_implemented end
	visit_closed_operand (visited: CLOSED_OPERAND) is do not_yet_implemented end
	visit_compound_expression (visited: COMPOUND_EXPRESSION) is do not_yet_implemented end
	visit_create_expression (visited: CREATE_EXPRESSION) is do not_yet_implemented end
	visit_create_writable (visited: CREATE_WRITABLE) is do not_yet_implemented end
	visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID) is do not_yet_implemented end
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1) is do not_yet_implemented end
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2) is do not_yet_implemented end
   visit_e_false (visited: E_FALSE) is do not_yet_implemented end
	visit_e_old (visited: E_OLD) is do not_yet_implemented end
   visit_e_true (visited: E_TRUE) is do not_yet_implemented end
	visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT) is do not_yet_implemented end
	visit_fake_argument (visited: FAKE_ARGUMENT) is do not_yet_implemented end
	visit_fake_target (visited: FAKE_TARGET) is do not_yet_implemented end
	visit_fake_tuple (visited: FAKE_TUPLE) is do not_yet_implemented end
   visit_function_call_0 (visited: FUNCTION_CALL_0) is do not_yet_implemented end
   visit_function_call_1 (visited: FUNCTION_CALL_1) is do not_yet_implemented end
   visit_function_call_n (visited: FUNCTION_CALL_N) is do not_yet_implemented end
	visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE) is do not_yet_implemented end
	visit_implicit_cast (visited: IMPLICIT_CAST) is do not_yet_implemented end
   visit_implicit_current (visited: IMPLICIT_CURRENT) is do not_yet_implemented end
   visit_internal_local2 (visited: INTERNAL_LOCAL2) is do not_yet_implemented end
	visit_local_name2 (visited: LOCAL_NAME2) is do not_yet_implemented end
	visit_loop_variant (visited: LOOP_VARIANT) is do not_yet_implemented end
   visit_no_dispatch (visited: NO_DISPATCH) is do not_yet_implemented end
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH) is do not_yet_implemented end
   visit_null_pointer (visited: NULL_POINTER) is do not_yet_implemented end
	visit_open_operand (visited: OPEN_OPERAND) is do not_yet_implemented end
	visit_precursor_expression (visited: PRECURSOR_EXPRESSION) is do not_yet_implemented end
	visit_result (visited: RESULT) is do not_yet_implemented end
   visit_void_call (visited: VOID_CALL) is do not_yet_implemented end
	visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is do not_yet_implemented end
   visit_written_current (visited: WRITTEN_CURRENT) is do not_yet_implemented end

feature -- Manifest expressions
	visit_e_void (visited: E_VOID) is do not_yet_implemented end
   visit_manifest_string (visited: MANIFEST_STRING) is do not_yet_implemented end
   visit_manifest_generic (visited: MANIFEST_GENERIC) is do not_yet_implemented end
	visit_manifest_tuple (visited: MANIFEST_TUPLE) is do not_yet_implemented end
	visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY) is do not_yet_implemented end
feature -- Constant expression
  visit_character_constant (visited: CHARACTER_CONSTANT) is do not_yet_implemented end
   visit_integer_constant (visited: INTEGER_CONSTANT) is do not_yet_implemented end
   visit_real_constant (visited: REAL_CONSTANT) is do not_yet_implemented end 

feature -- InterProcess Communication
	endpoint: ABSTRACT_STRING
	context: ZMQ_CONTEXT
	socket: ZMQ_PULL_SOCKET

	pid: like process_id
feature -- Low-Level Virtual Machine data 
	calling_convention: LLVMCALLCONV_ENUM
	module: LLVM_MODULE 
	builder: LLVM_BUILDER  
	block: LLVM_BASIC_BLOCK 
	
	classes: COLLECTION [LLVM_STRUCT_TYPE]

end -- class LLVM_WORKER
