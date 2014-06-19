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
deferred class LIBERTY_TYPE_CONVERTER

feature {LIBERTY_UNIVERSE} -- Legacy conversion rules
   convert_integer_8_16
      deferred
      end

   convert_integer_8_32
      deferred
      end

   convert_integer_8_64
      deferred
      end

   convert_integer_16_32
      deferred
      end

   convert_integer_16_64
      deferred
      end

   convert_integer_32_64
      deferred
      end

   convert_real_32_64
      deferred
      end

   convert_real_32_80
      deferred
      end

   convert_real_32_128
      deferred
      end

   convert_real_64_80
      deferred
      end

   convert_real_64_128
      deferred
      end

   convert_real_80_128
      deferred
      end

   convert_integer_64_real_128
      deferred
      end

   convert_integer_64_real_80
      deferred
      end

   convert_integer_32_real_128
      deferred
      end

   convert_integer_32_real_80
      deferred
      end

   convert_integer_32_real_64
      deferred
      end

   convert_integer_16_real_128
      deferred
      end

   convert_integer_16_real_80
      deferred
      end

   convert_integer_16_real_64
      deferred
      end

   convert_integer_16_real_32
      deferred
      end

   convert_integer_8_real_128
      deferred
      end

   convert_integer_8_real_80
      deferred
      end

   convert_integer_8_real_64
      deferred
      end

   convert_integer_8_real_32
      deferred
      end

feature {LIBERTY_ACTUAL_TYPE}
   convert_with_feature (a_convert_feature: LIBERTY_FEATURE)
         -- ECMA-inspired explicit convert mechanism.
         -- Not yet implemented.
      do
         not_yet_implemented
      end

end -- class LIBERTY_TYPE_CONVERTER
