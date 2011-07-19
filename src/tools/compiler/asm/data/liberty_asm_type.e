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
class LIBERTY_ASM_TYPE

insert
   ANY
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   id: INTEGER

   attributes_count: INTEGER
         -- Number of attributes

   methods_count: INTEGER is
      do
         Result := methods.count
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := id = other.id
            and then attributes_count = other.attributes_count
            and then methods.count = other.methods.count
            and then methods.for_all(agent other.methods.has)
      end

   method (index: INTEGER): LIBERTY_ASM_METHOD is
      require
         index.in_range(0, methods_count - 1)
      do
         Result := methods.item(index)
      ensure
         Result /= Void
      end

   do_all_methods (action: PROCEDURE[TUPLE[LIBERTY_ASM_METHOD]]) is
      require
         action /= Void
      do
         methods.do_all(action)
      end

   resolve_method (method_id: INTEGER): LIBERTY_ASM_METHOD is
      do
         if methods.valid_index(method_id) then
            Result := method(method_id)
         end
      end

feature {LIBERTY_ASM_METHOD}
   add_method (a_method: LIBERTY_ASM_METHOD): INTEGER is
      require
         a_method /= Void
         resolve_method(a_method.id) = Void
      do
         Result := methods.count
         methods.add_last(a_method)
      ensure
         methods_count = old methods_count + 1
         method(methods_count - 1) = a_method
      end

   has_method (a_method: LIBERTY_ASM_METHOD): BOOLEAN is
      require
         a_method.type = Current
      do
         Result := methods.valid_index(a_method.id) and then methods.item(a_method.id) = a_method
      ensure
         assertions_only_because_it_is_obvious: Result
      end

feature {}
   make (a_id: like id; a_attributes_count: like attributes_count) is
      require
         a_attributes_count >= 0
      do
         id := a_id
         attributes_count := a_attributes_count
         create methods.make(0)
      ensure
         id = a_id
         attributes_count = a_attributes_count
      end

feature {LIBERTY_ASM_TYPE}
   methods: FAST_ARRAY[LIBERTY_ASM_METHOD]

invariant
   attributes_count >= 0
   methods /= Void

end -- class LIBERTY_ASM_TYPE
