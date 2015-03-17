-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_AST_NON_TERMINAL_NODE

inherit
   EIFFEL_NON_TERMINAL_NODE
      rename
         name as eiffel_name
      end

feature {ANY}
   eiffel_name: FIXED_STRING
      do
         Result := name.intern
      end

   name: STRING
      deferred
      end

   name_at (index: INTEGER): FIXED_STRING
      do
         Result := nodes.item(index).name
      end

   node_at (index: INTEGER): EIFFEL_NODE
      do
         Result := nodes.item(index)
      end

   valid_index (index: INTEGER): BOOLEAN
      do
         Result := index.in_range(lower, upper)
      end

   lower: INTEGER 0

   upper: INTEGER
      do
         Result := count - 1
      end

   count: INTEGER
      deferred
      end

   is_empty: BOOLEAN
      do
         Result := count = 0
      end

   accept (v: VISITOR)
      do
         check False end
      end

feature {EIFFEL_GRAMMAR}
   set (index: INTEGER; node: EIFFEL_NODE)
      do
         nodes.put(node, index)
      end

feature {EIFFEL_NODE_HANDLER}
   display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING)
      local
         i: INTEGER
      do
         do_indent(output, indent, p)
         output.put_character('"')
         output.put_string(name)
         output.put_line(once "%":")
         from
            i := lower
         until
            i > upper
         loop
            node_at(i).display(output, indent + 1, " * ")
            i := i + 1
         end
      end

   generate (o: OUTPUT_STREAM)
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            node_at(i).generate(o)
            i := i + 1
         end
         generate_forgotten(o)
      end

feature {}
   possible_counts: SET[INTEGER]
      deferred
      end

   nodes: FAST_ARRAY[EIFFEL_NODE]

   make (a_name: like eiffel_name; a_names: TRAVERSABLE[FIXED_STRING])
      require
         valid_name(a_name)
         possible_counts.has(a_names.count)
      do
         create nodes.make(a_names.count)
      ensure
         nodes.count = a_names.count
      end

   valid_name (a_name: like eiffel_name): BOOLEAN
      do
         Result := a_name = eiffel_name
      end

invariant
   count = nodes.count
   possible_counts.has(count)

end
