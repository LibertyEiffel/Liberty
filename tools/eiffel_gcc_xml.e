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
		local input: INPUT_STREAM
		do
			if argument_count<1 then
				debug io.put_line(once "Using standard input.") end
				input:=std_input
			else create {TEXT_FILE_READ} input.connect_to(argument(1))
			end

			if input.is_connected then
				create tree.make(input)
				create files.make
				create functions.make 
				create structures.make
				create enumerations.make
			
				visit(tree.root)
				functions.do_all(agent emit_function)
				structures.do_all(agent emit_structure)
				enumerations.do_all(agent emit_enumeration)

			end
		--rescue
		--	io.put_string
		--	("[
		--	  Current implementation of XML parser in SmartEiffel 2.3 standard library has some glitches.
		--	  
		--	  Please recompile this program replacing the original XML_TREE and XML_CALLBACKS with those
		--	  found in workaround directory. This is a temporary "solution".
		--	  ]")
		end

	visit (a_node: XML_NODE) is
		require node_not_void: a_node/=Void
		local i: INTEGER; a_child: XML_NODE; c_name: STRING
		do
			c_name := a_node.attribute_at(once "name")
			if c_name/=Void then
				inspect a_node.name
				when "Function" then functions.fast_put(a_node,c_name)
				when "Struct" then structures.fast_put(a_node,a_node.attribute_at(once "name"))
				when "Enumeration" then enumerations.fast_put(a_node,a_node.attribute_at(once "name"))
				when "File" then files.fast_put(a_node,a_node.attribute_at(once "name"))
				else -- Ignoring
				end
			end
			-- recursively visit all children
			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child/=Void then visit(a_child) end
				i:=i+1
			end
		end

	visit_function (a_node: XML_NODE) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
		local i: INTEGER; str, file,returns: STRING
		do 
			file := a_node.attribute_at(once "file")
			returns := a_node.attribute_at(once "returns")
			
			-- if (once "returns").is_equal(a_node.
			str := a_node.name.twin
			from i:=1 until i>a_node.attributes_count loop
				str.append(a_node.attribute_name(i))
				str.append(once ": '")
				str.append(a_node.attribute_value(i))
				str.append(once "' ")
				i:=i+1
			end
			io.put_line(str)
		end

	emit_function (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
			name_not_void: a_name/=Void
		local file,returns: STRING; an_argument: XML_NODE; i: INTEGER
		do 
			file := a_node.attribute_at(once "file")
			returns := a_node.attribute_at(once "returns")			
			io.put_string("Function "+a_node.attribute_at(once "name"))
			if a_node.children_count>0 then 
				io.put_string(once " (")
				from i:=1 until i>a_node.children_count-1 loop
					an_argument := a_node.child(i)
					i := i + 1
					if an_argument.name.is_equal(once "Argument") then
						io.put_string(an_argument.attribute_at(once "name"))
						io.put_string(once ", ")
					end
				end
				an_argument := a_node.child(a_node.children_count)
				if an_argument.name.is_equal(once "Argument") then
					io.put_string(an_argument.attribute_at(once "name"))
				end
				io.put_line(once ") is")
			end
		end

	emit_structure (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Struct")
			name_not_void: a_name/=Void
		do 
			io.put_line("Structure "+a_node.attribute_at(once "name"))
		end

	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Enumeration")
			name_not_void: a_name/=Void
		do 
			io.put_line("Enumeration "+a_node.attribute_at(once "name"))
		end

feature 
	tree: XML_TREE
	files, functions, structures, enumerations: HASHED_DICTIONARY [XML_NODE, STRING]

end 
