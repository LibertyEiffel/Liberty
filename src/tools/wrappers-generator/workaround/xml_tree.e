-- See the Copyright notice at the end of th file.
--
class XML_TREE
	--
	-- DOM-like representation of an XML document
	--
	-- See also XML_PARSER
	--

inherit
	XML_CALLBACKS

create {ANY}
	make, with_error_handler

feature {ANY}
	root: XML_NODE
			-- The root of the tree

	attribute_at (a_attribute_name: STRING): STRING
			-- Usually to recover the "version" or "encoding" attributes
		do
			Result := tree_attributes.reference_at(a_attribute_name)
		end

	set_processing_instruction (target: STRING; processor: PROCEDURE[TUPLE[STRING]])
		require
			target /= Void
			processor /= Void
		local
			processors: FAST_ARRAY[PROCEDURE[TUPLE[STRING]]]
		do
			processors := processing_instructions.reference_at(target)
			if processors = Void then
				create processors.make(0)
				processing_instructions.add(processors, target.twin)
			end
			processors.add_last(processor)
		end

feature {}
	attributes: HASHED_DICTIONARY[STRING, STRING]

	tree_attributes: like attributes

	open_nodes: STACK[XML_NODE]

	processing_instructions: HASHED_DICTIONARY[FAST_ARRAY[PROCEDURE[TUPLE[STRING]]], STRING]
		once
			create Result.make
		end

feature {XML_PARSER}
	with_attribute (attribute_name: STRING; attribute_value: STRING; line, column: INTEGER)
		do
			if attribute_value=Void
			 then attributes.put(Void, attribute_name.twin)
			else attributes.put(attribute_value.twin, attribute_name.twin)
			end
		end

	open_node (node_name: STRING; line, column: INTEGER)
		local
			node: XML_NODE; i: INTEGER
		do
			node := new_node(node_name.twin, line, column)
			from
				i := attributes.lower
			until
				i > attributes.upper
			loop
				node.set_attribute(attributes.key(i), attributes.item(i))
				i := i + 1
			end
			attributes.clear_count
			open_nodes.push(node)
		end

	close_node (node_name: STRING; line, column: INTEGER)
		local
			node: XML_NODE
		do
			node := open_nodes.top
			open_nodes.pop
			if open_nodes.is_empty then
				root := node
			else
				open_nodes.top.add_child(node)
			end
		end

	open_close_node (node_name: STRING; line, column: INTEGER)
		do
			open_node(node_name, line, column)
			close_node(node_name, line, column)
		end

	xml_header (line, column: INTEGER)
		do
			check
				tree_attributes.is_empty
			end
			tree_attributes.copy(attributes)
			attributes.clear_count
		end

	processing_instruction (a_target, a_data: STRING)
		local
			processors: FAST_ARRAY[PROCEDURE[TUPLE[STRING]]]; i: INTEGER
		do
			processors := processing_instructions.reference_at(a_target)
			if processors /= Void then
				from
					i := processors.lower
				until
					i > processors.upper
				loop
					processors.item(i).call([a_data])
					i := i + 1
				end
			end
		end

	current_node: STRING
		do
			if not open_nodes.is_empty then
				Result := open_nodes.top.name
			end
		end

	entity (a_entity: STRING; line, column: INTEGER): STRING
		do
			-- The default tree does not recognize any other entity than XML defaults.
		end

	data (a_data: STRING; line, column: INTEGER)
		do
			open_nodes.top.set_data(a_data.twin)
		end

	parse_error (line, column: INTEGER; message: STRING)
		do
			at_error := True
			if error_handler /= Void then
				error_handler.call([line, column, message])
			else
				std_error.put_string(message)
				std_error.put_string(" at line ")
				std_error.put_integer(line)
				std_error.put_string(", column ")
				std_error.put_integer(column)
				std_error.put_new_line
				die_with_code(1)
			end
		end

	at_error: BOOLEAN

feature {}
	error_handler: PROCEDURE[TUPLE[INTEGER, INTEGER, STRING]]

	make (in: INPUT_STREAM)
			-- read the xml tree in the given input stream
		require
			in.is_connected
		do
			create attributes.make
			create tree_attributes.make
			create open_nodes.make
			parser.connect_to(in)
			parser.parse(Current)
		end

	with_error_handler (in: INPUT_STREAM; a_error_handler: like error_handler)
		do
			error_handler := a_error_handler
			make(in)
		end

	new_node (node_name: STRING; line, column: INTEGER): XML_NODE
		do
			create Result.make(node_name, line, column)
		end

	parser: XML_PARSER
		once
			create Result.make
		end

end -- class XML_TREE
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publh, dtribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and th permsion notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
