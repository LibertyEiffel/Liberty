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
expanded class LIBERTY_MAIN_CHECK_LEVEL

feature {ANY}
   is_all_checked: BOOLEAN is
         -- must check "check" sections and loop variants
      do
         Result := value <= check_all
      end

   is_invariant_checked: BOOLEAN is
         -- must check (class and loop) invariants
      do
         Result := value <= check_invariant
      end

   is_ensure_checked: BOOLEAN is
         -- must check feature postconditions
      do
         Result := value <= check_ensure
      end

   is_require_checked: BOOLEAN is
         -- must check feature preconditions
      do
         Result := value <= check_require
      end

feature {LIBERTY_MAIN}
   valid_arg (arg: STRING): BOOLEAN is
      do
         inspect
            arg
         when "all", "invariant", "ensure", "require", "none" then
            Result := True
         else
         end
      end

   set (arg: STRING): LIBERTY_MAIN_CHECK_LEVEL is
      do
         inspect
            arg
         when "all" then
            value := check_all
         when "invariant" then
            value := check_invariant
         when "ensure" then
            value := check_ensure
         when "require" then
            value := check_require
         when "none" then
            value := check_none
         else
            check False end
         end
         Result := Current
      end

feature {}
   value: INTEGER_8

   check_all: INTEGER_8 is 0
   check_invariant: INTEGER_8 is 1
   check_ensure: INTEGER_8 is 2
   check_require: INTEGER_8 is 3
   check_none: INTEGER_8 is 4

invariant
   value.in_range(check_all, check_none)

end -- class LIBERTY_MAIN_CHECK_LEVEL
