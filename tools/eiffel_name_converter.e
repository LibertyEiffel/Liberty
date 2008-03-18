deferred class EIFFEL_NAME_CONVERTER

feature -- Auxiliary features
	eiffel_class_file_name (a_name: STRING): STRING is
			-- `a_name' converted into a proper Eiffel class name
			-- file, i.e. "GTK_BUTTON" is turned into "gtk_button.e"
		do
			Result := eiffel_class_name(a_name).as_lower
			Result.append(once ".e")
		end

	eiffel_class_name (a_name: STRING): STRING is
			-- Translate `a_name' from CamelCase into CAMEL_CASE
		do
			create Result.copy(a_name)
			eiffellizer.substitute_all_in(Result)
			Result.to_upper
		end
	
	eiffellizer: REGULAR_EXPRESSION is
			-- Translate CamelCase into Camel_Case
		local builder: REGULAR_EXPRESSION_BUILDER
		once
			Result := builder.convert_perl_pattern("\B([A-Z])")
			Result.prepare_substitution("_\1")
		end

	is_public (a_name: STRING): BOOLEAN is
			-- Does `a_name' not have underscores '_' prefixed?
		require 
			not_void: a_name/=Void
			meaningful_length: a_name.count>1
		do
			Result := (a_name@1 /= '_')
		end

	adapted_name (a_name: STRING): STRING is
			-- 
		do
			-- TODO: make it general. A valid identifier for an eventual
			-- Eiffel feature with `a_name'. Can be either `a_name'
			-- itself or a new string containing an adapatation. Reserved
			-- words are "escaped"
			if keywords.has(a_name) then Result:=a_name+(once "_external")
			else Result:=a_name
			end
		end
	
	longest_prefix_of_children_of (a_node: XML_NODE): INTEGER is
			-- The length of longest prefix common to all direct children
			-- names of `a_node'. Useful to remove the common part of
			-- many enumeration values.
		require 
			non_void_node: a_node/=Void
			node_has_children: a_node.children_count>1
		local 
			char_idx,string_n,lenght: INTEGER; c,e: CHARACTER; found: BOOLEAN; 
			a_name: STRING; some_names: FAST_ARRAY[STRING]
		do
			-- Gather the names of the children and find the shortest one
			create some_names.with_capacity(a_node.children_count)
			from -- Initialization
				a_name:=a_node.child(1).attribute_at(once "name")
				lenght:=a_name.count; string_n:=2
			until string_n>a_node.children_count
			loop
				a_name := a_node.child(string_n).attribute_at(once "name")
				lenght := lenght.min(a_name.count)
				some_names.add_last(a_name)
				string_n:=string_n+1
			end
			-- Find the longest prefix.
			from char_idx:=1 until found or else char_idx>lenght loop 
				from c:=some_names.first.item(char_idx); string_n:=2
				until found or else string_n>=some_names.count 
				loop
					e:=some_names.item(string_n).item(char_idx) 
					debug 
						print("Examining char "+char_idx.out+", string "+string_n.out+
								" '"+e.out+"'%N")
					end
					if c /= e 
					then Result:=char_idx-1; found:=True
					else string_n:=string_n+1
					end
				end	
				char_idx:=char_idx+1
			end
		end

	keywords: ARRAY[STRING] is
		once
			Result:=<<"indexing",
						 "class", "deferred", "expanded", "separate", "end",
						 "inherit", "insert", "creation", "feature",
						 "rename","redefine","undefine","select","export",
						 "require","local","do","once","ensure","alias","external","attribute",
						 "if", "then", "else", "elseif", "when", "from", "until", "loop",
						 "check", "debug", "invariant", "variant",
						 "rescue", "obsolete"
						 >>
		end

end
