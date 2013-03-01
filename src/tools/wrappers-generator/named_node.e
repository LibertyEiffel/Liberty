deferred class NAMED_NODE
	-- A GCC_XML node that may have a "name" attribute.

	-- It is made comparable using the `eiffel_name' feature as sorting value to get a more stable output.
inherit 
	GCCXML_NODE
	COMPARABLE undefine is_equal end
insert NAME_CONVERTER

feature -- Comparability
   infix "<" (other: like Current): BOOLEAN is
	   -- Comparison made on the name used in the wrappers
	  do
		  Result := Current.eiffel_name < other.eiffel_name
      end

feature
	is_anonymous: BOOLEAN is
		-- Is Current node anonynmous?
	do
		Result := not is_named
	end

	is_named: BOOLEAN is
		-- Does Current actually have a name?
	do
		Result := attributes.has(once U"name")
	end

	c_name: UNICODE_STRING is
		do
			if cached_c_name=Void then
				cached_c_name:=attribute_at(once U"name")
			end
			Result:=cached_c_name
		ensure is_named implies Result/=Void
		end

	c_string_name: STRING is
		do
			if c_name/=Void then
				if cached_c_string_name=Void then
					cached_c_string_name:=c_name.to_utf8
				end
				Result:=cached_c_string_name
			end
		end

	eiffel_name: STRING is
		-- the name of Current when wrapped in Liberty Eiffel.
	do
		if cached_eiffel_name=Void then
			compute_eiffel_name
		end
		Result:=cached_eiffel_name
	end


	is_public: BOOLEAN is
		-- Does `c_name' start with an alphabetical character? Names
		-- starting with underscores or other strange characters are
		-- usually considered private in C/C++ languages.
	do
		Result := c_name/=Void and then c_name.first.to_character.is_letter
	end

feature {} -- Implementation
	cached_c_name: UNICODE_STRING
	cached_c_string_name: STRING
	cached_eiffel_name: STRING

	compute_eiffel_name is
		require is_named
		do
			cached_eiffel_name:=eiffel_feature(c_string_name)
			check 
				is_public: cached_eiffel_name.first/='_'
				not cached_eiffel_name.has_substring("__")	
			end
		ensure cached_eiffel_name/=Void
		end

end -- class NAMED_NODE

-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
