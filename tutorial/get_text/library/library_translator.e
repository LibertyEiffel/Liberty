class LIBRARY_TRANSLATOR

inherit
	DOMAIN_GET_TEXT[STRING]

creation
	connect_to

feature {ANY}
	text_domain: STRING is "library_example_library"

end
