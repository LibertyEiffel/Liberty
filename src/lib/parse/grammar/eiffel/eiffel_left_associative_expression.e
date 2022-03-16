-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION

feature {EIFFEL_GRAMMAR}
   expression_name: FIXED_STRING
   right_node: EIFFEL_NODE
   operator_nodes: COLLECTION[EIFFEL_NODE]

   set (a_expression_name: like expression_name; a_operator_names: like operator_names;
        a_right_node: like right_node; a_operator_nodes: like operator_nodes)
      require
         a_operator_names.for_all(agent (o: ABSTRACT_STRING): BOOLEAN do Result := o /= Void end (?))
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

   append_operators_in (operators: COLLECTION[FIXED_STRING])
      require
         operators /= Void
      local
         i: INTEGER
      do
         from
            i := operator_names.lower
         until
            i > operator_names.upper
         loop
            operators.add_last(operator_names.item(i).intern)
            i := i + 1
         end
      end

   operator_names_out: STRING
      do
         Result := operator_names.out
      end

feature {}
   operator_names: COLLECTION[ABSTRACT_STRING]

end -- class EIFFEL_LEFT_ASSOCIATIVE_EXPRESSION
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
