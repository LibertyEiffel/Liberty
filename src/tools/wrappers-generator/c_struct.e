class C_STRUCT
	-- A "Struct" node of an XML file made by gccxml.
inherit 
	GCCXML_NODE 
	CONTEXTED_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	FILED_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPED_BY_A_CLASS

insert NAME_CONVERTER

creation make

feature 
	store is
		do
			types.put(Current,id)
			-- if c_name/=Void and then is_public(c_name) then 
			-- if is_public then
			structures.fast_put(Current,id)
			--end
		end
	
	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False
	
	wrapper_type: STRING is 
		do
			debug 
				print(once 
				"C_STRUCT.wrapper_type requires creation%
				% of external/expanded types; currently returning an empty string")
			end
			not_yet_implemented -- Result := class_name
		end

	emit_wrapper is
		-- Emit a reference wrapper for Current C structure.

		-- A reference wrapper handles the structure as a memory area referred by a pointer.
		-- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types" 
	local path: POSIX_PATH_NAME
	do
		if is_public and then is_in_main_namespace then
			--if unwrappable then
			--	buffer.put_message(once "%T-- @(1) is not wrappable",
			--	<<a_structure_name>>)
			--	buffer.print_on(output)
			--	output.flush
			--	output.disconnect
			--else
			if on_standard_output then
					log(once "Outputting wrapper for struct @(1) on standard output.%N", <<c_string_name>>)
		 		output := std_output
		 	else
		 		create path.make_from_string(directory)
		 		path.add_last(class_name.as_lower+once ".e")

			end
			--		filename := a_structure_name + once "_struct"
			--		class_name := eiffel_class_name(filename)
			--		if directory = Void then
			--			-- Output to standard output
			--			output := std_output
			--			log(once "Struct @(1) on @(2) to standard output%N",
			--			<<a_structure_name, class_name>>)
			--		else
			--			create path.make_from_string(directory)
			--			path.add_last(eiffel_class_file_name(filename))
			--			filename := path.to_string
			--			if path.is_file then
			--				log(once "Copying existing file @(1) onto @(1).orig.%N",<<filename>>)
			--				copy_to(filename, filename+once ".orig")
			--			end
	
			--			log(once "Struct @(1) to @(2) in @(3)%N",
			--			<<a_structure_name, class_name, filename>>)
			--			create {TEXT_FILE_WRITE} output.connect_to(filename)
			--		end
			--		append_structure_header(a_structure_name)
			--		buffer.print_on(output)
			--		append_structure_members(a_node, a_structure_name)
			--		append_structure_size(a_node,a_structure_name)
			--		output.put_string(once "end%N")
			--		output.flush
			--		output.disconnect
			--	else
			--		log(once "Struct @(1) skipped%N", <<a_structure_name>>)
			--	end
		end
	end

	append_structure_header (a_structure_name: STRING) is
			-- Append the header of a structure named `a_structure_name' to buffer.
		require
			a_structure_name /= Void
		--local structure_class_name: STRING
		do
	--		structure_class_name:=eiffel_class_name(a_structure_name)
	--		structure_class_name.append(once "_STRUCT")
	--		buffer.append(automatically_generated_header)
	--		buffer.append(deferred_class)
	--		buffer.append(structure_class_name)
	--		emit_description(class_descriptions.reference_at(class_name))
	--		buffer.append(struct_inherits)
	--		buffer.put_message(once "insert @(1)%N",<<typedefs_class_name>>)
		ensure
			buffer_grew: buffer.count > old buffer.count
		end

	append_structure_members (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		require
			node_not_void: a_node /= Void
			name_not_void: a_structure_name /= Void
		-- local
		--	id, members: UNICODE_STRING; members_iter: ITERATOR[UNICODE_STRING]; field: XML_COMPOSITE_NODE
		do
	--		-- setters.reset; queries.reset
	--		members := a_node.attribute_at(once U"members")
	--		if members /= Void then
	--			setters.append(setters_header)
	--			queries.append(queries_header)
	--			members_iter := members.split.get_new_iterator
	--			from members_iter.start until members_iter.is_off
	--			loop
	--				id := members_iter.item
	--				field := fields.reference_at(id)
	--				if field /= Void then emit_structure_field(field, a_structure_name)
	--				else
	--					log(once "@(1) in @(2) is not a field but probably a C++ constructor.%N",
	--					<<id.as_utf8, a_structure_name>>)
	--				end
	--				members_iter.next
	--			end
	--			setters.print_on(output)
	--			queries.print_on(output)
	--		else
	--			output.put_string(once "%T-- Fieldless structure%N")
	--			log(once "Structure @(1) have no fields%N", <<a_structure_name>>)
	--		end
		end

	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		-- Append a query for `a_field' of a structure named
		-- `a_structure_name' (defined in `an_header') to `queries'
		-- and a setter to `setters'.
	require
		a_field /= Void
		a_structure_name /= Void
		is_field_node: a_field.name.is_equal(once U"Field")
	do
	end

	append_structure_size (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		-- Append to `output' the `struct_size' query for `a_structure_name'
	require
		node_not_void: a_node /= Void
		is_structure_node: a_node.name.is_equal(once U"Struct")
		name_not_void: a_structure_name /= Void
	do
		-- deferred
	end

	suffix: STRING is "_STRUCT"
-- invariant name.is_equal(once U"Struct")
end

