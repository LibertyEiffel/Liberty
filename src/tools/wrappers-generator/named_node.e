deferred class NAMED_NODE
	-- A GCC_XML node that may have a "name" attribute
inherit GCCXML_NODE
feature
	c_name: UNICODE_STRING is
		do
			if cached_c_name=Void then
				cached_c_name:=attribute_at(once U"name")
			end
			Result:=cached_c_name
		end

	c_string_name: STRING is
		do
			if cached_c_string_name=Void then
				cached_c_string_name:=c_name.to_utf8
			end
			Result:=cached_c_string_name
		end

	is_public: BOOLEAN is
		-- Does `c_name' start with an alphabetical character? Names
		-- starting with underscores or other strange characters are
		-- usually considered private in C/C++ languages.
	require c_name/=Void
	do
		Result := c_name.first.to_character.is_letter
	end



feature {} -- Implementation
	cached_c_name: UNICODE_STRING
	cached_c_string_name: STRING
end -- class NAMED_NODE

