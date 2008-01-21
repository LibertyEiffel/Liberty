indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

insert ARGUMENTS

creation make

feature
	make is
		do
			if argument_count<1 then
				debug io.put_line(once "Using standard input.") end
				input:=std_input
			else create {TEXT_FILE_READ} input.connect_to(argument(1))
			end

			if input.is_connected then
				create_tree
				create files.make
				create functions.make 
				create structures.make
				create enumerations.make
				create types.make
				debug create node_names.make end

				visit(tree.root)
				debug print_node_names end
 				make_external_class
				structures.do_all(agent emit_structure)
				enumerations.do_all(agent emit_enumeration)
			end
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
		local i: INTEGER; a_child: XML_NODE; c_name,file: STRING
		do
			debug node_names.add(a_node.name) end
			c_name := a_node.attribute_at(once "name")
			file := a_node.attribute_at(once "file")
			if file/=Void then 
				if file.is_equal(once "f0") and 
					c_name/=Void then
					inspect a_node.name
					when "Function" then functions.fast_put(a_node,c_name)
					when "Struct" then structures.fast_put(a_node,c_name)
					when "Enumeration" then enumerations.fast_put(a_node,c_name)
					when "File" then files.fast_put(a_node,c_name)
					when "FundamentalType" then -- add_type(a_node,c_name)
					when "Typedef" then -- add_type(a_node,c_name)
					else 
						-- Ignoring other nodes: Ellipsis (which stands for
						-- the feared variadic functions), ArrayType,
						-- Argument, PointerType, EnumValue, GCC_XML,
						-- CvQualifiedType, Namespace, FunctionType,
						-- Variable, File, Field, Union, ReferenceType,
					end
				else 
					debug
						io.put_string(once "Skipping ") 
						io.put_line(a_node.name +" in line "+a_node.line.out) 
					end
				end
			end

			-- recursively visit all children
			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child/=Void then visit(a_child) end
				i:=i+1
			end
		end
	

feature -- Creation of external class
	make_external_class is
		do
			output := std_output
			functions.do_all(agent emit_function)
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
						-- output.put_string(once ": ")
						-- output.put_string(eiffel_type_of(an_argument.attribute_at(once "type")))
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

	eiffel_type_of (a_type: STRING): STRING is
		do
		ensure implemented: False
		end
		
feature -- Creation of structure classes
	emit_structure (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Struct")
			name_not_void: a_name/=Void
		do 
			io.put_line("Structure "+a_node.attribute_at(once "name"))
		end

feature -- Creation of enumeration classes
	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Enumeration")
			name_not_void: a_name/=Void
		do 
			io.put_line("Enumeration "+a_node.attribute_at(once "name"))
		end

feature 
	input: INPUT_STREAM
	output: OUTPUT_STREAM

	tree: XML_TREE
	files, functions, structures, enumerations, types: HASHED_DICTIONARY [XML_NODE, STRING]

	node_names: HASHED_SET[STRING]

feature {} -- Constants
	variadic_function_note: STRING is "%T%T%T-- Aaargh! A dreadful variadic call"
				
feature {} -- Auxiliary features for debug
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
