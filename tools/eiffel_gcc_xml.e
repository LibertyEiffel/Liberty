indexing
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class EIFFEL_GCC_XML


	-- Implementation notes: types are identified by id.
insert 
	ARGUMENTS
	FILE_TOOLS
	EIFFEL_NAME_CONVERTER

creation make

feature -- Initialization
	make is
		do
			process_arguments

			if input.is_connected then
				create files.make
				create functions.make 
				create headers.make
				create structures.make
				create enumerations.make
				create types.make
				create typedefs.make
				create pointer_types.make
				create fields.make
				debug create node_names.make end

				if verbose then io.put_line(once "Reading XML file.") end
				create_tree 
				if verbose then io.put_line(once "Examining XML tree.") end
				visit(tree.root)

				debug print_node_names end

				if verbose then io.put_line(once "Making external functions classes.") end
				make_external_class
 
				if verbose then io.put_line(once "Making structure accessing classes.")	end
				make_structures

				if verbose then io.put_line(once "Making enumerations classes.")	end
				enumerations.do_all(agent emit_enumeration)
			else std_error.put_line(once "File not found.")
			end
		end

	process_arguments is
		local i: INTEGER; arg: STRING
		do
			global:=True
			from i:=1 until i>argument_count loop 
				arg := argument(i)
				if arg.is_equal(once "--local") then global:=False
				elseif arg.is_equal(once "--global") then global:=True
				elseif arg.is_equal(once "--plugin") then
					i:=i+1
					if i<=argument_count then
						location:=argument(i)
						i:=i+1
						if i<=argument_count then
							module:=argument(i)
						end
					end
				elseif arg.is_equal(once "--header") then
					not_yet_implemented
				elseif file_exists(arg) then 
					-- Current arg should be the XML file. The following 
					-- are headers to process.
					create {TEXT_FILE_READ} input.connect_to(arg)
					from i:=i+1 until i>argument_count loop
						headers.add(argument(i))
						i:=i+1
					end
				elseif (arg.is_equal(once "--verbose") or else 
						  arg.is_equal(once "-v")) then verbose:=True
				else print_usage
				end
				i:=i+1
			end
			if input=Void then
				if verbose then  io.put_line(once "Using standard input.") end
				input:=std_input
			end
		end

	print_usage is
		do
			std_error.put_line 
			(once 
			 "[
			  eiffel_gcc_xml [--verbose|-v] [--local] [--global] [--plugin location module] output.gcc-xml filenames....
			  
			  --local    produces functions, structures and enumeration 
							 classes only for the given files. Otherwise all the 
							 necessary file will be created. This is the default
							 Only the last global and local flag will be considered.
			  
			  --global   emits wrappers for every features found in the XML 
							 file. For usual wrappers it is normally not needed.
							 Only the last global and local flag will be considered.

			  --plugin location module
							 Emits classes that uses the plugin mechanism instead 
							 of the more traditional C external clauses. location 
							 and module arguments are mandatory; it often useful 
							 to quote them.

			  --header file 
							 Use file as header file in external features instead 
							 of the file where the feature actually reside. Useful
							 for many libraries which provides a single header that
							 includes all the library features.

			  -v --verbose   
							 Turn on verbose output, printing information about the
							 ongoing operations.
			  ]")
			die_with_code (exit_success_code)
		end

	create_tree is
		do
			create tree.make(input)
		rescue
			io.put_string
			("[
			  Couldn't correctly parse XML file because current
			  implementation of XML parser in SmartEiffel 2.3 standard
			  library has some glitches.  

			  As a temporary solution you can recompile this program
			  replacing the original XML_TREE and XML_CALLBACKS with
			  those found in workaround directory.  
			  ]")
		end

	visit (a_node: XML_NODE) is
		require node_not_void: a_node/=Void
		local i: INTEGER; a_child: XML_NODE; c_name,file,file_id,id: STRING;
			functions_in_file: LINKED_LIST[XML_NODE]
		do
			debug node_names.add(a_node.name) end
			c_name := a_node.attribute_at(once "name")
			file_id := a_node.attribute_at(once "file")
			id := a_node.attribute_at(once "id")

			inspect a_node.name
			when "Function" then 
				check file_id/=Void end
				functions_in_file := functions.reference_at(file_id)
				if functions_in_file=Void then
					-- This is the first function belonging to `file'
					-- found. Let's add a list for them.
					create functions_in_file.make
					functions.add(functions_in_file, file_id)
				end
				functions_in_file.add_last(a_node)
			when "Struct" then 
				check file_id/=Void end
				if c_name/=Void then
					if global or else headers.has(file_id) then 
						structures.fast_put(a_node,c_name)
					else 
						if verbose then io.put_line(a_node.name+" skipped: defined in an included file. ") end
					end
				else -- void name
					if verbose then io.put_line("Skipping nameless structure in line "+a_node.line.out) end
				end
			when "Field" then 
				check id_not_void: id/=Void end
				fields.fast_put(a_node, id)
			when "Enumeration" then 
				check file_id/=Void; c_name/=Void end
				if global or else files.has(file) then 
					enumerations.fast_put(a_node,c_name)
				else
					if verbose then
						io.put_line(a_node.name+" skipped: defined in an included file. ") 
					end
				end
				-- Type system
			when "FundamentalType" then 
					check id/=Void end
				types.put(a_node,id)
			when "Typedef" then 
				check file_id/=Void; id/=Void end
				if global or else files.has(file) then 
					types.put(a_node,id)
					typedefs.add_last(a_node)
				else 
					debug io.put_line(a_node.name+" skipped: defined in an included file. ") end
				end
			when "PointerType" then 
				check id_not_void: id/=Void end
				types.put(a_node,id)
				pointer_types.add(id)

				-- The rest
			when "File" then 
				check c_name/=Void end
				files.fast_put(a_node,c_name)
			else 
				-- Ignoring other nodes: Ellipsis (which stands for
				-- the feared variadic functions), ArrayType,
				-- Argument, EnumValue, GCC_XML,
				-- CvQualifiedType, Namespace, FunctionType,
				-- Variable, Union, ReferenceType,
				-- Recursively visit all children:
				from i:=1 until i>a_node.children_count loop
					a_child := a_node.child(i)
					if a_child/=Void then visit(a_child) end
					i:=i+1
				end
			end
		end
	
feature -- Creation of external classes
	make_external_class is
		do
			output := std_output
			functions.do_all(agent emit_functions)
		end

	emit_functions (some_functions: LINKED_LIST[XML_NODE]; a_file: STRING) is
		require 
			not_void_functions: some_functions/=Void 
			file_not_void: a_file/=Void
		local iterator: ITERATOR[XML_NODE]; a_function: XML_NODE; a_name: STRING
		do
			-- Performance-wise code repetition
			if use_plugin then 
				if global or else headers.has(a_file) then
					iterator:=some_functions.get_new_iterator			
					from iterator.start until iterator.is_off loop
						emit_plugin_function(a_function,a_name)
						iterator.next
					end
				end -- if global 
			else -- use externals
				if global or else headers.has(a_file) then
					iterator:=some_functions.get_new_iterator			
					from iterator.start until iterator.is_off loop
						emit_function(a_function,a_name)
						iterator.next
					end
				end -- if global 
			end
		end
	
	emit_plugin_function (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
			name_not_void: a_name/=Void
		do
			not_yet_implemented
		end

	emit_function (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
			name_not_void: a_name/=Void
		local 
			name, returns, argument_placeholder: STRING
			an_argument: XML_NODE; i: INTEGER; variadic: BOOLEAN
		do 
			name := a_node.attribute_at(once "name")
			returns := a_node.attribute_at(once "returns")	
			output.put_string("Function "+name)
			if a_node.children_count>0 then 
				output.put_string(once " (")
				from i:=1 until i>a_node.children_count loop
					an_argument :=a_node.child(i)
					argument_placeholder := an_argument.attribute_at(once "name")
					if argument_placeholder /= Void and then 
						an_argument.name.is_equal(once "Argument") then 
						output.put_string(argument_placeholder)
						output.put_string(once ": ")
						output.put_string(eiffel_type_of(an_argument))
						output.put_string(once "; ")
					elseif an_argument.name.is_equal(once "Ellipsis") then variadic := True
					end
					i := i+1
				end
				output.put_string(once ")")
			end
			-- emit return type
			output.put_line(once " is")
			if variadic then 
				output.put_line(variadic_function_note) 
			end
		end

feature -- Creation of structure classes
	make_structures is
		local
			typedef, structure: XML_NODE; iterator: ITERATOR[XML_NODE];
			name, referred_type, file_name, file_id: STRING
		do
			structures.do_all(agent emit_structure)

			-- Many structures are often "hidden behind" a typedef.
			-- typedefs.do_all(agent emit_typedeffed_structure)
			iterator := typedefs.get_new_iterator
			from iterator.start until iterator.is_off loop
				typedef := iterator.item
				referred_type := typedef.attribute_at(once "type")
				name := typedef.attribute_at(once "name")
				check  
					referred_type_not_void: referred_type/=Void
					name_not_void: name/=Void
				end
				structure := structures.reference_at(referred_type)
				if structure/=Void then
					-- Referred type is actually a structure
					file_id := structure.attribute_at(once "file")
					file_name := files.at(file_id).attribute_at(once "name")
					if global or else headers.has(file_name) then 
						put_strings (std_output, 
										 << once "Wrapping typedef structure ",
											 name>>)
						if use_plugin then emit_plugin_structure(structure,name)
						else emit_structure(structure, name)
						end
					else -- structure not in a desired header
						if verbose then io.put_line(structure.name+" skipped: defined in an included file. ") end
					end
				end -- void structure
				iterator.next
			end
		end

	emit_plugin_structure (a_node: XML_NODE; structure_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Struct")
			name_not_void: structure_name/=Void
		do
			not_yet_implemented
		end

	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Struct")
			name_not_void: structure_name/=Void
		local 
			classname, filename, id, members, fieldname: STRING; 
			field: XML_NODE; 
			members_iter: ITERATOR[STRING]
			file: TEXT_FILE_WRITE
		do 
			if is_public(structure_name) then
				classname := eiffel_class_name(structure_name)+(once "_STRUCT")
				filename := eiffel_class_file_name(structure_name+once "_struct")
				put_strings (std_output, 
								 << once "Wrapping structure ",
									 structure_name, once " to class ",
									 classname, once " in file ",
									 filename>>)
				create file.connect_to (filename)
				if file.is_connected then 
					put_strings
					(file,
					 << automatically_generated_header,
						 once "deferred class ",classname,
						 once "[

								 inherit ANY undefine is_equal, copy end
								 
								 feature {} -- getters
								 ]" >>)
					members := a_node.attribute_at(once "members")
					if members/=Void then
						members_iter := members.split.get_new_iterator
						from members_iter.start until members_iter.is_off loop
							id := members_iter.item
							field := fields.reference_at(id)
							fieldname := field.attribute_at(once "name")
							if field/=Void then
								put_strings 
								(file,
								 <<once "get_",fieldname,
									once " (a_structure: POINTER): ",
									eiffel_type_of(field),
									once " is %N%T%Texternal %"C struct ",
									structure_name, once " get ", fieldname
									once " use <",
									header,
									once ">%"%N%Tend%N">>)
								if verbose then
									std_output.put_string(once " ")
									std_output.put_string(field.attribute_at(once "name"))
								end
							else -- Void field
								if verbose then
									io.put_string("(no field with id "+id+" probably a Constructor) ") 
								end
							end -- field is void?
							members_iter.next
						end -- loop over members
					else -- void members
						if verbose then
							std_output.put_line("Found a structure with no fields")
						end
					end
					put_strings(file, <<"end -- class ",classname>> )
					file.disconnect
				else put_strings (std_output, 
										<< once "Couldn't open file ",
											filename>>)
				end -- if file.is_connected
			else put_strings(std_output,<<structure_name, once " is not public">>)
			end -- name is public
		end

feature -- Creation of enumeration classes
	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Enumeration")
			name_not_void: a_name/=Void
		local i: INTEGER; a_child: XML_NODE; value: STRING
		do 
			io.put_string("Enumeration "+a_name+"[")
			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child.name.is_equal(once "EnumValue") then
					value := a_child.attribute_at(once "name")
					check value/=Void end
					io.put_string(value); io.put_string(once ", ") 
				else  debug io.put_string("Unhandled child in Enumeration at line"+a_child.line.out) end
				end
				i:=i+1
			end
			io.put_line(once "]")
		end

feature -- Type-system translations
	eiffel_type_of (an_argument: XML_NODE): STRING is
		local id: STRING
		do
			id := an_argument.attribute_at(once "type")
			if id/=Void and then pointer_types.has(id) 
			 then	Result := once "POINTER" 
			else  Result := once "unknown" 
			end
		ensure not_void: Result/=Void
		end
		
	is_public (a_name: STRING): BOOLEAN is
			-- Does `a_name' not have underscores '_' prefixed?
		require 
			not_void: a_name/=Void
			meaningful_length: a_name.count>1
		do
			Result := not (a_name@1).is_equal('_')
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
	
