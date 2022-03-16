deferred class NAMED_NODE
   -- A GCC_XML node that MAY have a "name" attribute.

   -- Comparable using the `eiffel_name' feature for comparison to get a more stable output.

   -- Nameless nodes are considered non-public

inherit
   GCCXML_NODE
   COMPARABLE
      undefine is_equal
      end

insert
   NAME_CONVERTER

feature {ANY} -- Comparability
   infix "<" (other: NAMED_NODE): BOOLEAN
         -- Comparon made on the name used in the wrappers
      do
         Result := Current.eiffel_name < other.eiffel_name
      end

feature {ANY}
   is_anonymous: BOOLEAN
         -- Is Current node anonynmous? 
      do
         Result := not is_named
      end

   is_named: BOOLEAN
         -- Does Current actually have a name?
      do
		  Result := attributes.has(once U"name") and then not c_name.is_empty
      end

   c_name: UNICODE_STRING
      do
		  Result := attribute_at(once U"name")
      ensure
         is_named implies Result /= Void
      end

   c_string_name: STRING
	  local a_name: UNICODE_STRING
      do
		  a_name := c_name
		  if a_name/=Void then 
			  Result:= c_name.to_utf8
		  end
      end

   eiffel_name: STRING
         -- the name of Current when wrapped in Liberty Eiffel.
      do
         if cached_eiffel_name = Void then
            compute_eiffel_name
         end
         Result := cached_eiffel_name
      end

   is_public: BOOLEAN
         -- Does Current node have a name and does it start with an alphabetical character? Names
         -- starting with underscores or other strange characters are
         -- usually considered private in C/C++ languages.
      do
          Result := is_named and then c_name.first.to_character.is_letter
      end

feature {} -- Implementation
   cached_eiffel_name: STRING

   compute_eiffel_name
      do
         if is_named then
            cached_eiffel_name := eiffel_feature(c_string_name)
            check
               is_public: cached_eiffel_name.first /= '_'
               not cached_eiffel_name.has_substring("__")
            end
         elseif has_assigned_name then
            cached_eiffel_name := eiffel_feature(assigned_name)
         else
            -- Actually trying to wrap a nameless element that is not
            -- identified by its position in a file is quite hopeless. We
            -- neverethells may assign a unique name, using the line of the
            -- gccxml file as unique id. Quite a shameless trick, but I guess
            -- that such elements are quite esoteric and unreachable and
            -- unusable also on C level.
            create cached_eiffel_name.make_from_string(once "anonymous_gccxml_element_at_line_#(1)_r#(2)" # &line # &column)
            -- TODO once we have convert this create will be mimicked by a simple assignment.
            -- It could also be written like this:
            -- cached_eiffel_name := (once "anonymous_gccxml_element_at_l#(1)_r#(2)" # &line # &column).string
         end
      ensure
         cached_eiffel_name /= Void
      end

end -- class NAMED_NODE
-- Copyright (C) 2008-2022: Paolo Redaelli
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
