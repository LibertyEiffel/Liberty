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
   eiffel_name: FIXED_STRING is
      do
         Result := name.intern
      end

   name: STRING is
      deferred
      end

   name_at (index: INTEGER): FIXED_STRING is
      do
         Result := nodes.item(index).name
      end

   node_at (index: INTEGER): EIFFEL_NODE is
      do
         Result := nodes.item(index)
      end

   valid_index (index: INTEGER): BOOLEAN is
      do
         Result := index.in_range(lower, upper)
      end

   lower: INTEGER is 0

   upper: INTEGER is
      do
         Result := count - 1
      end

   count: INTEGER is
      deferred
      end

   is_empty: BOOLEAN is
      do
         Result := count = 0
      end

   accept (v: VISITOR) is
      do
         check False end
      end

feature {EIFFEL_GRAMMAR}
   set (index: INTEGER; node: EIFFEL_NODE) is
      do
         nodes.put(node, index)
      end

feature {EIFFEL_NODE_HANDLER}
   display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING) is
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

   generate (o: OUTPUT_STREAM) is
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
   possible_counts: SET[INTEGER] is
      deferred
      end

   nodes: FAST_ARRAY[EIFFEL_NODE]

   make (a_name: like eiffel_name; a_names: TRAVERSABLE[FIXED_STRING]) is
      require
         valid_name(a_name)
         possible_counts.has(a_names.count)
      do
         create nodes.make(a_names.count)
      ensure
         nodes.count = a_names.count
      end

   valid_name (a_name: like eiffel_name): BOOLEAN is
      do
         Result := a_name = eiffel_name
      end

invariant
   count = nodes.count
   possible_counts.has(count)

end
