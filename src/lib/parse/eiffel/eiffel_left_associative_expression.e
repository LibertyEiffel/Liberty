-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION

feature {EIFFEL_GRAMMAR}
	expression_name: STRING
	operator_names: COLLECTION[STRING]
	right_node: EIFFEL_NODE
	operator_nodes: COLLECTION[EIFFEL_NODE]

	set (a_expression_name: like expression_name; a_operator_names: like operator_names;
	     a_right_node: like right_node; a_operator_nodes: like operator_nodes) is
		do
			expression_name := a_expression_name
			operator_names := a_operator_names
			right_node := a_right_node
			operator_nodes := a_operator_nodes
		ensure
			expression_name = a_expression_name
			operator_names = a_operator_names
			right_node = a_right_node
			operator_nodes = a_operator_nodes
		end

end -- class EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
