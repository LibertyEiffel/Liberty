class ANY_STRING

inherit
   ANY

create {ANY}
   make_from_string

feature {}
   make_from_string (a_string: like string)
      do
         string := a_string
      end

   string: STRING

end
