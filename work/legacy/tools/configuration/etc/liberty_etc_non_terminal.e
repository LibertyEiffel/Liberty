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
class LIBERTY_ETC_NON_TERMINAL

inherit
   EIFFEL_NON_TERMINAL_NODE

insert
   EIFFEL_NON_TERMINAL_NODE_IMPL
      rename
         make as impl_make
      export
         {} all
      redefine
         accept
      end

create {LIBERTY_ETC_FACTORY}
   make

feature {ANY}
   accept (a_visitor: VISITOR) is
      local
         v: LIBERTY_ETC_VISITOR
      do
         v ::= a_visitor
         visitor.call([v, Current])
      end

feature {}
   make (a_name: FIXED_STRING; a_names: like names; a_visitor: like visitor) is
      require
         a_name /= Void
         a_visitor /= Void
         a_names /= Void
      do
         impl_make(a_name, a_names)
         visitor := a_visitor
      ensure
         name = a_name
         visitor = a_visitor
         names = a_names
      end

   visitor: PROCEDURE[TUPLE[LIBERTY_ETC_VISITOR, LIBERTY_ETC_NON_TERMINAL]]

invariant
   visitor /= Void

end -- class LIBERTY_ETC_NON_TERMINAL
