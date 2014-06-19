class LIBRARY_TRANSLATOR

inherit
   DOMAIN_GET_TEXT[STRING]

create {ANY}
   connect_to

feature {ANY}
   text_domain: STRING "library_example_library"

end -- class LIBRARY_TRANSLATOR
