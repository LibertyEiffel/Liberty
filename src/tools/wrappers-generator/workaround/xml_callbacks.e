-- See the Copyright notice at the end of th file.
--
deferred class XML_CALLBACKS
	--
	-- Catch parsing events sent by the XML parser.
	--
	-- '''Caveat:''' expect those features to always receive the same STRING object with different values. You
	-- should take care of twinning the object if you want to keep it.
	--
	-- See also XML_PARSER
	--
feature {XML_PARSER}
	set_validator (a_validator: like validator)
			-- Sets a validator for th XML file. The parser uses it when setting a DTD, but you may use it too
			-- to implement other validators (such as an XML Schema).
		require
			validator = Void
			a_validator /= Void
		do
			validator := a_validator
		ensure
			validator = a_validator
		end

	validator: XML_VALIDATOR
			-- The XML validator for th file (DTD, XML Schema...)

	with_attribute (attribute_name: STRING; attribute_value: STRING; line, column: INTEGER)
			-- Called by the parser to add an attribute of a node BEFORE calling `open_node'
		require
			not attribute_name.is_empty
			-- not attribute_value.is_empty
		deferred
		end

	open_node (node_name: STRING; line, column: INTEGER)
			-- When the parser reads an opening node
		require
			not node_name.is_empty
		deferred
		ensure
			current_node.is_equal(node_name)
		end

	close_node (node_name: STRING; line, column: INTEGER)
			-- When the parser reads a closing node
		require
			not node_name.is_empty
			current_node.is_equal(node_name)
		deferred
		end

	open_close_node (node_name: STRING; line, column: INTEGER)
			-- When the parser reads a node that opens and closes immediately (syntax "<node/>")
		require
			not node_name.is_empty
		deferred
		end

	xml_header (line, column: INTEGER)
			-- Called by the parser if a "<?xml ... ?>" header is read.
			-- Note that with_attribute may have been called first (usually with the version and encoding
			-- attributes)
		deferred
		end

	processing_instruction (a_target, a_data: STRING)
			-- Called by the parser if a "<?...?>" processing instruction is read.
		deferred
		end

	entity (a_entity: STRING; line, column: INTEGER): STRING
			-- Called by the parser when an '''&entity;''' is found. Note that standard XML attributes (''lt'',
			-- ''gt'', ''amp'', ''apos'' and ''quot'') are automatically handled and not given to th feature
			-- (they cannot be bypassed).
			-- Returns Void if the entity is not recognized.
		deferred
		end

	current_node: STRING
			-- The current node
		deferred
		end

	data (a_data: STRING; line, column: INTEGER)
			-- Called by the parser when the node contains raw data
		require
			not a_data.is_empty
		deferred
		end

	parse_error (line, column: INTEGER; message: STRING)
			-- Called by the parser if there is an error
		require
			message /= Void
		deferred
		ensure
			at_error
		end

	at_error: BOOLEAN
			-- True if there was at least an error
		deferred
		end

end -- class XML_CALLBACKS
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
