class C_FILE

inherit  
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	STORABLE_NODE
	WRAPPED_BY_A_CLASS

insert 
	NAME_CONVERTER 
	FILE_TOOLS

creation make

feature 
	store is
		do
			files.put(Current,id)
		end

	emit_wrapper is
		-- Emit all the function contained into Current file into a deferred class.
	local 
		my_functions: LINKED_LIST[C_FUNCTION]
		header: STRING; path: POSIX_PATH_NAME
	do
		header := c_name.to_utf8
		my_functions := functions.reference_at(id)
		if my_functions/=Void and then is_to_be_emitted(header) then
			if on_standard_output then
		 		log(once "Outputting wrapper for functions in file @(1) on standard output.%N",
		 		<<header>>)
		 		output := std_output
		 	else
		 		create path.make_from_string(directory)
		 		path.add_last(class_name.as_lower+once ".e")
		 		-- if path.is_file then
		 		-- 	log(once "Copying existing file @(1) onto @(1).orig.%N",<<path.to_string>>)
		 		-- 	copy_to(path.to_string, path.to_string+once ".orig")
		 		-- end
		 		log(once "Outputting wrapper for functions found in file @(1) on @(2).%N",
		 		<<c_name.as_utf8, path.to_string>>)
		 		create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
		 	end
		 	emit_header_on(output)
			my_functions.do_all(agent {C_FUNCTION}.wrap_on(output))
			emit_footer_on(output)
			output.disconnect
		end
	end
	
	emit_header_on (a_stream: OUTPUT_STREAM) is
			-- Put on `output' the header on an "external" class named 'class_name'
			-- from the beginning until the "feature {} -- External calls" label
			-- included
		require a_stream/=Void
		do
			 a_stream.put_string(automatically_generated_header)
			 a_stream.put_string(deferred_class)
			 a_stream.put_line(class_name) 
			 -- emit_description_on(class_descriptions.reference_at(class_name),a_stream)
			 a_stream.put_string(struct_inherits) --line
			 a_stream.put_line(once "		-- TODO: insert typedefs class")
			 -- a_stream.put_message(once "insert @(1)%N",<<typedefs_class_name>>)
			 a_stream.put_string(externals_header) --line
		end

	emit_footer_on (a_stream: OUTPUT_STREAM) is
		require a_stream/=Void
		do
			a_stream.put_string(once "%Nend -- class ")
			a_stream.put_line  (class_name)
		end

	suffix: STRING is "EXTERNALS"

-- invariant name.is_equal(once U"File")
end

