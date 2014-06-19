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
deferred class LIBERTY_FEATURE_ACCELERATOR
   --
   -- Allows to visit a feature depending on its name. A default implementation is provided to allow to
   -- redefine only relevant parts.
   --

feature {LIBERTY_FEATURE_LOCAL_CONTEXT}
   call_implies (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_or_else (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_or (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_xor (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_and_then (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_and (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_less_or_equal (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_less_than (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_greater_or_equal (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_greater_than (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_add (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_subtract (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_times (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_divide (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_int_divide (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_int_remainder (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_power (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_positive (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_negative (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_not (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_free_prefix (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_free_infix (f: LIBERTY_FEATURE)
      do
         check False end
      end

   call_other (f: LIBERTY_FEATURE)
      do
         check False end
      end

end -- class LIBERTY_FEATURE_ACCELERATOR
