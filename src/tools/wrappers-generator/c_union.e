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
          debug
              print(once "C_UNION.wrapper_type requires creation%
              % of external/expanded types; currently returning an empty string")
          end
      not_yet_implemented
  end

   emit_wrapper
       -- Emit a reference wrapper for Current C structure.
       -- A reference wrapper handles the structure as a memory area referred by a pointer.
       -- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types"
      do
          log(once "C_UNION.emit_wrapper not yet implemented.%N")
      end

   suffix: STRING "_UNION"
         -- invariant name.is_equal(once U"Union")

end -- class C_UNION
-- Copyright 2008,2009,2010 Paolo Redaelli
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
