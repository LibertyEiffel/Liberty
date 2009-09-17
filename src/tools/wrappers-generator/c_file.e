class C_FILE

inherit  
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	STORABLE_NODE

insert 
	EIFFEL_NAME_CONVERTER 
	FILE_TOOLS

creation make

feature 
	store is
		do
			files.put(Current,id)
		end

	emit_functions is
		-- Emit all the function contained into Current file into a deferred class.
	local 
		my_functions: LINKED_LIST[C_FUNCTION]; output: TERMINAL_OUTPUT_STREAM
		class_name, header: STRING; path: POSIX_PATH_NAME

	do
		header := c_name.to_utf8
		my_functions := functions.reference_at(id)
		if my_functions/=Void and then is_to_be_emitted(header) then
			if directory = Void then
				log(once "Outputting wrapper for functions in file @(1) on standard output.%N",
				<<header>>)
				output := std_output
			else
				-- Compute Eiffel class name from header name
				class_name := class_name_from_header(header)
				create path.make_from_string(directory)
				path.add_last(class_name.as_lower+once ".e")
				if path.is_file then
					log(once "Copying existing file @(1) onto @(1).orig.%N",<<path.to_string>>)
					copy_to(path.to_string, path.to_string+once ".orig")
				end
				log(once "Outputting wrapper for functions found in file @(1) on @(2).%N",
				<<header, path.to_string>>)
				create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
			end
			emit_functions_class_header_on(output)

		end
	end
	
	emit_functions_class_headers (a_stream: OUTPUT_STREAM) is
			-- Put on `output' the header on an "external" class named 'class_name'
			-- from the beginning until the "feature {} -- External calls" label
			-- included
		do
			a_stream.append(automatically_generated_header)
			a_stream.append(deferred_class)
			a_stream.append(class_name) -- line
			a_stream.put('%N')
			emit_description_on(class_descriptions.reference_at(class_name),a_stream)
			a_stream.append(struct_inherits) --line
			a_stream.put_message(once "insert @(1)%N",<<typedefs_class_name>>)
			a_stream.append(externals_header) --line
		end


invariant name.is_equal(once U"File")
end

