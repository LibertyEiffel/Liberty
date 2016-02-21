class C_STRUCT_NODE
   -- A "Struct" node of an XML file made by gccxml.

inherit
    IDENTIFIED_NODE undefine set_name end
    CONTEXTED_NODE undefine set_name end
   COMPOSED_NODE
      -- hence also a STORABLE_NODE, a NAMED_NODE
      -- and a WRAPPER_CLASS
   FILED_NODE undefine set_name end

      -- TODO: since it's both named and filed it could also be a MOVABLE_NODE

insert
   NAME_CONVERTER

create {GCCXML_TREE}
   make

feature {ANY}
   store
	  do
		  create {LINKED_LIST[C_FIELD]} fields.make
		  types.put(Current, id)
		  if is_named then
			  symbols.put(Current, c_string_name)
		  else
			  log("Anonymous struct at line #(1)%N" # line_row.as_utf8)
		  end

		  composed_types.put(Current, id)
	  end

   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False

   c_type: STRING
      do
          Result := once "struct"
          -- Note: 2016-01-01 I cannot work out why this query were once
          -- written as if it depended on the value of the artificial
          -- attribute; I inspected the XML made by castxml but coulnd't find
          -- any feasible reason; I leave here it here commented out

          -- if is_artificial then
          --    Result := once "struct"
          -- else
          --    Result := once ""
          -- end
      end

   wrapper_type: STRING
      do
         debug
            print(once "C_STRUCT_NODE.wrapper_type requires creation%
                                % of external/expanded types; currently returning an empty string")
         end
         not_yet_implemented -- Result := eiffel_name
      end

   suffix: STRING "_STRUCT"

end -- class C_STRUCT_NODE
-- Copyright (C) 2008-2016: Paolo Redaelli
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
