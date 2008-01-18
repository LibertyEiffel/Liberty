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
				visit_node(tree.root)
			end
		end

	tree: XML_TREE
	
	visit_node (a_node: XML_NODE) is
		require node_not_void: a_node/=Void
		local i: INTEGER; a_child: XML_NODE; str: STRING
		do
			from i:=1 until i>a_node.attributes_count loop
				str:=""; str.append(a_node.attribute_name(i))
				str.append(once ": '")
				str.append(a_node.attribute_value(i))
				str.append(once "' ")
				io.put_string(str)
				i:=i+1
			end
			io.put_new_line	

			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child/=Void then visit_node(a_child) end
				i:=i+1
			end
		end

	visit (a_node: XML_NODE) is
		require node_not_void: a_node/=Void
		local i: INTEGER; a_child: XML_NODE; str: STRING
		do
			inspect a_node.name
			when "Function" then
			when "Struct" then
			end
			from i:=1 until i>a_node.attributes_count loop
				str:=""; str.append(a_node.attribute_name(i))
				str.append(once ": '")
				str.append(a_node.attribute_value(i))
				str.append(once "' ")
				io.put_string(str)
				i:=i+1
			end
			io.put_new_line	

			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child/=Void then visit_node(a_child) end
				i:=i+1
			end
		end

end 
