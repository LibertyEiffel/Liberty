deferred class EIFFEL_NAME_CONVERTER
	-- Query features to discover if a symbol name does comply to SmartEiffel's
	-- naming rules and to convert arbitrary C symbols into valid Eiffel names
	-- of classes or features.

insert
	PLATFORM
	EXCEPTIONS

feature {ANY} -- Auxiliary features
	eiffel_class_file_name (a_name: STRING): STRING is
			-- `a_name' converted into a proper Eiffel class name
			-- file, i.e. "GTK_BUTTON" is turned into "gtk_button.e"
		require
			name_not_void: a_name /= Void
		do
			Result := eiffel_class_name(a_name).as_lower
			Result.append(once ".e")
		ensure
			Result /= a_name
		end

	class_name_from_header (a_header: STRING): STRING is
		-- The Eiffel class name for 'a_header'; extension is removed,
		-- CamelCase is converted into CAMEL_CASE, dashes are converted to
		-- underscores, "EXTERNALS" is added at the end; i.e.:
		-- class_name_from_header("/usr/include/foo/bar/maman.h").is_equal("MAMAN_EXTERNALS")
	require header_not_void: a_header/=Void
	do
		class_path.make_from_string(a_header)
		Result := class_path.last
		Result.remove_tail(class_path.extension.count)
		check
			no_final_dot_if_this_fails_add_one_above: Result.last/='.' 
		end
		eiffellizer.substitute_all_in(Result)
		Result.replace_all('-','_')
		Result.to_upper
		Result.append(once "_EXTERNALS")
	ensure 
		non_void: Result/=Void
		is_valid_class_name(Result)
	end

	eiffel_class_name (a_name: STRING): STRING is
			-- Translate `a_name' from CamelCase into CAMEL_CASE; dashes are
			-- converted to underscore
		require
			name_not_void: a_name /= Void
		do
			create Result.copy(a_name)
			eiffellizer.substitute_all_in(Result)
			Result.replace_all('-', '_')
			Result.to_upper
		ensure
			Result /= Void
			Result /= a_name
			is_valid_class_name(Result)
		end

	eiffel_feature (a_name: STRING): STRING is
		-- Translate `a_name' content into a proper feature name for
		-- the Gnu-Eiffel language.  "CamelCase" is translated into
		-- "camel_case", "ENOO" is translated into "enoo". Eventual
		-- underscores in front of `a_name' are removed: "__foo" becomes
		-- "foo"
	require 
		name_not_void: a_name /= Void
	do
		create Result.copy(a_name)
		-- Remove header underscores.
		from
		until
			Result.first /= '_'
		loop
			Result.remove_first
		end
		eiffellizer.substitute_all_in(Result)
		Result.to_lower
		Result := adapt(Result)
	end

 	eiffel_argument (a_name: STRING): STRING is
			-- Translate `a_name' content into a proper argument placeholderi for
			-- the Gnu-Eiffel language.  "CamelCase" is translated into
			-- "a_camel_case", "ENOO" is translated into "an_enoo". Eventual
			-- underscores in front of `a_name' are removed: "__foo" becomes
			-- "a_foo". See also `eiffel_feature'.
		require
			name_not_void: a_name /= Void
		do
			Result := eiffel_feature(a_name)
			inspect Result.first
			when 'a', 'e', 'o', 'i', 'u' then Result.prepend(once "an_")
			else Result.prepend(once "a_")
			end
			-- The following call should be unnecessary, since we hade already
			-- prepended an English preposition that does not appear in any
			-- SmartEiffel keywords.
			-- Result := adapt(Result)
		end

	eiffellizer: REGULAR_EXPRESSION is
			-- Translate CamelCase into Camel_Case
		local
			builder: REGULAR_EXPRESSION_BUILDER
		once
			Result := builder.convert_perl_pattern("\B([A-Z]+)")
			Result.prepare_substitution("_\1")
		end

	is_public (a_name: STRING): BOOLEAN is
			-- Does `a_name' start with an alphabetical character? Names
			-- starting with underscores or other strange characters are
			-- usually considered private in C/C++ languages.
		require
			not_void: a_name /= Void
			meaningful_length: a_name.count > 1
		do
			Result := a_name.first.is_letter
		end

	is_valid_class_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' valid as an Eiffel class name? i.e. does it
			-- start with an upper-case letter and contain only
			-- upper-case letters, underscores and numbers?
		require
			a_name /= Void
		local
			i: INTEGER; c: CHARACTER
		do
			Result := a_name.first.is_upper
			from
				i := 2
			until
				Result = False or else i <= a_name.upper
			loop
				c := a_name @ i
				Result := c.is_upper or else c.is_digit or else c = '_'
				i := i + 1
			end
		end

	adapt (a_name: STRING): STRING is
			-- A valid, adapted identifier for an Eiffel feature labelled
			-- `a_name'. Can be either `a_name' itself or a new string
			-- containing an adapatation. Reserved words and those of
			-- features belonging to ANY are "escaped", append "_external".
		do
			if keywords.has(a_name) or else any_features.has(a_name) then
				Result := a_name + once "_external"
			else
				Result := a_name
			end
		end

	longest_prefix_of_children_of (a_node: XML_COMPOSITE_NODE): INTEGER is
			-- The length of longest prefix common to all direct children
			-- names of `a_node'. Useful to remove the common prefix of
			-- many enumeration values.
		require
			non_void_node: a_node /= Void
			node_has_children: a_node.children_count > 1
		local
			char_idx, child_n, lenght: INTEGER; c, e: INTEGER_32; found: BOOLEAN; a_name: UNICODE_STRING
			names: FAST_ARRAY[UNICODE_STRING]; a_child: XML_COMPOSITE_NODE
		do
			-- Gather XML_COMPOSITE_NODE children, their names and find the
			-- shortest one.
			create names.with_capacity(a_node.children_count)
			from
				child_n := 1
				lenght := Maximum_integer
			until
				child_n >= a_node.children_count
			loop
				a_child ?= a_node.child(child_n)
				if a_child /= Void then
					a_name := a_child.attribute_at(once U"name")
					names.add_last(a_name)
					lenght := lenght.min(a_name.count)
				else
					raise("Found a non-XML_COMPOSITE_NODE xml child")
				end
				child_n := child_n + 1
			end
			-- Find the longest prefix.
			from
				char_idx := 1
			until
				found or else char_idx > lenght
			loop
				from
					c := names.first.item(char_idx)
					child_n := 2
				until
					found or else child_n >= names.count
				loop
					e := names.item(child_n).item(char_idx)
					-- debug print("Examining char "+char_idx.out+", string
					-- "+child_n.out+" '"+e.out+"'%N") end
					if c /= e then
						Result := char_idx - 1
						found := True
					else
						child_n := child_n + 1
					end
				end
				char_idx := char_idx + 1
			end
			debug
				print(once "Longest common prefix of ")
				from child_n := 1
				until child_n >= a_node.children_count
				loop
					a_child ?= a_node.child(child_n)
					if a_child /= Void then
						print (a_child.attribute_at(once U"name").as_utf8)
						print (once " ")
					end
					child_n := child_n + 1
				end
				print(once "is ") print(Result.to_string) print(once ".%N")
			end
		end

feature {} -- Constants 
	class_path: POSIX_PATH_NAME is
		-- Shared path buffer used in 'class_name_from_header'.
	once
		create Result.make_empty
	end

	keywords: HASHED_SET[STRING] is
		once
			Result := {HASHED_SET[STRING] << "indexing", "class", "deferred", "expanded", "separate", "end", "inherit", "insert", "creation", "feature", "rename", "redefine", "undefine", "select", "export", "require", "local", "do", "once", "ensure", "alias", "external", "attribute", "if", "then", "else", "elseif", "when", "from", "until", "loop", "check", "debug", "invariant", "variant", "rescue", "obsolete" >> }
		end

	any_features: HASHED_SET[STRING] is
			-- The names of the features contained in class ANY. A
			-- wrapper can either add a proper prefix or suffix to the
		once
			-- The following "static" definition of the features of ANY
			-- is somehow unacceptable in a perfect world. Yet computing
			-- it each and every time would enlarge the memory usage of
			-- the program wildly, not counting the runtime requirements.
			Result := {HASHED_SET[STRING] << "generating", "generator", "same_dynamic_type", "is_equal", "standard_is_equal", "is_deep_equal", "twin", "copy", "standard_twin", "standard_copy", "deep_twin", "default", "is_default", "print_on", "tagged_out", "out", "out_in_tagged_out_memory", "tagged_out_memory", "fill_tagged_out_memory", "to_pointer", "is_basic_expanded_type", "object_size" >> }
		end

end -- class EIFFEL_NAME_CONVERTER

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
