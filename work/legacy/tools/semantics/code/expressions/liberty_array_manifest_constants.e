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
class LIBERTY_ARRAY_MANIFEST_CONSTANTS

feature {}
   manifest_put_feature_name: LIBERTY_FEATURE_NAME
      once
         create Result.make("manifest_put".intern)
      end

   manifest_make_feature_name: LIBERTY_FEATURE_NAME
      once
         create Result.make("manifest_make".intern)
      end

   manifest_creation_feature_name: LIBERTY_FEATURE_NAME
      once
         create Result.make("manifest_creation".intern)
      end

feature {}
   expression_separator (exp: LIBERTY_AST_EXPRESSION): LIBERTY_ARRAY_MANIFEST_SEPARATOR
      do
         if exp.forgotten /= Void and then not exp.forgotten.is_empty then
            inspect
               exp.forgotten.first.name
            when "KW ," then
               Result := separator_comma
            when "KW ;" then
               Result := separator_semi_colon
            else
               check Result = separator_none end
            end
         else
            check Result = separator_none end
         end
      end

feature {}
   separator_comma: LIBERTY_ARRAY_MANIFEST_SEPARATOR
      once
         Result.set(1)
      end

   separator_semi_colon: LIBERTY_ARRAY_MANIFEST_SEPARATOR
      once
         Result.set(2)
      end

   separator_none: LIBERTY_ARRAY_MANIFEST_SEPARATOR
      once
         Result.set(0)
      end

end -- class LIBERTY_ARRAY_MANIFEST_CONSTANTS
