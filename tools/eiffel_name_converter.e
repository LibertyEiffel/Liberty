deferred class EIFFEL_NAME_CONVERTER

feature -- Auxiliary features
	eiffel_class_file_name (a_name: STRING): STRING is
			-- `a_name' converted into a proper Eiffel class name
			-- file, i.e. "GTK_BUTTON" is turned into "gtk_button.e"
		require name_not_void: a_name/=Void
		do
			Result := eiffel_class_name(a_name).as_lower
			Result.append(once ".e")
		end

	eiffel_class_name (a_name: STRING): STRING is
			-- Translate `a_name' from CamelCase into CAMEL_CASE; dashes are
			-- converted to underscore 
		require name_not_void: a_name/=Void
		do
			create Result.copy(a_name)
			eiffellizer.substitute_all_in(Result)
			Result.replace_all('-','_')
			Result.to_upper
		end

	eiffel_argument (a_name: STRING): STRING is
		-- Translate `a_name' content into a proper argument placeholder.
		-- "CamelCase" is translated into "a_camel_case", "ENOO" is translated
		-- into "an_enoo". Eventual underscores in front of `a_name' are
		-- removed: "__foo" becomes "a_foo"
	require name_not_void: a_name/=Void
	do
		create Result.copy(a_name)
		-- Remove header underscores.
		from until Result.first/='_' 
		loop Result.remove_first 
		end
		eiffellizer.substitute_all_in(Result)
		Result.to_lower
		
		inspect Result.first 
		when 'a', 'e', 'o', 'i', 'u' then Result.prepend(once "an_") 
		else Result.prepend(once "a_") 
		end
		Result:=adapt(Result)
	end

	eiffellizer: REGULAR_EXPRESSION is
			-- Translate CamelCase into Camel_Case
		local builder: REGULAR_EXPRESSION_BUILDER
		once
			Result := builder.convert_perl_pattern("\B([A-Z]+)")
			Result.prepare_substitution("_\1")
		end

	is_public (a_name: STRING): BOOLEAN is
			-- Does `a_name' start with an alphabetical character? Names 
			-- starting with underscores or other strange characters are 
			-- considered private.
		require 
			not_void: a_name/=Void
			meaningful_length: a_name.count>1
		do
			Result := a_name.first.is_letter
		ensure 
		end

	is_valid_class_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' valid as an Eiffel class name? i.e. does it 
			-- start with an upper-case letter and contain only 
			-- upper-case letters, underscores and numbers?
		require a_name/=Void
		local i: INTEGER; c: CHARACTER
		do
			Result:=a_name.first.is_upper
			from i:=2 until Result=False or else i<=a_name.upper 
			loop
				c := a_name@i
				Result := c.is_upper or else c.is_digit or else c='_'
				i:=i+1
			end
		end

	adapt (a_name: STRING): STRING is
			-- A valid, adapted identifier for an Eiffel feature labelled
			-- `a_name'. Can be either `a_name' itself or a new string
			-- containing an adapatation. Reserved words and those of
			-- features belonging to ANY are "escaped".
		do
			if keywords.has(a_name) or else any_features.has(a_name)
			then Result:=a_name+(once "_external")
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
					-- debug print("Examining char "+char_idx.out+", string 
					-- "+string_n.out+" '"+e.out+"'%N") end
					if c /= e 
					then Result:=char_idx-1; found:=True
					else string_n:=string_n+1
					end
				end	
				char_idx:=char_idx+1
			end
		end

	keywords: HASHED_SET[STRING] is
		once
			Result := {HASHED_SET[STRING]
			<<"indexing",
			  "class", "deferred", "expanded", "separate", "end",
			  "inherit", "insert", "creation", "feature",
			  "rename","redefine","undefine","select","export",
			  "require","local","do","once","ensure","alias","external","attribute",
			  "if", "then", "else", "elseif", "when", "from", "until", "loop",
			  "check", "debug", "invariant", "variant",
			  "rescue", "obsolete"
			  >>}
		end

	any_features: HASHED_SET[STRING] is
			-- The names of the features contained in class ANY. A
			-- wrapper can either add a proper prefix or suffix to the
			-- feature s/he is wrapping or
		once 
			-- The following "static" definition of the features of ANY
			-- is somehow unacceptable in a perfect world. Yet computing
			-- it each and every time would enlarge the memory usage of
			-- the program wildly, not counting the runtime requirements. 
			Result:= {HASHED_SET[STRING]
			<<"generating", "generator",
			  "same_dynamic_type", "is_equal",
			  "standard_is_equal", "is_deep_equal",
			  "twin", "copy", 
			  "standard_twin", "standard_copy",
			  "deep_twin", 
			  "default", "is_default",
			  "print_on",   "tagged_out",
			  "out", "out_in_tagged_out_memory",
			  "tagged_out_memory", "fill_tagged_out_memory",
			  "to_pointer", "is_basic_expanded_type",
			  "object_size">>}
		end
end
