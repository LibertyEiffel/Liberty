class C_UNION

inherit
   C_TYPE
   IDENTIFIED_NODE
   NAMED_NODE
      -- using the definition made in WRAPPER_CLASS
      undefine compute_eiffel_name
      end
   CONTEXTED_NODE
   FILED_NODE
      -- TODO: since it's both named and filed it could also be a MOVABLE_NODE
   COMPOSED_NODE
      -- using the definition made in WRAPPER_CLASS
      undefine compute_eiffel_name
      end
   WRAPPER_CLASS

create {GCCXML_TREE}
   make

feature {ANY}
   store
      do
         create {LINKED_LIST[C_FIELD]} fields.make
         types.fast_put(Current, id)
         if is_named then
            symbols.put(Current, c_string_name)
         end

         composed_types.fast_put(Current, id)
      end

   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False

   c_type: STRING "union"

   wrapper_type: STRING
      do
         not_yet_implemented
      end

   is_to_be_emitted: BOOLEAN
      do
         not_yet_implemented
      end

   emit_wrapper
      do
         log(once "C_UNION.emit_wrapper not yet implemented.%N")
      end

   suffix: STRING "_UNION"
         -- invariant name.is_equal(once U"Union")

end -- class C_UNION
-- Copyright (C) 2008-2016: ,2009,2010 Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
