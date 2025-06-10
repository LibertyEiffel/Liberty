class C_UNION

inherit
    IDENTIFIED_NODE undefine set_name end
   CONTEXTED_NODE undefine set_name end

       -- hence also a STORABLE_NODE, a NAMED_NODE
      -- and a WRAPPER_CLASS
  COMPOSED_NODE

   FILED_NODE undefine set_name end

      -- TODO: since it's both named and filed it could also be a MOVABLE_NODE

insert NAME_CONVERTER

create {CASTXML_TREE}
   make

feature {ANY}
   store
      do
         create {LINKED_LIST[C_FIELD]} fields.make
         types.fast_put(Current, id)
         if is_named then
            symbols.put(Current, c_string_name)
         else
             log.info.put_line("Anonimous union at line #(1)%N" # &line_row)
         end

         composed_types.fast_put(Current, id)
      end

   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False

   c_type: STRING "union"

   wrapper_type: STRING
      do
         log.error.put_line (once "C_UNION.wrapper_type requires creation of external/expanded types; currently returning an empty string")
         Result := ""
         not_yet_implemented
      end

   suffix: STRING "_UNION"
         -- invariant name.is_equal(once U"Union")

end -- class C_UNION

-- Copyright (C) 2008-2025: Paolo Redaelli
--
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
