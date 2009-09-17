deferred class RESOURCE_LOCATOR
	--
	-- Implementation of URL
	--

insert
	RECYCLABLE
		redefine
			is_equal
		end

feature {ANY}
	uri: STRING is
		deferred
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := uri.is_equal(other.uri)
		end

feature {URL_VALIDITY}
	valid_uri (a_uri: STRING): BOOLEAN is
		deferred
		end

feature {URL} -- URL data:
	absolute_uri (a_uri: STRING): BOOLEAN is
		require
			valid_uri(a_uri)
		deferred
		end

	relative_uri (a_uri: STRING): BOOLEAN is
		require
			valid_uri(a_uri)
		do
			Result := not absolute_uri(a_uri)
		end

	set_relative (a_uri: STRING) is
		require
			relative_uri(a_uri)
		deferred
		end

end -- class RESOURCE_LOCATOR