feature -- Data 
	global: BOOLEAN
	verbose: BOOLEAN

	header: STRING
	use_plugin: BOOLEAN
	location: STRING
	module: STRING
			-- Plugin related settings

	input: INPUT_STREAM
	output: OUTPUT_STREAM

	headers: HASHED_SET[STRING]

	tree: XML_TREE
	files, structures, enumerations, types: HASHED_DICTIONARY [XML_NODE, STRING]
			-- Files, structures, enumeration, types by their name

	functions: HASHED_DICTIONARY[LINKED_LIST[XML_NODE], STRING]
			-- Functions grouped by the id of the file they are defined
			-- in, i.e. "f0" "f12".
	
	typedefs: LINKED_LIST[XML_NODE]

	fields: HASHED_DICTIONARY [XML_NODE, STRING]
			-- Fields by their id

	pointer_types: HASHED_SET[STRING]
			-- Ids of pointer types

	node_names: HASHED_SET[STRING]

feature {} -- Constants
	variadic_function_note: STRING is "%T%T%T-- Aaargh! A dreadful variadic call"
	
	automatically_generated_header: STRING is
		"[
		 -- This file have been created by eiffel-gcc-xml.
		 -- Any change will be lost by the next execution of the tool.
		 
		 ]"
	
	keywords: ARRAY[STRING] is
		once
			Result:=<<"indexing",
						 "class", "deferred", "expanded", "separate", "end",
						 "inherit", "insert", "creation", "feature",
						 "rename","redefine","undefine","select","export",
						 "require","local","deferred","do","once","ensure","alias","external","attribute",
						 "if", "then", "else", "elseif", "when", "from", "until", "loop",
						 "check", "debug", "invariant", "variant",
						 "rescue", "obsolete"
						 >>
		end

feature {} -- Auxiliary features
	put_strings (a_file: OUTPUT_STREAM; some_strings: COLLECTION[STRING]) is
		local i: ITERATOR[STRING]
		do
			from i:=some_strings.get_new_iterator; i.start until i.is_off loop
				a_file.put_string(i.item)
				i.next
			end
			a_file.put_new_line
		end

	print_node_names is
		require node_names/=Void 
		local i: ITERATOR[STRING]
		do
			io.put_string(once "Known nodes: ")
			i := node_names.get_new_iterator
			from i.start until i.is_off loop
				io.put_string(i.item)
				io.put_string(once ", ")
				i.next
			end
			io.put_new_line
		end	
end 
