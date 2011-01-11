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
class LIBERTY_ASM_INSTRUCTION_PROXY

inherit
   LIBERTY_ASM_INSTRUCTION
      redefine
         is_equal
      end

create {LIBERTY_ASM_READER}
   new, invoke, jump

feature {ANY}
   is_equal (other: like Current): BOOLEAN is
      do
         equal_visitor.start(Current)
         equal_visitor.confirm(other)
         Result := equal_visitor.confirmed and then Precursor(other)
      end

   accept (visitor: LIBERTY_ASM_VISITOR) is
      local
         v: LIBERTY_ASM_PROXY_VISITOR
      do
         v ::= visitor
         accepter.call([v])
      end

feature {}
   accepter: PROCEDURE[TUPLE[LIBERTY_ASM_PROXY_VISITOR]]

   new (type_id: INTEGER) is
      do
         accepter := agent {LIBERTY_ASM_PROXY_VISITOR}.visit_proxy_new(Current, type_id)
      end

   invoke (method_id, type_id: INTEGER) is
      do
         accepter := agent {LIBERTY_ASM_PROXY_VISITOR}.visit_proxy_invoke(Current, method_id, type_id)
      end

   jump (a_position: INTEGER) is
      do
         accepter := agent {LIBERTY_ASM_PROXY_VISITOR}.visit_proxy_jump(Current, a_position)
      end

   equal_visitor: LIBERTY_ASM_INSTRUCTION_PROXY_EQUAL_VISITOR is
      once
         create Result.make
      end

invariant
   accepter /= Void

end -- class LIBERTY_ASM_INSTRUCTION_PROXY
